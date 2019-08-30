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
    [self.exploitMessageLabel setAlpha:1];
    [self.exploitProgressLabel setAlpha:1];
    [self.jailbreakProgressBar setAlpha:1];
    
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
        progress(localize(@"Unsupported"));
    } else if (prefs->restore_rootfs) {
        status(localize(@"Restore RootFS"), true, true);
        progress(localize(@"Ready to restore RootFS"));
    } else if (jailbreakEnabled()) {
        status(localize(@"Re-Jailbreak"), true, true);
        progress(localize(@"Ready to re-jailbreak"));
    } else {
        status(localize(@"Jailbreak"), true, true);
        progress(localize(@"Ready to jailbreak"));
    }
    
    release_prefs(&prefs);
}

- (void)reloadData {
    prefs_t *prefs = copy_prefs();
    release_prefs(&prefs);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.jailbreakProgressBar setProgress:0];
    [self.jailbreakProgressBar setTransform:CGAffineTransformScale(CGAffineTransformIdentity, 1, 2)];
    
    [self.settingsView setTransform:CGAffineTransformScale(CGAffineTransformIdentity, 0.7, 0.7)];
    [self.settingsView setAlpha:0];
    [self.mainDevView setTransform:CGAffineTransformScale(CGAffineTransformIdentity, 0.7, 0.7)];
    [self.mainDevView setAlpha:0];
    [self.creditsView setTransform:CGAffineTransformScale(CGAffineTransformIdentity, 0.7, 0.7)];
    [self.creditsView setAlpha:0];
}

- (void)viewDidAppear:(BOOL)animated {
    [self reloadData];
    prefs_t *prefs = copy_prefs();
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    }
    if (prefs->darkStatusBar) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    else{
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
    self.u0Label.textColor = UIColorFromRGB(prefs->u0Color);
    self.backgroundView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    self.byLabel.textColor =  UIColorFromRGB(prefs->textColor);
    self.supportedOSLabel.textColor =  UIColorFromRGB(prefs->textColor);
    self.uncoverLabel.textColor =  UIColorFromRGB(prefs->textColor);
    self.UIByLabel.textColor =  UIColorFromRGB(prefs->textColor);
    self.exploitProgressLabel.textColor =  UIColorFromRGB(prefs->u0Color);
    self.exploitMessageLabel.textColor =  UIColorFromRGB(prefs->u0Color);
    self.jailbreakProgressBar.progressTintColor = UIColorFromRGB(prefs->u0Color);
    //[self.fakeButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    self.goButton.backgroundColor = UIColorFromRGB(prefs->fakeButtonColor);
    [self.goButton setTitleColor: UIColorFromRGB(prefs->goTextColor) forState:UIControlStateNormal];
    self.outputView.backgroundColor = UIColorFromRGB(prefs->outputColor);
    self.outputView.textColor = UIColorFromRGB(prefs->outputTextColor);
    [self.tabBarController.tabBar setSelectedImageTintColor:UIColorFromRGB(prefs->pickerTintColor)];
    
    if (prefs->theme == 0) {
        UIImage *img = [UIImage imageNamed:@"picker"];
        [self.PickerButton setImage:img forState:UIControlStateNormal];
    }
    if (prefs->theme == 1) {
        UIImage *img = [UIImage imageNamed:@"purple"];
        [self.PickerButton setImage:img forState:UIControlStateNormal];
    }
    if (prefs->theme == 2) {
        UIImage *img = [UIImage imageNamed:@"white"];
        [self.PickerButton setImage:img forState:UIControlStateNormal];
    }
    if (prefs->theme == 3) {
        UIImage *img = [UIImage imageNamed:@"meridian"];
        [self.PickerButton setImage:img forState:UIControlStateNormal];
    }
    if (prefs->theme == 4) {
        UIImage *img = [UIImage imageNamed:@"meridian"];
        [self.PickerButton setImage:img forState:UIControlStateNormal];
    }
    
    release_prefs(&prefs);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _canExit = YES;
    // Do any additional setup after loading the view, typically from a nib.
    prefs_t *prefs = copy_prefs();
    
    [[UITabBar appearance] setBackgroundColor:UIColorFromRGB(prefs->backgroundColor)];
    [[UITabBar appearance] setBarTintColor:UIColorFromRGB(prefs->backgroundColor)];
    [[UITabBar appearance] setTintColor:UIColorFromRGB(prefs->backgroundColor)];
    
    if (prefs->hide_log_window) {
        _outputView.hidden = YES;
        _outputView = nil;
    }
    
    release_prefs(&prefs);
    [self updateStatus];
    [self.exploitProgressLabel setText:[NSString stringWithFormat:@"%d/%d", 0, maxStage]];
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
}

- (void)darkMode {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"darkModeSettings" object:self];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"darkModeCredits" object:self];
    
    [self.exploitProgressLabel setTextColor:[UIColor whiteColor]];
    [self.exploitMessageLabel setTextColor:[UIColor whiteColor]];
    [self.u0Label setTextColor:[UIColor whiteColor]];
    [self.uOVersionLabel setTextColor:[UIColor whiteColor]];
    [self.jailbreakLabel setTextColor:[UIColor whiteColor]];
    [self.byLabel setTextColor:[UIColor whiteColor]];
    [self.UIByLabel setTextColor:[UIColor whiteColor]];
    [self.firstAndLabel setTextColor:[UIColor whiteColor]];
    [self.uncoverLabel setTextColor:[UIColor whiteColor]];
    [self.supportedOSLabel setTextColor:[UIColor whiteColor]];
    [self.fourthAndLabel setTextColor:[UIColor whiteColor]];
    [self.outputView setTextColor:[UIColor whiteColor]];
    [self.backgroundView setBackgroundColor:[UIColor colorWithRed:10.0f/255.0f green:13.0f/255.0f blue:17.0f/255.0f alpha:0.97f]];
    self.jailbreakProgressBar.trackTintColor = [UIColor blackColor];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)lightMode {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"lightModeSettings" object:self];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"lightModeCredits" object:self];
    
    [self.exploitProgressLabel setTextColor:[UIColor blackColor]];
    [self.exploitMessageLabel setTextColor:[UIColor blackColor]];
    [self.u0Label setTextColor:[UIColor blackColor]];
    [self.jailbreakLabel setTextColor:[UIColor blackColor]];
    [self.byLabel setTextColor:[UIColor blackColor]];
    [self.UIByLabel setTextColor:[UIColor blackColor]];
    [self.firstAndLabel setTextColor:[UIColor blackColor]];
    [self.fourthAndLabel setTextColor:[UIColor blackColor]];
    [self.uncoverLabel setTextColor:[UIColor blackColor]];
    [self.supportedOSLabel setTextColor:[UIColor blackColor]];
    [self.uOVersionLabel setTextColor:[UIColor blackColor]];
    [self.outputView setTextColor:[UIColor blackColor]];
    [self.backgroundView setBackgroundColor:[UIColor.whiteColor colorWithAlphaComponent:0.84]];
    self.jailbreakProgressBar.trackTintColor = [UIColor lightGrayColor]; 
    [self setNeedsStatusBarAppearanceUpdate];
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

- (IBAction)presentViewController:(UIButton *)sender {
    prefs_t *prefs = copy_prefs();
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"True Black" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
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
    
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Dark Purple" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
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
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"White" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
       
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
    
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Meridian" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
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
        
    }]];
  
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Dark Meridian" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
       
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
        
    }]];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
    
    release_prefs(&prefs);
    
}

@end
