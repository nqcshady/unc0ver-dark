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

    self.restartButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);

    self.ShareDiagnosticsDataButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);

    self.OpenCydiaButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);

    self.OpenSileoButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);

    self.ViewSourceCodeButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);

    self.AutoSelectExploitButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);

    self.RestartSpringBoardButton.titleLabel.textColor = UIColorFromRGB(prefs->darkTextColor);

    self.CleanDiagnosticsDataButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);

    self.CheckForUpdateButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    
    [self.navigationController.view setTintColor:UIColorFromRGB(prefs->backgroundColor)];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(prefs->backgroundColor);
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : UIColorFromRGB(prefs->textColor)};
    self.navigationController.navigationBar.translucent = NO;

    release_prefs(&prefs);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(10,10,200,200)];
    [myView setAlpha:0];
    [myView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    prefs_t *prefs = copy_prefs();
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    }
    [myView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setBackgroundColor:UIColorFromRGB(prefs->backgroundColor)];
    [self.SettingsTableView setBackgroundColor:UIColorFromRGB(prefs->backgroundColor)];
    [[UINavigationBar appearance] setTintColor:UIColorFromRGB(prefs->backgroundColor)];
    UINavigationBar *bar = [self.navigationController navigationBar];
    [bar setBarTintColor:UIColorFromRGB(prefs->backgroundColor)];
    self.navigationController.navigationBar.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    [self.navigationController.view setBackgroundColor:UIColorFromRGB(prefs->backgroundColor)];
    [self.navigationController.view setTintColor:UIColorFromRGB(prefs->backgroundColor)];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(prefs->backgroundColor);
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBarTintColor:UIColorFromRGB(prefs->backgroundColor)];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    [self.navigationController.view setTintColor:UIColorFromRGB(prefs->backgroundColor)];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(prefs->backgroundColor);
    self.navigationController.navigationBar.translucent = NO;
    
    self.restartButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    //self.RestartButtonContentView.backgroundColor = [UIColor blackColor];
    
    self.ShareDiagnosticsDataButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    //self.ShareDiagnosticsDataContentView.backgroundColor = [UIColor blackColor];
    
    self.OpenCydiaButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    //self.OpenCydiaContentView.backgroundColor = [UIColor blackColor];
    
    self.OpenSileoButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    //self.OpenSileoContentView.backgroundColor = [UIColor blackColor];
    
    self.ViewSourceCodeButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    //self.ViewSourceCodeContentView.backgroundColor = [UIColor blackColor];
    
    self.AutoSelectExploitButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    //self.AutoSelectExploitContentView.backgroundColor = [UIColor blackColor];
    
    self.RestartSpringBoardButton.titleLabel.textColor = UIColorFromRGB(prefs->darkTextColor);
    //self.RestartSpringBoardContentView.backgroundColor = [UIColor blackColor];
    
    self.CleanDiagnosticsDataButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    //self.CleanDiagnosticsDataContentView.backgroundColor = [UIColor blackColor];
    
    self.CheckForUpdateButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    //self.CheckForUpdateContentView.backgroundColor = [UIColor blackColor];
    
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
    [_themePickerData addObject:@"Meridian"];
    [_themePickerData addObject:@"Dark Meridian"];
    [[self themePicker] setDataSource:self];
    [[self themePicker] setDelegate:self];
    UIView *themeFieldInputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, toolBar.frame.size.height + _themePicker.frame.size.height)];
    themeFieldInputView.backgroundColor = [UIColor clearColor];
    [themeFieldInputView addSubview:_themePicker];
    [themeFieldInputView addSubview:toolBar];
    [self.themeField setInputView:themeFieldInputView];
    if (prefs->theme == 0) {
        [self.themePicker selectRow:0 inComponent:0 animated:YES];
    }
    if (prefs->theme == 1) {
        [self.themePicker selectRow:1 inComponent:0 animated:YES];
    }
    if (prefs->theme == 2) {
        [self.themePicker selectRow:2 inComponent:0 animated:YES];
    }
    if (prefs->theme == 3) {
        [self.themePicker selectRow:3 inComponent:0 animated:YES];
    }
    if (prefs->theme == 4) {
        [self.themePicker selectRow:4 inComponent:0 animated:YES];
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
    [self.InstallSileoSwitch setOn:(BOOL)prefs->install_sileo];
    [self.LoadTweaksSwitch setOn:(BOOL)prefs->load_tweaks];
    [self.DumpAPTicketSwitch setOn:(BOOL)prefs->dump_apticket];
    [self.BootNonceTextField setPlaceholder:@(prefs->boot_nonce)];
    [self.BootNonceTextField setText:nil];
    [self.RefreshIconCacheSwitch setOn:(BOOL)prefs->run_uicache];
    [self.KernelExploitSegmentedControl setSelectedSegmentIndex:(int)prefs->exploit];
    [self.DisableAutoUpdatesSwitch setOn:(BOOL)prefs->disable_auto_updates];
    [self.DisableAppRevokesSwitch setOn:(BOOL)prefs->disable_app_revokes];
    if(!supportsExploit(async_wake_exploit)){[self.KernelExploitSegmentedControl setEnabled:NO forSegmentAtIndex:async_wake_exploit];[self.KernelExploitSegmentedControl setWidth:0.0001 forSegmentAtIndex:async_wake_exploit];}
    if(!supportsExploit(voucher_swap_exploit)){[self.KernelExploitSegmentedControl setEnabled:NO forSegmentAtIndex:voucher_swap_exploit];[self.KernelExploitSegmentedControl setWidth:0.0001 forSegmentAtIndex:voucher_swap_exploit];}
    if(!supportsExploit(mach_swap_exploit)){[self.KernelExploitSegmentedControl setEnabled:NO forSegmentAtIndex:mach_swap_exploit];[self.KernelExploitSegmentedControl setWidth:0.0001 forSegmentAtIndex:mach_swap_exploit];}
    if(!supportsExploit(mach_swap_2_exploit)){[self.KernelExploitSegmentedControl setEnabled:NO forSegmentAtIndex:mach_swap_2_exploit];[self.KernelExploitSegmentedControl setWidth:0.0001 forSegmentAtIndex:mach_swap_2_exploit];}
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
    [self.AutoRespringSwitch setOn:(BOOL)prefs->auto_respring];
    [self.HideProgressHUDSwitch setOn:(BOOL)prefs->hide_progress_hud];
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
    if (prefs->theme == 3) {
        [self.themeField setPlaceholder:@"Meridian"];
    }
    if (prefs->theme == 4) {
        [self.themeField setPlaceholder:@"Dark Meridian"];
    }
    [self.RestartSpringBoardButton setEnabled:respringSupported()];
    [self.restartButton setEnabled:restartSupported()];
    release_prefs(&prefs);
    [JailbreakViewController.sharedController updateStatus];
    [self.tableView reloadData];
}

- (IBAction)LoadDaemonsSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->load_daemons = (bool)self.LoadDaemonsSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)installSileoSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->install_sileo = (bool)self.InstallSileoSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)loadTweaksSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->load_tweaks = (bool)self.LoadTweaksSwitch.isOn;
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
    void (^const block)(void) = ^(void) {
        notice(localize(@"Preference was changed. The app will now exit."), true, false);
        exit(EXIT_SUCCESS);
    };
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), block);
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
        
    self.SpecialThanksLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.SpecialThanksContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.SpecialThanksTableViewCell.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.LoadDaemonsLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.LoadDaemonsContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.LoadDaemonsSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.LoadTweaksLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.LoadTweaksContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.LoadTweaksSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.DumpApTicketLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.DumpApTicketContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.DumpAPTicketSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.RefreshIconCacheLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.RefreshIconCacheContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.RefreshIconCacheSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.DisableAutoUpdatesLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.DisableAutoUpdatesContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.DisableAutoUpdatesSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.DisableAppRevokesLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.DisableAppRevokesContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.DisableAppRevokesSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.OverwriteBootNonceLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.OverwriteBootNonceContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.OverwriteBootNonceSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.ExportTFP0Label.textColor = UIColorFromRGB(prefs->textColor);
    self.ExportTFP0ContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.ExportKernelTaskPortSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.RestoreRootFSLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.RestoreRootFSContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.RestoreRootFSSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.IncreaseMemoryLimitLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.IncreaseMemoryLimitContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.IncreaseMemoryLimitSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.ReInstallOpenSSHLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.ReInstallOpenSSHContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.installSSHSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.ReinstallCydiaLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.ReinstallCydiaContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.installCydiaSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.ReloadSystemDaemonsLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.ReloadSystemDaemonsContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.ReloadSystemDaemonsSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.HideLogWindowLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.HideLogWindowContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.HideLogWindowSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.ResetCydiaCacheLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.ResetCydiaCacheContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.ResetCydiaCacheSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.SSHOnlyLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.SSHOnlyContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.SSHOnlySwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.EnableGetTaskAllowLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.EnableGetTaskAllowContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.EnableGetTaskAllowSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.SetCSDEBUGGEDLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.SetCSDEBUGGEDContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.SetCSDebuggedSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.AutoRespringLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.AutoRespringContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.AutoRespringSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.HideProgressHUDLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.HideProgressHUDContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.HideProgressHUDSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.themeField.textColor = UIColorFromRGB(prefs->textColor);
    self.ThemeContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.ThemeLabel.textColor = UIColorFromRGB(prefs->textColor);
    [self.themeField setValue:UIColorFromRGB(prefs->textColor)
                   forKeyPath:@"_placeholderLabel.textColor"];
    
    self.KernelExploitLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.KernelExploitContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.KernelExploitSegmentedControl.tintColor = UIColorFromRGB(prefs->pickerTintColor);
    
    self.LoadDaemonsLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.LoadDaemonsContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.LoadDaemonsSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.InstallSileoLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.InstallSileoSwitchContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.InstallSileoSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);
    
    self.ReInstallSileoSwitchLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.ReInstallSileoSwitchView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.ReInstallSileoSwitchSwitch.onTintColor = UIColorFromRGB(prefs->tintColor);

    self.restartButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    self.RestartButtonContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);

    self.ShareDiagnosticsDataButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    self.ShareDiagnosticsDataContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);

    self.OpenCydiaButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    self.OpenCydiaContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);

    self.OpenSileoButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    self.OpenSileoContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);

    self.ViewSourceCodeButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    self.ViewSourceCodeContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);

    self.AutoSelectExploitButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    self.AutoSelectExploitContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);

    self.RestartSpringBoardButton.titleLabel.textColor = UIColorFromRGB(prefs->darkTextColor);
    self.RestartSpringBoardContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);

    self.CleanDiagnosticsDataButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    self.CleanDiagnosticsDataContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);

    self.CheckForUpdateButton.titleLabel.textColor = UIColorFromRGB(prefs->linkColor);
    self.CheckForUpdateContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    [self.BootNonceTextField setTextColor:UIColorFromRGB(prefs->textColor)];
    self.BootNonceContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    [self.BootNonceButtonLabel setTitleColor: UIColorFromRGB(prefs->textColor) forState:UIControlStateNormal];
    [self.BootNonceTextField setValue:UIColorFromRGB(prefs->textColor)
                    forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.ECIDLabel setTextColor:UIColorFromRGB(prefs->textColor)];
    self.ECIDContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    [self.ECIDButton setTitleColor:UIColorFromRGB(prefs->textColor) forState:UIControlStateNormal];
    [self.ECIDLabel setValue:UIColorFromRGB(prefs->textColor)
                           forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.ExpiryLabel setTextColor:UIColorFromRGB(prefs->textColor)];
    self.ExpiryContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.ExpiryButton.textColor = UIColorFromRGB(prefs->textColor);
    [self.ExpiryLabel setValue:UIColorFromRGB(prefs->textColor)
                           forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.UptimeLabel setTextColor:UIColorFromRGB(prefs->textColor)];
    self.UptimeContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.UptimeButton.textColor = UIColorFromRGB(prefs->textColor);
    [self.UptimeLabel setValue:UIColorFromRGB(prefs->textColor)
                           forKeyPath:@"_placeholderLabel.textColor"];
    
    self.SettingsTableView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.navigationController.navigationBar.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.navigationController.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName: UIColorFromRGB(prefs->textColor)};
    //self.navigationController.navigationBar.tintColor = UIColorFromRGB(prefs->backgroundColor);
    
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

- (IBAction)setAutoRespring:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->auto_respring = (bool)self.AutoRespringSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)setHideProgressHUD:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->hide_progress_hud = (bool)self.HideProgressHUDSwitch.isOn;
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
        prefs->backgroundColor = 0x000000;
        prefs->u0Color = 0xffffff;
        prefs->fakeButtonColor = 0xffffff;
        prefs->fakeTintColor = 0x4B4B4B;
        prefs->fakeTextColor = 0xffffff;
        prefs->goTextColor = 0x000000;
        prefs->outputColor = 0x000000;
        prefs->outputTextColor = 0xffffff;
        prefs->pickerTintColor = 0xffffff;
        prefs->tintColor = 0x4B4B4B;
        prefs->textColor = 0xffffff;
        prefs->darkTextColor = 0x56555A;
        prefs->linkColor = 0xffffff;
        prefs->darkStatusBar = YES;
        set_prefs(prefs);
    }
    if ([[_themePickerData objectAtIndex:row] isEqualToString:@"Dark Purple"]) {
        prefs->theme = 1;
        prefs->backgroundColor = 0x17151C;
        prefs->u0Color = 0x723F8C;
        prefs->fakeButtonColor = 0x120F1A;
        prefs->fakeTintColor = 0x723F8C;
        prefs->fakeTextColor = 0xE9E9EA;
        prefs->goTextColor = 0x723F8C;
        prefs->outputColor = 0x17151C;
        prefs->outputTextColor = 0xE9E9EA;
        prefs->pickerTintColor = 0x723F8C;
        prefs->tintColor = 0x723F8C;
        prefs->textColor = 0xE9E9EA;
        prefs->darkTextColor = 0x56555A;
        prefs->linkColor = 0xE9E9EA;
        prefs->darkStatusBar = YES;
        set_prefs(prefs);
    }
    if ([[_themePickerData objectAtIndex:row] isEqualToString:@"White"]) {
        prefs->theme = 2;
        prefs->backgroundColor = 0xffffff;
        prefs->u0Color = 0x000000;
        prefs->fakeButtonColor = 0x006FFF;
        prefs->fakeTintColor = 0x43D359;
        prefs->fakeTextColor = 0xffffff;
        prefs->goTextColor = 0xffffff;
        prefs->outputColor = 0xffffff;
        prefs->outputTextColor = 0x000000;
        prefs->pickerTintColor = 0x006FFF;
        prefs->tintColor = 0x006FFF;
        prefs->textColor = 0x000000;
        prefs->darkTextColor = 0x56555A;
        prefs->linkColor = 0x006FFF;
        prefs->darkStatusBar = NO;
        set_prefs(prefs);
    }
    if ([[_themePickerData objectAtIndex:row] isEqualToString:@"Meridian"]) {
        prefs->theme = 3;
        prefs->backgroundColor = 0xffffff;
        prefs->u0Color = 0xE30125;
        prefs->fakeButtonColor = 0xE30125;
        prefs->fakeTintColor = 0xE30125;
        prefs->fakeTextColor = 0x000000;
        prefs->goTextColor = 0xffffff;
        prefs->outputColor = 0xffffff;
        prefs->outputTextColor = 0x000000;
        prefs->pickerTintColor = 0xE30125;
        prefs->tintColor = 0xE30125;
        prefs->textColor = 0x000000;
        prefs->darkTextColor = 0x56555A;
        prefs->linkColor = 0xE30125;
        prefs->darkStatusBar = NO;
        set_prefs(prefs);
    }
    if ([[_themePickerData objectAtIndex:row] isEqualToString:@"Dark Meridian"]) {
        prefs->theme = 4;
        prefs->backgroundColor = 0x000000;
        prefs->u0Color = 0xE30125;
        prefs->fakeButtonColor = 0xE30125;
        prefs->fakeTintColor = 0xE30125;
        prefs->fakeTextColor = 0xffffff;
        prefs->goTextColor = 0xffffff;
        prefs->outputColor = 0x000000;
        prefs->outputTextColor = 0xffffff;
        prefs->pickerTintColor = 0xE30125;
        prefs->tintColor = 0xE30125;
        prefs->textColor = 0xffffff;
        prefs->darkTextColor = 0x56555A;
        prefs->linkColor = 0xE30125;
        prefs->darkStatusBar = YES;
        set_prefs(prefs);
    }
    release_prefs(&prefs);
}

-(void)pickerDoneButton{
    prefs_t *prefs = copy_prefs();
    if (prefs->theme == 4) {
        [self lc_setAlternateIconName:@"DarkMeridianIcon"];
    } else if (prefs->theme == 3) {
        [self lc_setAlternateIconName:@"MeridianIcon"];
    } else if (prefs->theme == 2) {
        [self lc_setAlternateIconName:@"WhiteIcon"];
    } else if (prefs->theme == 1) {
        [self lc_setAlternateIconName:@"PurpleIcon"];
    } else {
        [self lc_setAlternateIconName:nil];
    }
    [_themeField resignFirstResponder];
    release_prefs(&prefs);
    [self reloadData];
    void (^const block)(void) = ^(void) {
        notice(localize(@"Theme was changed. The app will now exit."), true, false);
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
