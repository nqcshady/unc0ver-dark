//
//  JailbreakViewController.m
//  Undecimus
//
//  Created by pwn20wnd on 8/29/18.
//  Copyright © 2018 - 2019 Pwn20wnd. All rights reserved.
//

#include <common.h>
#include <sys/time.h>
#import "JailbreakViewController.h"
#import "SettingsTableViewController.h"
#import "CreditsTableViewController.h"
#include "jailbreak.h"
#include "prefs.h"
#include "utils.h"

@interface JailbreakViewController ()

@end

@implementation JailbreakViewController
static JailbreakViewController *sharedController = nil;
static NSMutableString *output = nil;

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

static NSString *bundledResources = nil;
extern int maxStage;

- (IBAction)tappedOnJailbreak:(id)sender
{
    status(localize(@"Jailbreak"), false, false);
    void (^const block)(void) = ^(void) {
        _assert(bundledResources != nil, localize(@"Bundled Resources version missing."), true);
        if (!jailbreakSupported()) {
            status(localize(@"Unsupported"), false, true);
            return;
        }
        jailbreak();
    };
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), block);
}

- (void)updateStatus {
    prefs_t *prefs = copy_prefs();
    
    if (!jailbreakSupported()) {
        status(localize(@"Unsupported"), false, true);
    } else if (prefs->restore_rootfs) {
        status(localize(@"Restore RootFS"), true, true);
    } else if (jailbreakEnabled()) {
        status(localize(@"Re-Jailbreak"), true, true);
    } else {
        status(localize(@"Jailbreak"), true, true);
    }
    
    release_prefs(&prefs);
}

- (void)viewDidAppear:(BOOL)animated {
    [self reloadData];
    prefs_t *prefs = copy_prefs();
    
    if (prefs->reinstall_sileo_switch)
    {
        self.installSileoLabel.hidden = true;
        self.installSileoSwitch.hidden = true;
        CGRect buttonFrame = self.fakeButton.frame;
        buttonFrame.size = CGSizeMake(222, 58);
        self.fakeButton.frame = buttonFrame;
    }
    else
    {
        self.installSileoLabel.hidden = false;
        self.installSileoSwitch.hidden = false;
        CGRect buttonFrame = self.fakeButton.frame;
        buttonFrame.size = CGSizeMake(222, 103);
        self.fakeButton.frame = buttonFrame;
    }
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    }
    if (prefs->darkStatusBar) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    self.u0Label.textColor = UIColorFromRGB(prefs->u0Color);
    self.backgroundView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.byLabel.textColor =  UIColorFromRGB(prefs->textColor);
    self.forLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.fakeButton.backgroundColor = UIColorFromRGB(prefs->fakeButtonColor);
    //[self.fakeButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    self.loadTweaksLabel.textColor = UIColorFromRGB(prefs->fakeTextColor);
    self.installSileoLabel.textColor = UIColorFromRGB(prefs->fakeTextColor);
    self.goButton.backgroundColor = UIColorFromRGB(prefs->fakeButtonColor);
    [self.goButton setTitleColor: UIColorFromRGB(prefs->goTextColor) forState:UIControlStateNormal];
    self.installSileoSwitch.onTintColor = UIColorFromRGB(prefs->fakeTintColor);
    self.TweakInjectionSwitch.onTintColor = UIColorFromRGB(prefs->fakeTintColor);
    self.outputView.backgroundColor = UIColorFromRGB(prefs->outputColor);
    self.outputView.textColor = UIColorFromRGB(prefs->outputTextColor);
    [self.tabBarController.tabBar setSelectedImageTintColor:UIColorFromRGB(prefs->pickerTintColor)];
    
    release_prefs(&prefs);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _canExit = YES;
    // Do any additional setup after loading the view, typically from a nib.
    prefs_t *prefs = copy_prefs();
    if (prefs->reinstall_sileo_switch)
    {
        _goButtonSpacing.constant += -37;
    }
    else
    {
        _goButtonSpacing.constant += 8;
    }
    if (prefs->hide_log_window) {
        _outputView.hidden = YES;
        _outputView = nil;
        _goButtonSpacing.constant += 80;
    }
    
    [[UITabBar appearance] setBackgroundColor:UIColorFromRGB(prefs->backgroundColor)];
    [[UITabBar appearance] setBarTintColor:UIColorFromRGB(prefs->backgroundColor)];
    [[UITabBar appearance] setTintColor:UIColorFromRGB(prefs->backgroundColor)];
    
    release_prefs(&prefs);
    sharedController = self;
    bundledResources = bundledResourcesVersion();
    LOG("unc0ver dark Version: %@", appVersion());
    printOSDetails();
    LOG("Bundled Resources Version: %@", bundledResources);
    if (bundledResources == nil) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
            showAlert(localize(@"Error"), localize(@"Bundled Resources version is missing. This build is invalid."), false, false);
        });
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
        NSString *Update = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://github.com/nqcshady/unc0ver-dark/raw/master/Update.txt"] encoding:NSUTF8StringEncoding error:nil];
        if (Update == nil) {
            notice(localize(@"Failed to check for update."), true, false);
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
        }
    });
    
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)reloadData {
    prefs_t *prefs = copy_prefs();
    [self.TweakInjectionSwitch setOn:(BOOL)prefs->load_tweaks];
    [self.installSileoSwitch setOn:(BOOL)prefs->install_sileo];
    release_prefs(&prefs);
}

- (IBAction)TweakInjectionSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->load_tweaks = (bool)self.TweakInjectionSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

- (IBAction)installSileoSwitchTriggered:(id)sender {
    prefs_t *prefs = copy_prefs();
    prefs->install_sileo = (bool)self.installSileoSwitch.isOn;
    set_prefs(prefs);
    release_prefs(&prefs);
    [self reloadData];
}

// This intentionally returns nil if called before it's been created by a proper init
+(JailbreakViewController *)sharedController {
    return sharedController;
}

-(void)updateOutputView {
    [self updateOutputViewFromQueue:@NO];
}

-(void)updateOutputViewFromQueue:(NSNumber*)fromQueue {
    static BOOL updateQueued = NO;
    static struct timeval last = {0,0};
    static dispatch_queue_t updateQueue;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        updateQueue = dispatch_queue_create("updateView", NULL);
    });
    
    dispatch_async(updateQueue, ^{
        struct timeval now;

        if (fromQueue.boolValue) {
            updateQueued = NO;
        }
        
        if (updateQueued) {
            return;
        }
        
        if (gettimeofday(&now, NULL)) {
            LOG("gettimeofday failed");
            return;
        }
        
        uint64_t elapsed = (now.tv_sec - last.tv_sec) * 1000000 + now.tv_usec - last.tv_usec;
        // 30 FPS
        if (elapsed > 1000000/30) {
            updateQueued = NO;
            gettimeofday(&last, NULL);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.outputView.text = output;
                [self.outputView scrollRangeToVisible:NSMakeRange(self.outputView.text.length, 0)];
            });
        } else {
            NSTimeInterval waitTime = ((1000000/30) - elapsed) / 1000000.0;
            updateQueued = YES;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self performSelector:@selector(updateOutputViewFromQueue:) withObject:@YES afterDelay:waitTime];
            });
        }
    });
}

-(void)appendTextToOutput:(NSString *)text {
    if (_outputView == nil) {
        return;
    }
    static NSRegularExpression *remove = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        remove = [NSRegularExpression regularExpressionWithPattern:@"^\\d{4}-\\d{2}-\\d{2}\\s\\d{2}:\\d{2}:\\d{2}\\.\\d+[-\\d\\s]+\\S+\\[\\d+:\\d+\\]\\s+"
                                                           options:NSRegularExpressionAnchorsMatchLines error:nil];
        output = [NSMutableString new];
    });
    
    text = [remove stringByReplacingMatchesInString:text options:0 range:NSMakeRange(0, text.length) withTemplate:@""];

    @synchronized (output) {
        [output appendString:text];
    }
    [self updateOutputView];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    @synchronized(sharedController) {
        if (sharedController == nil) {
            sharedController = [super initWithCoder:aDecoder];
        }
    }
    self = sharedController;
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    @synchronized(sharedController) {
        if (sharedController == nil) {
            sharedController = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        }
    }
    self = sharedController;
    return self;
}

- (id)init {
    @synchronized(sharedController) {
        if (sharedController == nil) {
            sharedController = [super init];
        }
    }
    self = sharedController;
    return self;
}

@end
