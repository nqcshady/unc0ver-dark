//
//  SettingsTableViewController.m
//  Undecimus
//
//  Created by Pwn20wnd on 9/14/18.
//  Copyright © 2018 - 2019 Pwn20wnd. All rights reserved.
//

#include <sys/utsname.h>
#include <sys/sysctl.h>
#import "SettingsTableViewController.h"
#include <common.h>
#include "hideventsystem.h"
#include "remote_call.h"
#include "JailbreakViewController.h"
#include "utils.h"
#include "voucher_swap-poc.h"
#include "necp.h"
#include "kalloc_crash.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

// https://github.com/Matchstic/ReProvision/blob/7b595c699335940f68702bb204c5aa55b8b1896f/Shared/Application%20Database/RPVApplication.m#L102

+ (NSDictionary *)_provisioningProfileAtPath:(NSString *)path {
    NSError *err;
    NSString *stringContent = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:&err];
    stringContent = [stringContent componentsSeparatedByString:@"<plist version=\"1.0\">"][1];
    stringContent = [NSString stringWithFormat:@"%@%@", @"<plist version=\"1.0\">", stringContent];
    stringContent = [stringContent componentsSeparatedByString:@"</plist>"][0];
    stringContent = [NSString stringWithFormat:@"%@%@", stringContent, @"</plist>"];
    
    NSData *stringData = [stringContent dataUsingEncoding:NSASCIIStringEncoding];
    
    NSError *error;
    NSPropertyListFormat format;
    
    id plist = [NSPropertyListSerialization propertyListWithData:stringData options:NSPropertyListImmutable format:&format error:&error];
    
    return plist;
}

#define STATUS_FILE          @"/var/lib/dpkg/status"
#define CYDIA_LIST @"/etc/apt/sources.list.d/cydia.list"

// https://github.com/lechium/nitoTV/blob/53cca06514e79279fa89639ad05b562f7d730079/Classes/packageManagement.m#L1138

+ (NSArray *)dependencyArrayFromString:(NSString *)depends
{
    NSMutableArray *cleanArray = [[NSMutableArray alloc] init];
    NSArray *dependsArray = [depends componentsSeparatedByString:@","];
    for (id depend in dependsArray)
    {
        NSArray *spaceDelimitedArray = [depend componentsSeparatedByString:@" "];
        NSString *isolatedDependency = [[spaceDelimitedArray objectAtIndex:0] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([isolatedDependency length] == 0)
            isolatedDependency = [[spaceDelimitedArray objectAtIndex:1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        [cleanArray addObject:isolatedDependency];
    }
    
    return cleanArray;
}

// https://github.com/lechium/nitoTV/blob/53cca06514e79279fa89639ad05b562f7d730079/Classes/packageManagement.m#L1163

+ (NSArray *)parsedPackageArray
{
    NSString *packageString = [NSString stringWithContentsOfFile:STATUS_FILE encoding:NSUTF8StringEncoding error:nil];
    NSArray *lineArray = [packageString componentsSeparatedByString:@"\n\n"];
    //NSLog(@"lineArray: %@", lineArray);
    NSMutableArray *mutableList = [[NSMutableArray alloc] init];
    //NSMutableDictionary *mutableDict = [[NSMutableDictionary alloc] init];
    for (id currentItem in lineArray)
    {
        NSArray *packageArray = [currentItem componentsSeparatedByString:@"\n"];
        //    NSLog(@"packageArray: %@", packageArray);
        NSMutableDictionary *currentPackage = [[NSMutableDictionary alloc] init];
        for (id currentLine in packageArray)
        {
            NSArray *itemArray = [currentLine componentsSeparatedByString:@": "];
            if ([itemArray count] >= 2)
            {
                NSString *key = [itemArray objectAtIndex:0];
                NSString *object = [itemArray objectAtIndex:1];
                
                if ([key isEqualToString:@"Depends"]) //process the array
                {
                    NSArray *dependsObject = [SettingsTableViewController dependencyArrayFromString:object];
                    
                    [currentPackage setObject:dependsObject forKey:key];
                    
                } else { //every other key, even if it has an array is treated as a string
                    
                    [currentPackage setObject:object forKey:key];
                }
                
                
            }
        }
        
        //NSLog(@"currentPackage: %@\n\n", currentPackage);
        if ([[currentPackage allKeys] count] > 4)
        {
            //[mutableDict setObject:currentPackage forKey:[currentPackage objectForKey:@"Package"]];
            [mutableList addObject:currentPackage];
        }
        
        currentPackage = nil;
        
    }
    
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES
                                                                    selector:@selector(localizedCaseInsensitiveCompare:)];
    NSSortDescriptor *packageDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Package" ascending:YES
                                                                       selector:@selector(localizedCaseInsensitiveCompare:)];
    NSArray *descriptors = [NSArray arrayWithObjects:nameDescriptor, packageDescriptor, nil];
    NSArray *sortedArray = [mutableList sortedArrayUsingDescriptors:descriptors];
    
    mutableList = nil;
    
    return sortedArray;
}

// https://github.com/lechium/nitoTV/blob/53cca06514e79279fa89639ad05b562f7d730079/Classes/packageManagement.m#L854

+ (NSString *)domainFromRepoObject:(NSString *)repoObject
{
    //LogSelf;
    if ([repoObject length] == 0)return nil;
    NSArray *sourceObjectArray = [repoObject componentsSeparatedByString:@" "];
    NSString *url = [sourceObjectArray objectAtIndex:1];
    if ([url length] > 7)
    {
        NSString *urlClean = [url substringFromIndex:7];
        NSArray *secondArray = [urlClean componentsSeparatedByString:@"/"];
        return [secondArray objectAtIndex:0];
    }
    return nil;
}

// https://github.com/lechium/nitoTV/blob/53cca06514e79279fa89639ad05b562f7d730079/Classes/packageManagement.m#L869

+ (NSArray *)sourcesFromFile:(NSString *)theSourceFile
{
    NSMutableArray *finalArray = [[NSMutableArray alloc] init];
    NSString *sourceString = [[NSString stringWithContentsOfFile:theSourceFile encoding:NSASCIIStringEncoding error:nil] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSArray *sourceFullArray =  [sourceString componentsSeparatedByString:@"\n"];
    NSEnumerator *sourceEnum = [sourceFullArray objectEnumerator];
    id currentSource = nil;
    while (currentSource = [sourceEnum nextObject])
    {
        NSString *theObject = [SettingsTableViewController domainFromRepoObject:currentSource];
        if (theObject != nil)
        {
            if (![finalArray containsObject:theObject])
                [finalArray addObject:theObject];
        }
    }
    
    return finalArray;
}

+ (NSDictionary *)getDiagnostics {
    struct utsname u = { 0 };
    uname(&u);
    NSDictionary *systemVersion = [NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return @{
        @"Sysname": @(u.sysname),
        @"Nodename": @(u.nodename),
        @"Release": @(u.release),
        @"Version": @(u.version),
        @"Machine": @(u.machine),
        @"ProductVersion": systemVersion[@"ProductVersion"],
        @"ProductBuildVersion": systemVersion[@"ProductBuildVersion"],
        @"Sources": [SettingsTableViewController sourcesFromFile:CYDIA_LIST],
        @"Packages": [SettingsTableViewController parsedPackageArray],
        @"Preferences": @{
            @"TweakInjection": [defaults objectForKey:K_TWEAK_INJECTION],
            @"LoadDaemons": [defaults objectForKey:K_LOAD_DAEMONS],
            @"DumpAPTicket": [defaults objectForKey:K_DUMP_APTICKET],
            @"RefreshIconCache": [defaults objectForKey:K_REFRESH_ICON_CACHE],
            @"BootNonce": [defaults objectForKey:K_BOOT_NONCE],
            @"Exploit": [defaults objectForKey:K_EXPLOIT],
            @"DisableAutoUpdates": [defaults objectForKey:K_DISABLE_AUTO_UPDATES],
            @"DisableAppRevokes": [defaults objectForKey:K_DISABLE_APP_REVOKES],
            @"OverwriteBootNonce": [defaults objectForKey:K_OVERWRITE_BOOT_NONCE],
            @"ExportKernelTaskPort": [defaults objectForKey:K_EXPORT_KERNEL_TASK_PORT],
            @"RestoreRootFS": [defaults objectForKey:K_RESTORE_ROOTFS],
            @"IncreaseMemoryLimit": [defaults objectForKey:K_INCREASE_MEMORY_LIMIT],
            @"InstallCydia": [defaults objectForKey:K_INSTALL_CYDIA],
            @"InstallOpenSSH": [defaults objectForKey:K_INSTALL_OPENSSH]
        },
        @"AppVersion": appVersion(),
        @"LogFile": [NSString stringWithContentsOfFile:getLogFile() encoding:NSUTF8StringEncoding error:nil]
    };
}

-(void)viewDidLayoutSubviews {
    
    if (self.LightThemeSwitch.isOn)
    {
//        [self.navigationController.view setTintColor:[UIColor whiteColor]];
//        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
//        self.navigationController.navigationBar.translucent = NO;
//
//        [self LightTheme];
//
        //
        self.restartButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];

        self.ShareDiagnosticsDataButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];

        self.OpenCydiaButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];

        self.OpenSileoButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];

        self.ViewSourceCodeButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];

        self.AutoSelectExploitButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];

        self.RestartSpringBoardButton.titleLabel.textColor = [UIColor colorWithRed:0.43 green:0.43 blue:0.45 alpha:1.0];

        self.CleanDiagnosticsDataButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];

        self.CheckForUpdateButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
    }
    else
    {
//        //[myView setBackgroundColor:[UIColor clearColor]];
//        //[self.tableView setBackgroundColor:[UIColor blackColor]];
//        //[self.SettingsTableView setBackgroundColor:[UIColor blackColor]];
//
////        [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
////        UINavigationBar *bar = [self.navigationController navigationBar];
////        [bar setBarTintColor:[UIColor blackColor]];
////        self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
////        [self.navigationController.view setBackgroundColor:[UIColor blackColor]];
        [self.navigationController.view setTintColor:[UIColor blackColor]];
        self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
        self.navigationController.navigationBar.translucent = NO;
////        [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
////        [self.navigationController.navigationBar setTranslucent:NO];
//
//        [self LightTheme];
//
//        self.restartButton.titleLabel.textColor = [UIColor whiteColor];
//        //self.RestartButtonContentView.backgroundColor = [UIColor blackColor];
//
//        self.ShareDiagnosticsDataButton.titleLabel.textColor = [UIColor whiteColor];
//        //self.ShareDiagnosticsDataContentView.backgroundColor = [UIColor blackColor];
//
//        self.OpenCydiaButton.titleLabel.textColor = [UIColor whiteColor];
//        //self.OpenCydiaContentView.backgroundColor = [UIColor blackColor];
//
//        self.OpenSileoButton.titleLabel.textColor = [UIColor whiteColor];
//        //self.OpenSileoContentView.backgroundColor = [UIColor blackColor];
//
//        self.ViewSourceCodeButton.titleLabel.textColor = [UIColor whiteColor];
//        //self.ViewSourceCodeContentView.backgroundColor = [UIColor blackColor];
//
//        self.AutoSelectExploitButton.titleLabel.textColor = [UIColor whiteColor];
//        //self.AutoSelectExploitContentView.backgroundColor = [UIColor blackColor];
//
//        self.RestartSpringBoardButton.titleLabel.textColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1.0];
//        //self.RestartSpringBoardContentView.backgroundColor = [UIColor blackColor];
//
//        self.CleanDiagnosticsDataButton.titleLabel.textColor = [UIColor whiteColor];
//        //self.CleanDiagnosticsDataContentView.backgroundColor = [UIColor blackColor];
//
//        self.CheckForUpdateButton.titleLabel.textColor = [UIColor whiteColor];
//        //self.CheckForUpdateContentView.backgroundColor = [UIColor blackColor];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(10,10,200,200)];
    [myView setAlpha:0];
    [myView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
//    if (self.LightThemeSwitch.isOn)
//    {
    BOOL switchOn = [[NSUserDefaults standardUserDefaults] boolForKey:K_LIGHT_THEME];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (switchOn)
    {
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
            
            statusBar.backgroundColor = [UIColor whiteColor];//set whatever color you like
        }
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        [myView setBackgroundColor:[UIColor clearColor]];
        [self.tableView setBackgroundColor:[UIColor whiteColor]];
        [self.SettingsTableView setBackgroundColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        UINavigationBar *bar = [self.navigationController navigationBar];
        [bar setBarTintColor:[UIColor whiteColor]];
        self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
        [self.navigationController.view setBackgroundColor:[UIColor whiteColor]];
        [self.navigationController.view setTintColor:[UIColor whiteColor]];
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.translucent = NO;
        [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
        [self.navigationController.navigationBar setTranslucent:NO];
        
        [self.navigationController.view setTintColor:[UIColor whiteColor]];
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.translucent = NO;
        
        self.restartButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.ShareDiagnosticsDataButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.OpenCydiaButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.OpenSileoButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.ViewSourceCodeButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.AutoSelectExploitButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.RestartSpringBoardButton.titleLabel.textColor = [UIColor colorWithRed:0.43 green:0.43 blue:0.45 alpha:1.0];
        
        self.CleanDiagnosticsDataButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.CheckForUpdateButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
    }
    else
    {
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
            
            statusBar.backgroundColor = [UIColor blackColor];//set whatever color you like
        }
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        [myView setBackgroundColor:[UIColor clearColor]];
        [self.tableView setBackgroundColor:[UIColor blackColor]];
        [self.SettingsTableView setBackgroundColor:[UIColor blackColor]];
        [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
        UINavigationBar *bar = [self.navigationController navigationBar];
        [bar setBarTintColor:[UIColor blackColor]];
        self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
        [self.navigationController.view setBackgroundColor:[UIColor blackColor]];
        [self.navigationController.view setTintColor:[UIColor blackColor]];
        self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
        self.navigationController.navigationBar.translucent = NO;
        [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
        [self.navigationController.navigationBar setTranslucent:NO];
        
        [self.navigationController.view setTintColor:[UIColor blackColor]];
        self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
        self.navigationController.navigationBar.translucent = NO;
        //        [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
        //        [self.navigationController.navigationBar setTranslucent:NO];
        
        self.restartButton.titleLabel.textColor = [UIColor whiteColor];
        //self.RestartButtonContentView.backgroundColor = [UIColor blackColor];
        
        self.ShareDiagnosticsDataButton.titleLabel.textColor = [UIColor whiteColor];
        //self.ShareDiagnosticsDataContentView.backgroundColor = [UIColor blackColor];
        
        self.OpenCydiaButton.titleLabel.textColor = [UIColor whiteColor];
        //self.OpenCydiaContentView.backgroundColor = [UIColor blackColor];
        
        self.OpenSileoButton.titleLabel.textColor = [UIColor whiteColor];
        //self.OpenSileoContentView.backgroundColor = [UIColor blackColor];
        
        self.ViewSourceCodeButton.titleLabel.textColor = [UIColor whiteColor];
        //self.ViewSourceCodeContentView.backgroundColor = [UIColor blackColor];
        
        self.AutoSelectExploitButton.titleLabel.textColor = [UIColor whiteColor];
        //self.AutoSelectExploitContentView.backgroundColor = [UIColor blackColor];
        
        self.RestartSpringBoardButton.titleLabel.textColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1.0];
        //self.RestartSpringBoardContentView.backgroundColor = [UIColor blackColor];
        
        self.CleanDiagnosticsDataButton.titleLabel.textColor = [UIColor whiteColor];
        //self.CleanDiagnosticsDataContentView.backgroundColor = [UIColor blackColor];
        
        self.CheckForUpdateButton.titleLabel.textColor = [UIColor whiteColor];
        //self.CheckForUpdateContentView.backgroundColor = [UIColor blackColor];
        
    }
    [self.tableView setBackgroundView:myView];
    
    [self.BootNonceTextField setDelegate:self];
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTappedAnyware:)];
    self.tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:self.tap];
    [self reloadData];
    [self LightTheme];
}

- (void)userTappedAnyware:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)reloadData {
    [self.LoadDaemonsSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_LOAD_DAEMONS]];
    [self.DumpAPTicketSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_DUMP_APTICKET]];
    [self.BootNonceTextField setPlaceholder:[[NSUserDefaults standardUserDefaults] objectForKey:K_BOOT_NONCE]];
    [self.BootNonceTextField setText:nil];
    [self.RefreshIconCacheSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_REFRESH_ICON_CACHE]];
    [self.KernelExploitSegmentedControl setSelectedSegmentIndex:[[NSUserDefaults standardUserDefaults] integerForKey:K_EXPLOIT]];
    [self.DisableAutoUpdatesSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_DISABLE_AUTO_UPDATES]];
    [self.DisableAppRevokesSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_DISABLE_APP_REVOKES]];
    [self.KernelExploitSegmentedControl setEnabled:supportsExploit(async_wake_exploit) forSegmentAtIndex:async_wake_exploit];
    [self.KernelExploitSegmentedControl setEnabled:supportsExploit(voucher_swap_exploit) forSegmentAtIndex:voucher_swap_exploit];
    [self.KernelExploitSegmentedControl setEnabled:supportsExploit(mach_swap_exploit) forSegmentAtIndex:mach_swap_exploit];
    [self.KernelExploitSegmentedControl setEnabled:supportsExploit(mach_swap_2_exploit) forSegmentAtIndex:mach_swap_2_exploit];
    [self.OpenCydiaButton setEnabled:[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]];
    [self.OpenSileoButton setEnabled:[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sileo://"]]];
    [self.ExpiryLabel setPlaceholder:[NSString stringWithFormat:@"%d %@", (int)[[SettingsTableViewController _provisioningProfileAtPath:[[NSBundle mainBundle] pathForResource:@"embedded" ofType:@"mobileprovision"]][@"ExpirationDate"] timeIntervalSinceDate:[NSDate date]] / 86400, NSLocalizedString(@"Days", nil)]];
    [self.OverwriteBootNonceSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_OVERWRITE_BOOT_NONCE]];
    [self.ExportKernelTaskPortSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_EXPORT_KERNEL_TASK_PORT]];
    [self.RestoreRootFSSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_RESTORE_ROOTFS]];
    [self.UptimeLabel setPlaceholder:[NSString stringWithFormat:@"%d %@", (int)uptime() / 86400, NSLocalizedString(@"Days", nil)]];
    [self.IncreaseMemoryLimitSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_INCREASE_MEMORY_LIMIT]];
    [self.installSSHSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_INSTALL_OPENSSH]];
    [self.installCydiaSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_INSTALL_CYDIA]];
    [self.ECIDLabel setPlaceholder:hexFromInt([[[NSUserDefaults standardUserDefaults] objectForKey:K_ECID] integerValue])];
    [self.ReloadSystemDaemonsSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_RELOAD_SYSTEM_DAEMONS]];
    [self.HideLogWindowSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_HIDE_LOG_WINDOW]];
    [self.ResetCydiaCacheSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_RESET_CYDIA_CACHE]];
    [self.SSHOnlySwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_SSH_ONLY]];
    [self.EnableGetTaskAllowSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_ENABLE_GET_TASK_ALLOW]];
    [self.SetCSDebuggedSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_SET_CS_DEBUGGED]];
    [self.LightThemeSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_LIGHT_THEME]];
    [self.ReInstallSileoSwitchSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:K_REINSTALL_SILEO_SWITCH]];
    [self.RestartSpringBoardButton setEnabled:respringSupported()];
    [self.restartButton setEnabled:restartSupported()];
    [self.tableView reloadData];
}

- (IBAction)LoadDaemonsSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.LoadDaemonsSwitch isOn] forKey:K_LOAD_DAEMONS];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}
- (IBAction)DumpAPTicketSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.DumpAPTicketSwitch isOn] forKey:K_DUMP_APTICKET];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)BootNonceTextFieldTriggered:(id)sender {
    uint64_t val = 0;
    if ([[NSScanner scannerWithString:[self.BootNonceTextField text]] scanHexLongLong:&val] && val != HUGE_VAL && val != -HUGE_VAL) {
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@ADDR, val] forKey:K_BOOT_NONCE];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Invalid Entry", nil) message:NSLocalizedString(@"The boot nonce entered could not be parsed", nil) preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *OK = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:OK];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    [self reloadData];
}

- (IBAction)RefreshIconCacheSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.RefreshIconCacheSwitch isOn] forKey:K_REFRESH_ICON_CACHE];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}
- (IBAction)KernelExploitSegmentedControl:(id)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:self.KernelExploitSegmentedControl.selectedSegmentIndex forKey:K_EXPLOIT];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)DisableAppRevokesSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.DisableAppRevokesSwitch isOn] forKey:K_DISABLE_APP_REVOKES];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)tappedOnRestart:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
        NOTICE(NSLocalizedString(@"The device will be restarted.", nil), true, false);
        NSInteger support = recommendedRestartSupport();
        _assert(support != -1, message, true);
        switch (support) {
            case necp_exploit: {
                necp_die();
                break;
            }
            case voucher_swap_exploit: {
                voucher_swap_poc();
                break;
            }
            case kalloc_crash: {
                do_kalloc_crash();
                break;
            }
            default:
                break;
        }
        exit(EXIT_FAILURE);
    });
}

- (IBAction)DisableAutoUpdatesSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.DisableAutoUpdatesSwitch isOn] forKey:K_DISABLE_AUTO_UPDATES];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)tappedOnShareDiagnosticsData:(id)sender {
    NSURL *URL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Documents/diagnostics.plist", NSHomeDirectory()]];
    [[SettingsTableViewController getDiagnostics] writeToURL:URL error:nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[URL] applicationActivities:nil];
    if ([activityViewController respondsToSelector:@selector(popoverPresentationController)]) {
        [[activityViewController popoverPresentationController] setSourceView:self.ShareDiagnosticsDataButton];
    }
    [self presentViewController:activityViewController animated:YES completion:nil];
}

- (IBAction)tappedOnOpenCydia:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"cydia://"] options:@{} completionHandler:nil];
}

- (IBAction)tappedOnOpenSileo:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sileo://"] options:@{} completionHandler:nil];
}

- (IBAction)tappedOnOpenGithub:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/nqcshady/unc0ver-dark"] options:@{} completionHandler:nil];
}

- (IBAction)OverwriteBootNonceSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.OverwriteBootNonceSwitch isOn] forKey:K_OVERWRITE_BOOT_NONCE];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)tappedOnCopyNonce:(id)sender{
    UIAlertController *copyBootNonceAlert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Copy boot nonce?", nil) message:NSLocalizedString(@"Would you like to copy nonce generator to clipboard?", nil) preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *copyAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Yes", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIPasteboard generalPasteboard] setString:[[NSUserDefaults standardUserDefaults] objectForKey:K_BOOT_NONCE]];
    }];
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"No", nil) style:UIAlertActionStyleCancel handler:nil];
    [copyBootNonceAlert addAction:copyAction];
    [copyBootNonceAlert addAction:noAction];
    [self presentViewController:copyBootNonceAlert animated:TRUE completion:nil];
}

- (IBAction)tappedOnCopyECID:(id)sender {
    UIAlertController *copyBootNonceAlert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Copy ECID?", nil) message:NSLocalizedString(@"Would you like to ECID to clipboard?", nil) preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *copyAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Yes", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIPasteboard generalPasteboard] setString:hexFromInt([[[NSUserDefaults standardUserDefaults] objectForKey:K_ECID] integerValue])];
    }];
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"No", nil) style:UIAlertActionStyleCancel handler:nil];
    [copyBootNonceAlert addAction:copyAction];
    [copyBootNonceAlert addAction:noAction];
    [self presentViewController:copyBootNonceAlert animated:TRUE completion:nil];
}

- (IBAction)tappedOnCheckForUpdate:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
        NSString *Update = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://github.com/nqcshady/unc0ver-dark/raw/master/Update.txt"] encoding:NSUTF8StringEncoding error:nil];
        if (Update == nil) {
            NOTICE(NSLocalizedString(@"Failed to check for update.", nil), true, false);
        } else if ([Update compare:appVersion() options:NSNumericSearch] == NSOrderedDescending) {
            //NOTICE(NSLocalizedString(@"An update is available.", nil), true, false);
            UIAlertController *updateAlert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"An update is available for version %@", Update] message:@"Would you like to update?" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                //dispatch_async(dispatch_get_main_queue(), ^{
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [NSString stringWithFormat:@"https://github.com/nqcshady/unc0ver-dark/releases/download/v%@/Undecimus.ipa", Update]] options:@{} completionHandler:nil];
                });
            }];
            UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                
            }];
            [updateAlert addAction:yesAction];
            [updateAlert addAction:noAction];
            [self presentViewController:updateAlert animated:YES completion:nil];
        } else {
            NOTICE(NSLocalizedString(@"Already up to date.", nil), true, false);
        }
    });
}

- (IBAction)exportKernelTaskPortSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.ExportKernelTaskPortSwitch isOn] forKey:K_EXPORT_KERNEL_TASK_PORT];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}
- (IBAction)RestoreRootFSSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.RestoreRootFSSwitch isOn] forKey:K_RESTORE_ROOTFS];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)installCydiaSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.installCydiaSwitch isOn] forKey:K_INSTALL_CYDIA];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)installSSHSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.installSSHSwitch isOn] forKey:K_INSTALL_OPENSSH];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UITableViewHeaderFooterView *)footerView forSection:(NSInteger)section {
    footerView.textLabel.text = [@"unc0ver " stringByAppendingString:appVersion()];
    footerView.textLabel.textAlignment = NSTextAlignmentCenter;
}

- (IBAction)IncreaseMemoryLimitSwitch:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.IncreaseMemoryLimitSwitch isOn] forKey:K_INCREASE_MEMORY_LIMIT];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)tappedOnAutomaticallySelectExploit:(id)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:recommendedJailbreakSupport() forKey:K_EXPLOIT];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)reloadSystemDaemonsSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.ReloadSystemDaemonsSwitch isOn] forKey:K_RELOAD_SYSTEM_DAEMONS];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)tappedRestartSpringBoard:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
        SETMESSAGE(NSLocalizedString(@"Failed to restart SpringBoard.", nil));
        NOTICE(NSLocalizedString(@"SpringBoard will be restarted.", nil), true, false);
        NSInteger support = recommendedRespringSupport();
        _assert(support != -1, message, true);
        switch (support) {
            case deja_xnu_exploit: {
                mach_port_t bb_tp = hid_event_queue_exploit();
                _assert(MACH_PORT_VALID(bb_tp), message, true);
                _assert(thread_call_remote(bb_tp, exit, 1, REMOTE_LITERAL(EXIT_SUCCESS)) == ERR_SUCCESS, message, true);
                break;
            }
            default:
                break;
        }
        exit(EXIT_FAILURE);
    });
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if (section == 0)
//    {
//        return 44;
//    }
//    else
//    {
//        return 44;
//    }
//    return [super tableView:tableView heightForHeaderInSection:section];
//}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(1.5, 0, tableView.bounds.size.width, 44)];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 11.5, 250, 21)];
//    UIFont *currentFont = label.font;
//    UIFont *newFont = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold", currentFont.fontName] size:currentFont.pointSize];
//    if (section == 0) {
//        if (self.LightThemeSwitch.isOn)
//        {
//            [headerView setBackgroundColor:[UIColor whiteColor]];
//            [label setText:@"PREFERENCES"];
//            [label setTextColor:[UIColor blackColor]];
//            [headerView addSubview:label];
//        }
//        else
//        {
//            [headerView setBackgroundColor:[UIColor blackColor]];
//            [label setText:@"PREFERENCES"];
//            [label setTextColor:[UIColor whiteColor]];
//            [headerView addSubview:label];
//        }
//    }
//    else if (section == 1)
//    {
//        //headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//        if (self.LightThemeSwitch.isOn)
//        {
//            [headerView setBackgroundColor:[UIColor whiteColor]];
//            [label setText:@"UTILITIES"];
//            [label setTextColor:[UIColor blackColor]];
//            [headerView addSubview:label];
//        }
//        else
//        {
//            [headerView setBackgroundColor:[UIColor blackColor]];
//            [label setText:@"UTILITIES"];
//            [label setTextColor:[UIColor whiteColor]];
//            [headerView addSubview:label];
//        }
//    }
//    return headerView;
//}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
//    if (section == 0) {
//    [headerView setBackgroundColor:[UIColor blueColor]];
//    }
//    else
//    {
//    [headerView setBackgroundColor:[UIColor yellowColor]];
//    }
//    return headerView;
//}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    //header.tintColor = [UIColor blueColor];
}

-(void)LightTheme {
    
    if (self.LightThemeSwitch.isOn) {
        
        self.SpecialThanksLabel.textColor = [UIColor blackColor];
        self.SpecialThanksContentView.backgroundColor = [UIColor whiteColor];
        self.SpecialThanksTableViewCell.backgroundColor = [UIColor whiteColor];
        
        self.LoadDaemonsLabel.textColor = [UIColor blackColor];
        self.LoadDaemonsContentView.backgroundColor = [UIColor whiteColor];
        self.LoadDaemonsSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.DumpApTicketLabel.textColor = [UIColor blackColor];
        self.DumpApTicketContentView.backgroundColor = [UIColor whiteColor];
        self.DumpAPTicketSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.RefreshIconCacheLabel.textColor = [UIColor blackColor];
        self.RefreshIconCacheContentView.backgroundColor = [UIColor whiteColor];
        self.RefreshIconCacheSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.DisableAutoUpdatesLabel.textColor = [UIColor blackColor];
        self.DisableAutoUpdatesContentView.backgroundColor = [UIColor whiteColor];
        self.DisableAutoUpdatesSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.DisableAppRevokesLabel.textColor = [UIColor blackColor];
        self.DisableAppRevokesContentView.backgroundColor = [UIColor whiteColor];
        self.DisableAppRevokesSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.OverwriteBootNonceLabel.textColor = [UIColor blackColor];
        self.OverwriteBootNonceContentView.backgroundColor = [UIColor whiteColor];
        self.OverwriteBootNonceSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.ExportTFP0Label.textColor = [UIColor blackColor];
        self.ExportTFP0ContentView.backgroundColor = [UIColor whiteColor];
        self.ExportKernelTaskPortSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.RestoreRootFSLabel.textColor = [UIColor blackColor];
        self.RestoreRootFSContentView.backgroundColor = [UIColor whiteColor];
        self.RestoreRootFSSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.IncreaseMemoryLimitLabel.textColor = [UIColor blackColor];
        self.IncreaseMemoryLimitContentView.backgroundColor = [UIColor whiteColor];
        self.IncreaseMemoryLimitSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.ReInstallOpenSSHLabel.textColor = [UIColor blackColor];
        self.ReInstallOpenSSHContentView.backgroundColor = [UIColor whiteColor];
        self.installSSHSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.ReinstallCydiaLabel.textColor = [UIColor blackColor];
        self.ReinstallCydiaContentView.backgroundColor = [UIColor whiteColor];
        self.installCydiaSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.ReloadSystemDaemonsLabel.textColor = [UIColor blackColor];
        self.ReloadSystemDaemonsContentView.backgroundColor = [UIColor whiteColor];
        self.ReloadSystemDaemonsSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.HideLogWindowLabel.textColor = [UIColor blackColor];
        self.HideLogWindowContentView.backgroundColor = [UIColor whiteColor];
        self.HideLogWindowSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.ResetCydiaCacheLabel.textColor = [UIColor blackColor];
        self.ResetCydiaCacheContentView.backgroundColor = [UIColor whiteColor];
        self.ResetCydiaCacheSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.SSHOnlyLabel.textColor = [UIColor blackColor];
        self.SSHOnlyContentView.backgroundColor = [UIColor whiteColor];
        self.SSHOnlySwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.EnableGetTaskAllowLabel.textColor = [UIColor blackColor];
        self.EnableGetTaskAllowContentView.backgroundColor = [UIColor whiteColor];
        self.EnableGetTaskAllowSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.SetCSDEBUGGEDLabel.textColor = [UIColor blackColor];
        self.SetCSDEBUGGEDContentView.backgroundColor = [UIColor whiteColor];
        self.SetCSDebuggedSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.LightThemeLabel.textColor = [UIColor blackColor];
        self.LightThemeContentView.backgroundColor = [UIColor whiteColor];
        self.LightThemeSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.KernelExploitLabel.textColor = [UIColor blackColor];
        self.KernelExploitContentView.backgroundColor = [UIColor whiteColor];
        self.KernelExploitSegmentedControl.tintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        
        self.ReInstallSileoSwitchLabel.textColor = [UIColor blackColor];
        self.ReInstallSileoSwitchView.backgroundColor = [UIColor whiteColor];
        self.ReInstallSileoSwitchSwitch.onTintColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];

        self.restartButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        self.RestartButtonContentView.backgroundColor = [UIColor whiteColor];

        self.ShareDiagnosticsDataButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        self.ShareDiagnosticsDataContentView.backgroundColor = [UIColor whiteColor];

        self.OpenCydiaButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        self.OpenCydiaContentView.backgroundColor = [UIColor whiteColor];

        self.OpenSileoButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        self.OpenSileoContentView.backgroundColor = [UIColor whiteColor];

        self.ViewSourceCodeButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        self.ViewSourceCodeContentView.backgroundColor = [UIColor whiteColor];

        self.AutoSelectExploitButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        self.AutoSelectExploitContentView.backgroundColor = [UIColor whiteColor];

        self.RestartSpringBoardButton.titleLabel.textColor = [UIColor colorWithRed:0.43 green:0.43 blue:0.45 alpha:1.0];
        self.RestartSpringBoardContentView.backgroundColor = [UIColor whiteColor];

        self.CleanDiagnosticsDataButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        self.CleanDiagnosticsDataContentView.backgroundColor = [UIColor whiteColor];

        self.CheckForUpdateButton.titleLabel.textColor = [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0];
        self.CheckForUpdateContentView.backgroundColor = [UIColor whiteColor];
        
        [self.BootNonceTextField setTextColor:[UIColor blackColor]];
        self.BootNonceContentView.backgroundColor = [UIColor whiteColor];
        [self.BootNonceButtonLabel setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
        [self.BootNonceTextField setValue:[UIColor blackColor]
                        forKeyPath:@"_placeholderLabel.textColor"];
        
        [self.ECIDLabel setTextColor:[UIColor blackColor]];
        self.ECIDContentView.backgroundColor = [UIColor whiteColor];
        [self.ECIDButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.ECIDLabel setValue:[UIColor blackColor]
                               forKeyPath:@"_placeholderLabel.textColor"];
        
        [self.ExpiryLabel setTextColor:[UIColor blackColor]];
        self.ExpiryContentView.backgroundColor = [UIColor whiteColor];
        self.ExpiryButton.textColor = [UIColor blackColor];
        [self.ExpiryLabel setValue:[UIColor blackColor]
                               forKeyPath:@"_placeholderLabel.textColor"];
        
        [self.UptimeLabel setTextColor:[UIColor blackColor]];
        self.UptimeContentView.backgroundColor = [UIColor whiteColor];
        self.UptimeButton.textColor = [UIColor blackColor];
        [self.UptimeLabel setValue:[UIColor blackColor]
                               forKeyPath:@"_placeholderLabel.textColor"];
        
        self.SettingsTableView.backgroundColor = [UIColor whiteColor];
        self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
        self.navigationController.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
        //self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    }
    else if (!self.LightThemeSwitch.isOn)
    {
        
        self.SpecialThanksLabel.textColor = [UIColor whiteColor];
        self.SpecialThanksContentView.backgroundColor = [UIColor blackColor];
        self.SpecialThanksTableViewCell.backgroundColor = [UIColor blackColor];
        
        self.LoadDaemonsLabel.textColor = [UIColor whiteColor];
        self.LoadDaemonsContentView.backgroundColor = [UIColor blackColor];
        self.LoadDaemonsSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.DumpApTicketLabel.textColor = [UIColor whiteColor];
        self.DumpApTicketContentView.backgroundColor = [UIColor blackColor];
        self.DumpAPTicketSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.RefreshIconCacheLabel.textColor = [UIColor whiteColor];
        self.RefreshIconCacheContentView.backgroundColor = [UIColor blackColor];
        self.RefreshIconCacheSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.DisableAutoUpdatesLabel.textColor = [UIColor whiteColor];
        self.DisableAutoUpdatesContentView.backgroundColor = [UIColor blackColor];
        self.DisableAutoUpdatesSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.DisableAppRevokesLabel.textColor = [UIColor whiteColor];
        self.DisableAppRevokesContentView.backgroundColor = [UIColor blackColor];
        self.DisableAppRevokesSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.OverwriteBootNonceLabel.textColor = [UIColor whiteColor];
        self.OverwriteBootNonceContentView.backgroundColor = [UIColor blackColor];
        self.OverwriteBootNonceSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.ExportTFP0Label.textColor = [UIColor whiteColor];
        self.ExportTFP0ContentView.backgroundColor = [UIColor blackColor];
        self.ExportKernelTaskPortSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.RestoreRootFSLabel.textColor = [UIColor whiteColor];
        self.RestoreRootFSContentView.backgroundColor = [UIColor blackColor];
        self.RestoreRootFSSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.IncreaseMemoryLimitLabel.textColor = [UIColor whiteColor];
        self.IncreaseMemoryLimitContentView.backgroundColor = [UIColor blackColor];
        self.IncreaseMemoryLimitSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        //
        self.ReInstallOpenSSHLabel.textColor = [UIColor whiteColor];
        self.ReInstallOpenSSHContentView.backgroundColor = [UIColor blackColor];
        self.installSSHSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.ReinstallCydiaLabel.textColor = [UIColor whiteColor];
        self.ReinstallCydiaContentView.backgroundColor = [UIColor blackColor];
        self.installCydiaSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.ReloadSystemDaemonsLabel.textColor = [UIColor whiteColor];
        self.ReloadSystemDaemonsContentView.backgroundColor = [UIColor blackColor];
        self.ReloadSystemDaemonsSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.HideLogWindowLabel.textColor = [UIColor whiteColor];
        self.HideLogWindowContentView.backgroundColor = [UIColor blackColor];
        self.HideLogWindowSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.ResetCydiaCacheLabel.textColor = [UIColor whiteColor];
        self.ResetCydiaCacheContentView.backgroundColor = [UIColor blackColor];
        self.ResetCydiaCacheSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.SSHOnlyLabel.textColor = [UIColor whiteColor];
        self.SSHOnlyContentView.backgroundColor = [UIColor blackColor];
        self.SSHOnlySwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.EnableGetTaskAllowLabel.textColor = [UIColor whiteColor];
        self.EnableGetTaskAllowContentView.backgroundColor = [UIColor blackColor];
        self.EnableGetTaskAllowSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.SetCSDEBUGGEDLabel.textColor = [UIColor whiteColor];
        self.SetCSDEBUGGEDContentView.backgroundColor = [UIColor blackColor];
        self.SetCSDebuggedSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.LightThemeLabel.textColor = [UIColor whiteColor];
        self.LightThemeContentView.backgroundColor = [UIColor blackColor];
        self.LightThemeSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.KernelExploitLabel.textColor = [UIColor whiteColor];
        self.KernelExploitContentView.backgroundColor = [UIColor blackColor];
        self.KernelExploitSegmentedControl.tintColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1.0];
        
        self.ReInstallSileoSwitchLabel.textColor = [UIColor whiteColor];
        self.ReInstallSileoSwitchView.backgroundColor = [UIColor blackColor];
        self.ReInstallSileoSwitchSwitch.onTintColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
        
        self.restartButton.titleLabel.textColor = [UIColor whiteColor];
        self.RestartButtonContentView.backgroundColor = [UIColor blackColor];

        self.ShareDiagnosticsDataButton.titleLabel.textColor = [UIColor whiteColor];
        self.ShareDiagnosticsDataContentView.backgroundColor = [UIColor blackColor];

        self.OpenCydiaButton.titleLabel.textColor = [UIColor whiteColor];
        self.OpenCydiaContentView.backgroundColor = [UIColor blackColor];

        self.OpenSileoButton.titleLabel.textColor = [UIColor whiteColor];
        self.OpenSileoContentView.backgroundColor = [UIColor blackColor];

        self.ViewSourceCodeButton.titleLabel.textColor = [UIColor whiteColor];
        self.ViewSourceCodeContentView.backgroundColor = [UIColor blackColor];

        self.AutoSelectExploitButton.titleLabel.textColor = [UIColor whiteColor];
        self.AutoSelectExploitContentView.backgroundColor = [UIColor blackColor];

        self.RestartSpringBoardButton.titleLabel.textColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1.0];
        self.RestartSpringBoardContentView.backgroundColor = [UIColor blackColor];

        self.CleanDiagnosticsDataButton.titleLabel.textColor = [UIColor whiteColor];
        self.CleanDiagnosticsDataContentView.backgroundColor = [UIColor blackColor];

        self.CheckForUpdateButton.titleLabel.textColor = [UIColor whiteColor];
        self.CheckForUpdateContentView.backgroundColor = [UIColor blackColor];
        
        self.BootNonceTextField.textColor = [UIColor whiteColor];
        self.BootNonceContentView.backgroundColor = [UIColor blackColor];
        [self.BootNonceButtonLabel setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
        [self.BootNonceTextField setValue:[UIColor whiteColor]
                               forKeyPath:@"_placeholderLabel.textColor"];
        
        self.ECIDLabel.textColor = [UIColor whiteColor];
        self.ECIDContentView.backgroundColor = [UIColor blackColor];
        [self.ECIDButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
        [self.ECIDLabel setValue:[UIColor whiteColor]
                      forKeyPath:@"_placeholderLabel.textColor"];
        
        self.ExpiryLabel.textColor = [UIColor whiteColor];
        self.ExpiryContentView.backgroundColor = [UIColor blackColor];
        self.ExpiryButton.textColor = [UIColor whiteColor];
        [self.ExpiryLabel setValue:[UIColor whiteColor]
                      forKeyPath:@"_placeholderLabel.textColor"];
        
        self.UptimeLabel.textColor = [UIColor whiteColor];
        self.UptimeContentView.backgroundColor = [UIColor blackColor];
        self.UptimeButton.textColor = [UIColor whiteColor];
        [self.UptimeLabel setValue:[UIColor whiteColor]
                      forKeyPath:@"_placeholderLabel.textColor"];
        
        self.SettingsTableView.backgroundColor = [UIColor blackColor];
        self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
        self.navigationController.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
        
    }
    
}

- (IBAction)tappedOnCleanDiagnosticsData:(id)sender {
    cleanLogs();
    NOTICE(NSLocalizedString(@"Cleaned diagnostics data.", nil), false, false);
}

- (IBAction)hideLogWindowSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.HideLogWindowSwitch isOn] forKey:K_HIDE_LOG_WINDOW];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
        NOTICE(NSLocalizedString(@"Preference was changed. The app will now exit.", nil), true, false);
        exit(EXIT_SUCCESS);
    });
}

- (IBAction)resetCydiaCacheSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.ResetCydiaCacheSwitch isOn] forKey:K_RESET_CYDIA_CACHE];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)sshOnlySwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.SSHOnlySwitch isOn] forKey:K_SSH_ONLY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)enableGetTaskAllowSwitchTriggered:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.EnableGetTaskAllowSwitch isOn] forKey:K_ENABLE_GET_TASK_ALLOW];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)setCSDebugged:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.SetCSDebuggedSwitch isOn] forKey:K_SET_CS_DEBUGGED];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}

- (IBAction)themeLight:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.LightThemeSwitch isOn] forKey:K_LIGHT_THEME];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
    //[self LightTheme];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
        NOTICE(NSLocalizedString(@"Theme was changed. The app will now exit.", nil), true, false);
        exit(EXIT_SUCCESS);
    });
}

- (IBAction)sileoSwitch:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:[self.ReInstallSileoSwitchSwitch isOn] forKey:K_REINSTALL_SILEO_SWITCH];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
