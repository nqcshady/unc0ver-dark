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
#include "prefs.h"
#include "diagnostics.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// https://github.com/Matchstic/ReProvision/blob/7b595c699335940f68702bb204c5aa55b8b1896f/Shared/Application%20Database/RPVApplication.m#L102

+ (NSDictionary *)provisioningProfileAtPath:(NSString *)path {
    NSString *stringContent = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
    stringContent = [stringContent componentsSeparatedByString:@"<plist version=\"1.0\">"][1];
    stringContent = [NSString stringWithFormat:@"%@%@", @"<plist version=\"1.0\">", stringContent];
    stringContent = [stringContent componentsSeparatedByString:@"</plist>"][0];
    stringContent = [NSString stringWithFormat:@"%@%@", stringContent, @"</plist>"];
    NSData *const stringData = [stringContent dataUsingEncoding:NSASCIIStringEncoding];
    id const plist = [NSPropertyListSerialization propertyListWithData:stringData options:NSPropertyListImmutable format:nil error:nil];
    return plist;
}

#define STATUS_FILE          @"/var/lib/dpkg/status"

-(void)viewDidLayoutSubviews {
    prefs_t *prefs = copy_prefs();
    if (prefs->theme == 2)
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
    
    if (prefs->theme == 1)
    {
        [self.navigationController.view setTintColor:UIColorFromRGB(0x17151C)];
        self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x17151C);
        self.navigationController.navigationBar.translucent = NO;
        //
        //        [self LightTheme];
        //
        //
        self.restartButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        
        self.ShareDiagnosticsDataButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        
        self.OpenCydiaButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        
        self.OpenSileoButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        
        self.ViewSourceCodeButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        
        self.AutoSelectExploitButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        
        self.RestartSpringBoardButton.titleLabel.textColor = UIColorFromRGB(0x56555A);
        
        self.CleanDiagnosticsDataButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        
        self.CheckForUpdateButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
    }
    
    if (prefs->theme == 0)
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
    release_prefs(&prefs);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(10,10,200,200)];
    [myView setAlpha:0];
    [myView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    prefs_t *prefs = copy_prefs();
    if (prefs->theme == 0)
    {
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
            
            statusBar.backgroundColor = [UIColor blackColor]; //set whatever color you like
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
    if (prefs->theme == 1)
    {
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
            
            statusBar.backgroundColor = UIColorFromRGB(0x17151C); //set whatever color you like
        }
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        [myView setBackgroundColor:[UIColor clearColor]];
        [self.tableView setBackgroundColor:UIColorFromRGB(0x17151C)];
        [self.SettingsTableView setBackgroundColor:UIColorFromRGB(0x17151C)];
        [[UINavigationBar appearance] setTintColor:UIColorFromRGB(0x17151C)];
        UINavigationBar *bar = [self.navigationController navigationBar];
        [bar setBarTintColor:UIColorFromRGB(0x17151C)];
        self.navigationController.navigationBar.backgroundColor = UIColorFromRGB(0x17151C);
        [self.navigationController.view setBackgroundColor:UIColorFromRGB(0x17151C)];
        [self.navigationController.view setTintColor:UIColorFromRGB(0x17151C)];
        self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x17151C);
        self.navigationController.navigationBar.translucent = NO;
        [self.navigationController.navigationBar setBarTintColor:UIColorFromRGB(0x17151C)];
        [self.navigationController.navigationBar setTranslucent:NO];
        
        [self.navigationController.view setTintColor:UIColorFromRGB(0x17151C)];
        self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x17151C);
        self.navigationController.navigationBar.translucent = NO;
        //        [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
        //        [self.navigationController.navigationBar setTranslucent:NO];
        
        self.restartButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        //self.RestartButtonContentView.backgroundColor = [UIColor blackColor];
        
        self.ShareDiagnosticsDataButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        //self.ShareDiagnosticsDataContentView.backgroundColor = [UIColor blackColor];
        
        self.OpenCydiaButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        //self.OpenCydiaContentView.backgroundColor = [UIColor blackColor];
        
        self.OpenSileoButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        //self.OpenSileoContentView.backgroundColor = [UIColor blackColor];
        
        self.ViewSourceCodeButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        //self.ViewSourceCodeContentView.backgroundColor = [UIColor blackColor];
        
        self.AutoSelectExploitButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        //self.AutoSelectExploitContentView.backgroundColor = [UIColor blackColor];
        
        self.RestartSpringBoardButton.titleLabel.textColor = UIColorFromRGB(0x56555A);
        //self.RestartSpringBoardContentView.backgroundColor = [UIColor blackColor];
        
        self.CleanDiagnosticsDataButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        //self.CleanDiagnosticsDataContentView.backgroundColor = [UIColor blackColor];
        
        self.CheckForUpdateButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        //self.CheckForUpdateContentView.backgroundColor = [UIColor blackColor];
    }
    if (prefs->theme == 2)
    {
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
            
            statusBar.backgroundColor = [UIColor whiteColor]; //set whatever color you like
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
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIBarButtonItem *moveOver = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(pickerDoneButton)];
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 44)];
    [toolBar setItems:@[moveOver, doneBarButton]];
    [toolBar setBarStyle:UIBarStyleDefault];
    _themePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, toolBar.frame.size.height, screenWidth, 200)];
    _themePickerData = [[NSMutableArray alloc] init];
    [_themePickerData addObject:@"True Black"];
    [_themePickerData addObject:@"Dark Purple"];
    [_themePickerData addObject:@"White"];
    [[self themePicker] setDataSource:self];
    [[self themePicker] setDelegate:self];
    UIView *themeFieldInputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, toolBar.frame.size.height + _themePicker.frame.size.height)];
    themeFieldInputView.backgroundColor = [UIColor clearColor];
    [themeFieldInputView addSubview:_themePicker];
    [themeFieldInputView addSubview:toolBar];
    [self.themeField setInputView:themeFieldInputView];
    if (prefs->theme == 0) {
        [self.themePicker selectRow:0 inComponent:0 animated:YES];
        set_prefs(prefs);
    }
    if (prefs->theme == 1) {
        [self.themePicker selectRow:1 inComponent:0 animated:YES];
        set_prefs(prefs);
    }
    if(prefs->theme == 2) {
        [self.themePicker selectRow:2 inComponent:0 animated:YES];
        set_prefs(prefs);
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.tableView setBackgroundView:myView];
    
    [self.BootNonceTextField setDelegate:self];
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTappedAnyware:)];
    self.tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:self.tap];
    release_prefs(&prefs);
    [self reloadData];
    [self Theme];
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
    prefs_t *prefs = copy_prefs();
    [self.LoadDaemonsSwitch setOn:(BOOL)prefs->load_daemons];
    [self.DumpAPTicketSwitch setOn:(BOOL)prefs->dump_apticket];
    [self.BootNonceTextField setPlaceholder:@(prefs->boot_nonce)];
    [self.BootNonceTextField setText:nil];
    [self.RefreshIconCacheSwitch setOn:(BOOL)prefs->run_uicache];
    [self.KernelExploitSegmentedControl setSelectedSegmentIndex:(int)prefs->exploit];
    [self.DisableAutoUpdatesSwitch setOn:(BOOL)prefs->disable_auto_updates];
    [self.DisableAppRevokesSwitch setOn:(BOOL)prefs->disable_app_revokes];
    
    [self.KernelExploitSegmentedControl setEnabled:supportsExploit(async_wake_exploit) forSegmentAtIndex:async_wake_exploit];
    [self.KernelExploitSegmentedControl setEnabled:supportsExploit(voucher_swap_exploit) forSegmentAtIndex:voucher_swap_exploit];
    [self.KernelExploitSegmentedControl setEnabled:supportsExploit(mach_swap_exploit) forSegmentAtIndex:mach_swap_exploit];
    [self.KernelExploitSegmentedControl setEnabled:supportsExploit(mach_swap_2_exploit) forSegmentAtIndex:mach_swap_2_exploit];
    [self.OpenCydiaButton setEnabled:(BOOL)cydiaIsInstalled()];
    [self.OpenSileoButton setEnabled:(BOOL)sileoIsInstalled()];
    [self.ExpiryLabel setPlaceholder:[NSString stringWithFormat:@"%d %@", (int)[[SettingsTableViewController provisioningProfileAtPath:[[NSBundle mainBundle] pathForResource:@"embedded" ofType:@"mobileprovision"]][@"ExpirationDate"] timeIntervalSinceDate:[NSDate date]] / 86400, localize(@"Days")]];
    [self.OverwriteBootNonceSwitch setOn:(BOOL)prefs->overwrite_boot_nonce];
    [self.ExportKernelTaskPortSwitch setOn:(BOOL)prefs->export_kernel_task_port];
    [self.RestoreRootFSSwitch setOn:(BOOL)prefs->restore_rootfs];
    [self.UptimeLabel setPlaceholder:[NSString stringWithFormat:@"%d %@", (int)getUptime() / 86400, localize(@"Days")]];
    [self.IncreaseMemoryLimitSwitch setOn:(BOOL)prefs->increase_memory_limit];
    [self.installSSHSwitch setOn:(BOOL)prefs->install_openssh];
    [self.installCydiaSwitch setOn:(BOOL)prefs->install_cydia];
    if (prefs->ecid) [self.ECIDLabel setPlaceholder:hexFromInt([@(prefs->ecid) integerValue])];
    [self.ReloadSystemDaemonsSwitch setOn:(BOOL)prefs->reload_system_daemons];
    [self.HideLogWindowSwitch setOn:(BOOL)prefs->hide_log_window];
    [self.ResetCydiaCacheSwitch setOn:(BOOL)prefs->reset_cydia_cache];
    [self.SSHOnlySwitch setOn:(BOOL)prefs->ssh_only];
    [self.EnableGetTaskAllowSwitch setOn:(BOOL)prefs->enable_get_task_allow];
    [self.SetCSDebuggedSwitch setOn:(BOOL)prefs->set_cs_debugged];
    [self.ReInstallSileoSwitchSwitch setOn:(BOOL)prefs->reinstall_sileo_switch];
    NSDictionary *userDefaultsDictionary = [[[NSUserDefaults alloc] initWithUser:@"mobile"] dictionaryRepresentation];
    if (prefs->theme == 0) {
        [self.themeField setPlaceholder:@"True Black"];
    }
    if (prefs->theme == 1) {
        [self.themeField setPlaceholder:@"Dark Purple"];
    }
    if (prefs->theme == 2) {
        [self.themeField setPlaceholder:@"White"];
    }
    [self.RestartSpringBoardButton setEnabled:respringSupported()];
    [self.restartButton setEnabled:restartSupported()];
    release_prefs(&prefs);
    [self.tableView reloadData];
}

- (IBAction)LoadDaemonsSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->load_daemons = (bool)self.LoadDaemonsSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)DumpAPTicketSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->dump_apticket = (bool)self.DumpAPTicketSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)BootNonceTextFieldTriggered:(id)sender {
    uint64_t val = 0;
    if ([[NSScanner scannerWithString:[self.BootNonceTextField text]] scanHexLongLong:&val] && val != HUGE_VAL && val != -HUGE_VAL) {
        prefs_t *prefs = copy_prefs();
        prefs->boot_nonce = [NSString stringWithFormat:@ADDR, val].UTF8String;
        set_prefs(prefs);
        release_prefs(&prefs);
    } else {
        UIAlertController *const alertController = [UIAlertController alertControllerWithTitle:localize(@"Invalid Entry") message:localize(@"The boot nonce entered could not be parsed") preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *const OK = [UIAlertAction actionWithTitle:localize(@"OK") style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:OK];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    [self reloadData];
}

- (IBAction)RefreshIconCacheSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->run_uicache = (bool)self.RefreshIconCacheSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)KernelExploitSegmentedControl:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->exploit = (int)self.KernelExploitSegmentedControl.selectedSegmentIndex;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)DisableAppRevokesSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->disable_app_revokes = (bool)self.DisableAppRevokesSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)tappedOnRestart:(id)sender {
    void (^const block)(void) = ^(void) {
        notice(localize(@"The device will be restarted."), true, false);
        NSInteger const support = recommendedRestartSupport();
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
    };
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), block);
}

- (IBAction)DisableAutoUpdatesSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->disable_auto_updates = (bool)self.DisableAutoUpdatesSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)tappedOnShareDiagnosticsData:(id)sender {
    NSURL *const URL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Documents/diagnostics.plist", NSHomeDirectory()]];
    [getDiagnostics() writeToURL:URL error:nil];
    UIActivityViewController *const activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[URL] applicationActivities:nil];
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
    prefs_t *prefs = copy_prefs();
    prefs->overwrite_boot_nonce = (bool)self.OverwriteBootNonceSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)tappedOnCopyNonce:(id)sender{
    UIAlertController *const copyBootNonceAlert = [UIAlertController alertControllerWithTitle:localize(@"Copy boot nonce?") message:localize(@"Would you like to copy nonce generator to clipboard?") preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *const copyAction = [UIAlertAction actionWithTitle:localize(@"Yes") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        prefs_t *prefs = copy_prefs();
        [[UIPasteboard generalPasteboard] setString:@(prefs->boot_nonce)];
        release_prefs(&prefs);
    }];
    UIAlertAction *const noAction = [UIAlertAction actionWithTitle:localize(@"No") style:UIAlertActionStyleCancel handler:nil];
    [copyBootNonceAlert addAction:copyAction];
    [copyBootNonceAlert addAction:noAction];
    [self presentViewController:copyBootNonceAlert animated:TRUE completion:nil];
}

- (IBAction)tappedOnCopyECID:(id)sender {
    UIAlertController *const copyBootNonceAlert = [UIAlertController alertControllerWithTitle:localize(@"Copy ECID?") message:localize(@"Would you like to ECID to clipboard?") preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *const copyAction = [UIAlertAction actionWithTitle:localize(@"Yes") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        prefs_t *prefs = copy_prefs();
        [[UIPasteboard generalPasteboard] setString:hexFromInt(@(prefs->ecid).integerValue)];
        release_prefs(&prefs);
    }];
    UIAlertAction *const noAction = [UIAlertAction actionWithTitle:localize(@"No") style:UIAlertActionStyleCancel handler:nil];
    [copyBootNonceAlert addAction:copyAction];
    [copyBootNonceAlert addAction:noAction];
    [self presentViewController:copyBootNonceAlert animated:TRUE completion:nil];
}

- (IBAction)tappedOnCheckForUpdate:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
        NSString *Update = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://github.com/nqcshady/unc0ver-dark/raw/master/Update.txt"] encoding:NSUTF8StringEncoding error:nil];
        if (Update == nil) {
            notice(NSLocalizedString(@"Failed to check for update.", nil), true, false);
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
            notice(localize(@"Already up to date."), true, false);
        }
    });
}

- (IBAction)exportKernelTaskPortSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->export_kernel_task_port = (bool)self.ExportKernelTaskPortSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)RestoreRootFSSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->restore_rootfs = (bool)self.RestoreRootFSSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)installCydiaSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->install_cydia = (bool)self.installCydiaSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)installSSHSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->install_openssh = (bool)self.installSSHSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UITableViewHeaderFooterView *)footerView forSection:(NSInteger)section {
    footerView.textLabel.text = [@"unc0ver dark " stringByAppendingString:appVersion()];
    footerView.textLabel.textAlignment = NSTextAlignmentCenter;
}

- (IBAction)IncreaseMemoryLimitSwitch:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->increase_memory_limit = (bool)self.IncreaseMemoryLimitSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)tappedOnAutomaticallySelectExploit:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->exploit = (int)recommendedJailbreakSupport();
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)reloadSystemDaemonsSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->reload_system_daemons = (bool)self.ReloadSystemDaemonsSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)sileoSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->reinstall_sileo_switch = (bool)self.ReInstallSileoSwitchSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)tappedRestartSpringBoard:(id)sender {
    void (^const block)(void) = ^(void) {
        notice(localize(@"SpringBoard will be restarted."), true, false);
        NSInteger const support = recommendedRespringSupport();
        switch (support) {
            case deja_xnu_exploit: {
                mach_port_t const bb_tp = hid_event_queue_exploit();
                _assert(MACH_PORT_VALID(bb_tp), localize(@"Unable to get task port for backboardd."), true);
                _assert(thread_call_remote(bb_tp, exit, 1, REMOTE_LITERAL(EXIT_SUCCESS)) == ERR_SUCCESS, localize(@"Unable to make backboardd exit."), true);
                break;
            }
            default:
                break;
        }
        exit(EXIT_FAILURE);
    };
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), block);
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

-(void)Theme {
    prefs_t *prefs = copy_prefs();
    
    if (prefs->theme == 2) {
        
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
        
        self.themeField.textColor = [UIColor blackColor];
        self.ThemeContentView.backgroundColor = [UIColor whiteColor];
        self.ThemeLabel.textColor = [UIColor blackColor];
        [self.themeField setValue:[UIColor blackColor]
                       forKeyPath:@"_placeholderLabel.textColor"];
        
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
    if (prefs->theme == 0)
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
        
        self.themeField.textColor = [UIColor whiteColor];
        self.ThemeContentView.backgroundColor = [UIColor blackColor];
        self.ThemeLabel.textColor = [UIColor whiteColor];
        [self.themeField setValue:[UIColor whiteColor]
                        forKeyPath:@"_placeholderLabel.textColor"];
        
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
    if (prefs->theme == 1)
    {
        self.SpecialThanksLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.SpecialThanksContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.SpecialThanksTableViewCell.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.LoadDaemonsLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.LoadDaemonsContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.LoadDaemonsSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.DumpApTicketLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.DumpApTicketContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.DumpAPTicketSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.RefreshIconCacheLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.RefreshIconCacheContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.RefreshIconCacheSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.DisableAutoUpdatesLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.DisableAutoUpdatesContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.DisableAutoUpdatesSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.DisableAppRevokesLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.DisableAppRevokesContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.DisableAppRevokesSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.OverwriteBootNonceLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.OverwriteBootNonceContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.OverwriteBootNonceSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.ExportTFP0Label.textColor = UIColorFromRGB(0xE9E9EA);
        self.ExportTFP0ContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.ExportKernelTaskPortSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.RestoreRootFSLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.RestoreRootFSContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.RestoreRootFSSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.IncreaseMemoryLimitLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.IncreaseMemoryLimitContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.IncreaseMemoryLimitSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.ReInstallOpenSSHLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.ReInstallOpenSSHContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.installSSHSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.ReinstallCydiaLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.ReinstallCydiaContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.installCydiaSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.ReloadSystemDaemonsLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.ReloadSystemDaemonsContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.ReloadSystemDaemonsSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.HideLogWindowLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.HideLogWindowContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.HideLogWindowSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.ResetCydiaCacheLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.ResetCydiaCacheContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.ResetCydiaCacheSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.SSHOnlyLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.SSHOnlyContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.SSHOnlySwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.EnableGetTaskAllowLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.EnableGetTaskAllowContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.EnableGetTaskAllowSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.SetCSDEBUGGEDLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.SetCSDEBUGGEDContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.SetCSDebuggedSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.themeField.textColor = UIColorFromRGB(0xE9E9EA);
        self.ThemeContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.ThemeLabel.textColor = UIColorFromRGB(0xE9E9EA);
        [self.themeField setValue:UIColorFromRGB(0xE9E9EA)
                       forKeyPath:@"_placeholderLabel.textColor"];
        
        self.KernelExploitLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.KernelExploitContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.KernelExploitSegmentedControl.tintColor = UIColorFromRGB(0x723F8C);
        
        self.ReInstallSileoSwitchLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.ReInstallSileoSwitchView.backgroundColor = UIColorFromRGB(0x17151C);
        self.ReInstallSileoSwitchSwitch.onTintColor = UIColorFromRGB(0x723F8C);
        
        self.restartButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.RestartButtonContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.ShareDiagnosticsDataButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.ShareDiagnosticsDataContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.OpenCydiaButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.OpenCydiaContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.OpenSileoButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.OpenSileoContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.ViewSourceCodeButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.ViewSourceCodeContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.AutoSelectExploitButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.AutoSelectExploitContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.RestartSpringBoardButton.titleLabel.textColor = UIColorFromRGB(0x56555A);
        self.RestartSpringBoardContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.CleanDiagnosticsDataButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.CleanDiagnosticsDataContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.CheckForUpdateButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.CheckForUpdateContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.BootNonceTextField.textColor = UIColorFromRGB(0xE9E9EA);
        self.BootNonceContentView.backgroundColor = UIColorFromRGB(0x17151C);
        [self.BootNonceButtonLabel setTitleColor: UIColorFromRGB(0xE9E9EA) forState:UIControlStateNormal];
        [self.BootNonceTextField setValue:[UIColor whiteColor]
                               forKeyPath:@"_placeholderLabel.textColor"];
        
        self.ECIDLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.ECIDContentView.backgroundColor = UIColorFromRGB(0x17151C);
        [self.ECIDButton setTitleColor: UIColorFromRGB(0xE9E9EA) forState:UIControlStateNormal];
        [self.ECIDLabel setValue:[UIColor whiteColor]
                      forKeyPath:@"_placeholderLabel.textColor"];
        
        self.ExpiryLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.ExpiryContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.ExpiryButton.textColor = UIColorFromRGB(0xE9E9EA);
        [self.ExpiryLabel setValue:UIColorFromRGB(0xE9E9EA)
                        forKeyPath:@"_placeholderLabel.textColor"];
        
        self.UptimeLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.UptimeContentView.backgroundColor = UIColorFromRGB(0x17151C);
        self.UptimeButton.textColor = UIColorFromRGB(0xE9E9EA);
        [self.UptimeLabel setValue:UIColorFromRGB(0xE9E9EA)
                        forKeyPath:@"_placeholderLabel.textColor"];
        
        self.SettingsTableView.backgroundColor = UIColorFromRGB(0x17151C);
        self.navigationController.navigationBar.backgroundColor = UIColorFromRGB(0x17151C);
        self.navigationController.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName: UIColorFromRGB(0xE9E9EA)};
        
    }
    release_prefs(&prefs);
}

- (IBAction)tappedOnCleanDiagnosticsData:(id)sender {
    cleanLogs();
    notice(localize(@"Cleaned diagnostics data."), false, false);
}

- (IBAction)hideLogWindowSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->hide_log_window = (bool)self.HideLogWindowSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
    void (^const block)(void) = ^(void) {
        notice(localize(@"Preference was changed. The app will now exit."), true, false);
        exit(EXIT_SUCCESS);
    };
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), block);
}

- (IBAction)resetCydiaCacheSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->reset_cydia_cache = (bool)self.ResetCydiaCacheSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)sshOnlySwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->ssh_only = (bool)self.SSHOnlySwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)enableGetTaskAllowSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->enable_get_task_allow = (bool)self.EnableGetTaskAllowSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)setCSDebugged:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->set_cs_debugged = (bool)self.SetCSDebuggedSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)tappedOnResetAppPreferences:(id)sender {
    void (^const block)(void) = ^(void) {
        reset_prefs();
        notice(localize(@"Preferences were reset. The app will now exit."), true, false);
        exit(EXIT_SUCCESS);
    };
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), block);
}

- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_themePickerData count];
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_themePickerData objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    prefs_t *prefs = copy_prefs();
    if ([[_themePickerData objectAtIndex:row] isEqualToString:@"True Black"]) {
        prefs->theme = 0;
        set_prefs(prefs);
    }
    if ([[_themePickerData objectAtIndex:row] isEqualToString:@"Dark Purple"]) {
        prefs->theme = 1;
        set_prefs(prefs);
    }
    if ([[_themePickerData objectAtIndex:row] isEqualToString:@"White"]) {
        prefs->theme = 2;
        set_prefs(prefs);
    }
    release_prefs(&prefs);
}

-(void)pickerDoneButton{
    prefs_t *prefs = copy_prefs();
    if (prefs->theme == 2) {
        [self lc_setAlternateIconName:@"WhiteIcon"];
    }
    if (prefs->theme == 1) {
        [self lc_setAlternateIconName:@"PurpleIcon"];
    }
    if (prefs->theme == 0) {
        [self lc_setAlternateIconName:nil];
    }
    [_themeField resignFirstResponder];
    release_prefs(&prefs);
    [self reloadData];
    void (^const block)(void) = ^(void) {
        notice(localize(@"Preference was changed. The app will now exit."), true, false);
        exit(EXIT_SUCCESS);
    };
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), block);
}

- (void)lc_setAlternateIconName:(NSString*)iconName
{
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(supportsAlternateIcons)] &&
        [[UIApplication sharedApplication] supportsAlternateIcons])
    {
        NSMutableString *selectorString = [[NSMutableString alloc] initWithCapacity:40];
        [selectorString appendString:@"_setAlternate"];
        [selectorString appendString:@"IconName:"];
        [selectorString appendString:@"completionHandler:"];
        
        SEL selector = NSSelectorFromString(selectorString);
        IMP imp = [[UIApplication sharedApplication] methodForSelector:selector];
        void (*func)(id, SEL, id, id) = (void *)imp;
        if (func)
        {
            func([UIApplication sharedApplication], selector, iconName, ^(NSError * _Nullable error) {});
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
