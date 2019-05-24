//
//  SettingsTableViewController.h
//  Undecimus
//
//  Created by Pwn20wnd on 9/14/18.
//  Copyright © 2018 - 2019 Pwn20wnd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "common.h"
#import "utils.h"

@interface SettingsTableViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UISwitch *LoadDaemonsSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *DumpAPTicketSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *RefreshIconCacheSwitch;
@property (weak, nonatomic) IBOutlet UITextField *BootNonceTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *KernelExploitSegmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (weak, nonatomic) IBOutlet UISwitch *DisableAutoUpdatesSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *DisableAppRevokesSwitch;
@property (nonatomic) UITapGestureRecognizer *tap;
@property (weak, nonatomic) IBOutlet UIButton *ShareDiagnosticsDataButton;
@property (weak, nonatomic) IBOutlet UIButton *OpenCydiaButton;
@property (weak, nonatomic) IBOutlet UIButton *OpenSileoButton;
@property (weak, nonatomic) IBOutlet UITextField *ExpiryLabel;
@property (weak, nonatomic) IBOutlet UISwitch *OverwriteBootNonceSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *ExportKernelTaskPortSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *RestoreRootFSSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *installCydiaSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *installSSHSwitch;
@property (weak, nonatomic) IBOutlet UITextField *UptimeLabel;
@property (weak, nonatomic) IBOutlet UISwitch *IncreaseMemoryLimitSwitch;
@property (weak, nonatomic) IBOutlet UITextField *ECIDLabel;
@property (weak, nonatomic) IBOutlet UISwitch *ReloadSystemDaemonsSwitch;
@property (weak, nonatomic) IBOutlet UIButton *RestartSpringBoardButton;
@property (weak, nonatomic) IBOutlet UISwitch *HideLogWindowSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *ResetCydiaCacheSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *SSHOnlySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *EnableGetTaskAllowSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *SetCSDebuggedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *AutoRespringSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HideProgressHUDSwitch;

@property (weak, nonatomic) IBOutlet UITextField *themeField;
@property (nonatomic) UIPickerView *themePicker;
@property (nonatomic) NSMutableArray *themePickerData;
@property (weak, nonatomic) IBOutlet UILabel *SpecialThanksLabel;
@property (weak, nonatomic) IBOutlet UIView *SpecialThanksContentView;
@property (weak, nonatomic) IBOutlet UITableViewCell *SpecialThanksTableViewCell;
@property (weak, nonatomic) IBOutlet UILabel *LoadDaemonsLabel;
@property (weak, nonatomic) IBOutlet UIView *LoadDaemonsContentView;
@property (weak, nonatomic) IBOutlet UILabel *DumpApTicketLabel;
@property (weak, nonatomic) IBOutlet UIView *DumpApTicketContentView;
@property (weak, nonatomic) IBOutlet UILabel *RefreshIconCacheLabel;
@property (weak, nonatomic) IBOutlet UIView *RefreshIconCacheContentView;
@property (weak, nonatomic) IBOutlet UINavigationItem *settingsNavigationItem;
@property (weak, nonatomic) IBOutlet UILabel *DisableAutoUpdatesLabel;
@property (weak, nonatomic) IBOutlet UIView *DisableAutoUpdatesContentView;
@property (weak, nonatomic) IBOutlet UILabel *DisableAppRevokesLabel;
@property (weak, nonatomic) IBOutlet UIView *DisableAppRevokesContentView;
@property (weak, nonatomic) IBOutlet UILabel *OverwriteBootNonceLabel;
@property (weak, nonatomic) IBOutlet UIView *OverwriteBootNonceContentView;
@property (weak, nonatomic) IBOutlet UILabel *ExportTFP0Label;
@property (weak, nonatomic) IBOutlet UIView *ExportTFP0ContentView;
@property (weak, nonatomic) IBOutlet UILabel *RestoreRootFSLabel;
@property (weak, nonatomic) IBOutlet UIView *RestoreRootFSContentView;
@property (weak, nonatomic) IBOutlet UILabel *IncreaseMemoryLimitLabel;
@property (weak, nonatomic) IBOutlet UIView *IncreaseMemoryLimitContentView;
@property (weak, nonatomic) IBOutlet UILabel *ReInstallOpenSSHLabel;
@property (weak, nonatomic) IBOutlet UIView *ReInstallOpenSSHContentView;
@property (weak, nonatomic) IBOutlet UILabel *ReinstallCydiaLabel;
@property (weak, nonatomic) IBOutlet UIView *ReinstallCydiaContentView;
@property (weak, nonatomic) IBOutlet UILabel *ReloadSystemDaemonsLabel;
@property (weak, nonatomic) IBOutlet UIView *ReloadSystemDaemonsContentView;
@property (weak, nonatomic) IBOutlet UILabel *HideLogWindowLabel;
@property (weak, nonatomic) IBOutlet UIView *HideLogWindowContentView;
@property (weak, nonatomic) IBOutlet UILabel *ResetCydiaCacheLabel;
@property (weak, nonatomic) IBOutlet UIView *ResetCydiaCacheContentView;
@property (weak, nonatomic) IBOutlet UILabel *SSHOnlyLabel;
@property (weak, nonatomic) IBOutlet UIView *SSHOnlyContentView;
@property (weak, nonatomic) IBOutlet UILabel *EnableGetTaskAllowLabel;
@property (weak, nonatomic) IBOutlet UIView *EnableGetTaskAllowContentView;
@property (weak, nonatomic) IBOutlet UIView *SetCSDEBUGGEDContentView;
@property (weak, nonatomic) IBOutlet UILabel *SetCSDEBUGGEDLabel;
@property (weak, nonatomic) IBOutlet UIView *AutoRespringContentView;
@property (weak, nonatomic) IBOutlet UILabel *AutoRespringLabel;
@property (weak, nonatomic) IBOutlet UIView *HideProgressHUDContentView;
@property (weak, nonatomic) IBOutlet UILabel *HideProgressHUDLabel;

@property (weak, nonatomic) IBOutlet UILabel *ThemeLabel;
@property (weak, nonatomic) IBOutlet UIView *ThemeContentView;
@property (weak, nonatomic) IBOutlet UILabel *KernelExploitLabel;
@property (weak, nonatomic) IBOutlet UIView *KernelExploitContentView;
@property (weak, nonatomic) IBOutlet UIButton *BootNonceButtonLabel;
@property (weak, nonatomic) IBOutlet UIView *BootNonceContentView;
@property (weak, nonatomic) IBOutlet UIButton *ECIDButton;
@property (weak, nonatomic) IBOutlet UIView *ECIDContentView;
@property (weak, nonatomic) IBOutlet UILabel *ExpiryButton;
@property (weak, nonatomic) IBOutlet UIView *ExpiryContentView;
@property (weak, nonatomic) IBOutlet UILabel *UptimeButton;
@property (weak, nonatomic) IBOutlet UIView *UptimeContentView;
@property (weak, nonatomic) IBOutlet UISwitch *ReInstallSileoSwitchSwitch;
@property (weak, nonatomic) IBOutlet UIView *ReInstallSileoSwitchView;
@property (weak, nonatomic) IBOutlet UILabel *ReInstallSileoSwitchLabel;
@property (weak, nonatomic) IBOutlet UIView *RestartButtonContentView;
@property (weak, nonatomic) IBOutlet UIView *ShareDiagnosticsDataContentView;
@property (weak, nonatomic) IBOutlet UIView *OpenCydiaContentView;
@property (weak, nonatomic) IBOutlet UIView *OpenSileoContentView;
@property (weak, nonatomic) IBOutlet UIButton *ViewSourceCodeButton;
@property (weak, nonatomic) IBOutlet UIView *ViewSourceCodeContentView;
@property (weak, nonatomic) IBOutlet UIButton *AutoSelectExploitButton;
@property (weak, nonatomic) IBOutlet UIView *AutoSelectExploitContentView;
@property (weak, nonatomic) IBOutlet UIView *RestartSpringBoardContentView;
@property (weak, nonatomic) IBOutlet UIButton *CleanDiagnosticsDataButton;
@property (weak, nonatomic) IBOutlet UIView *CleanDiagnosticsDataContentView;
@property (weak, nonatomic) IBOutlet UIView *CheckForUpdateContentView;
@property (weak, nonatomic) IBOutlet UIButton *CheckForUpdateButton;


@property (strong, nonatomic) IBOutlet UITableView *SettingsTableView;

+ (NSDictionary *)provisioningProfileAtPath:(NSString *)path;

@end

