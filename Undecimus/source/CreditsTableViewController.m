//
//  CreditsTableViewController.m
//  Undecimus
//
//  Created by Pwn20wnd on 9/14/18.
//  Copyright © 2018 - 2019 Pwn20wnd. All rights reserved.
//

#import "CreditsTableViewController.h"
#import "SettingsTableViewController.h"

@interface CreditsTableViewController ()

@end

@implementation CreditsTableViewController

-(void)viewDidLayoutSubviews {
    
    BOOL switchOn = [[NSUserDefaults standardUserDefaults] boolForKey:K_LIGHT_THEME];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (switchOn)
    {
        self.pwn20wndButton.titleLabel.textColor = [UIColor blackColor];
        self.pwn20wndContentView.backgroundColor = [UIColor whiteColor];
        
        self.sbingnerButton.titleLabel.textColor = [UIColor blackColor];
        self.sbingerContentView.backgroundColor = [UIColor whiteColor];
        
        self.i41nbeerButton.titleLabel.textColor = [UIColor blackColor];
        self.i41nbeerContentView.backgroundColor = [UIColor whiteColor];
        
        self._bazadButton.titleLabel.textColor = [UIColor blackColor];
        self._bazadContentView.backgroundColor = [UIColor whiteColor];
        
        self.MorpheusButton.titleLabel.textColor = [UIColor blackColor];
        self.MorpheusContentView.backgroundColor = [UIColor whiteColor];
        
        self.xerubButton.titleLabel.textColor = [UIColor blackColor];
        self.xerubContentView.backgroundColor = [UIColor whiteColor];
        
        self.ibsparkesButton.titleLabel.textColor = [UIColor blackColor];
        self.ibsparkesContentView.backgroundColor = [UIColor whiteColor];
        
        self.stek29Button.titleLabel.textColor = [UIColor blackColor];
        self.stek29ContentView.backgroundColor = [UIColor whiteColor];
        
        self.theninjaprawnButton.titleLabel.textColor = [UIColor blackColor];
        self.theninjaprawnContentView.backgroundColor = [UIColor whiteColor];
        
        self.jonathansealsButton.titleLabel.textColor = [UIColor blackColor];
        self.JonathansealsContentView.backgroundColor = [UIColor whiteColor];
        
        self.saurikButton.titleLabel.textColor = [UIColor blackColor];
        self.saurikContentView.backgroundColor = [UIColor whiteColor];
        
        self.fce365Button.titleLabel.textColor = [UIColor blackColor];
        self.fce365ContentView.backgroundColor = [UIColor whiteColor];
        
        self.tihmstarButton.titleLabel.textColor = [UIColor blackColor];
        self.tihmstarContentView.backgroundColor = [UIColor whiteColor];
        
        self.s1guzaButton.titleLabel.textColor = [UIColor blackColor];
        self.s1guzaContentView.backgroundColor = [UIColor whiteColor];
        
        self.S0rryMyBadButton.titleLabel.textColor = [UIColor blackColor];
        self.s0rrymybadContentView.backgroundColor = [UIColor whiteColor];
        
        self.externalistButton.titleLabel.textColor = [UIColor blackColor];
        self.externatlistContentView.backgroundColor = [UIColor whiteColor];
        
        self.realbrighiupButton.titleLabel.textColor = [UIColor blackColor];
        self.realbrighiuoContentView.backgroundColor = [UIColor whiteColor];
        
        self.pwn20wndButton.titleLabel.textColor = [UIColor blackColor];
        self.pwn20wndContentView.backgroundColor = [UIColor whiteColor];
        
        self.nitotvButton.titleLabel.textColor = [UIColor blackColor];
        self.nitotvContentView.backgroundColor = [UIColor whiteColor];
        
        self._matchsticButton.titleLabel.textColor = [UIColor blackColor];
        self.matchsticContentView.backgroundColor = [UIColor whiteColor];
        
        self.umanghereButton.titleLabel.textColor = [UIColor blackColor];
        self.umanghereContentView.backgroundColor = [UIColor whiteColor];
        
        self.miscmistyButton.titleLabel.textColor = [UIColor blackColor];
        self.miscmistyContentView.backgroundColor = [UIColor whiteColor];
        
        self.pimskeksButton.titleLabel.textColor = [UIColor blackColor];
        self.pimmskeksContentView.backgroundColor = [UIColor whiteColor];
        
        self.coolstarorgButton.titleLabel.textColor = [UIColor blackColor];
        self.coolstarorgContentView.backgroundColor = [UIColor whiteColor];
        
        self.diatrusButton.titleLabel.textColor = [UIColor blackColor];
        self.diatrusContentView.backgroundColor = [UIColor whiteColor];
        
        self.HydriButton.titleLabel.textColor = [UIColor blackColor];
        self.HydriContentView.backgroundColor = [UIColor whiteColor];
        
        self.c9shadyButton.titleLabel.textColor = [UIColor blackColor];
        self.c9shadyContentView.backgroundColor = [UIColor whiteColor];
        
        self.pixelomerButton.titleLabel.textColor = [UIColor blackColor];
        self.pixelomerContentView.backgroundColor = [UIColor whiteColor];
        
        self.libimobiledeviceButton.titleLabel.textColor = [UIColor blackColor];
        self.libimobiledeviceContentView.backgroundColor = [UIColor whiteColor];
        
        self.undecimusresourcesButton.titleLabel.textColor = [UIColor blackColor];
        self.undecimusresourcesContentView.backgroundColor = [UIColor whiteColor];
        
        self.jakeashacksButton.titleLabel.textColor = [UIColor blackColor];
        self.jakeashacksContentView.backgroundColor = [UIColor whiteColor];
        
        self.notcomButton.titleLabel.textColor = [UIColor blackColor];
        self.notcomContentView.backgroundColor = [UIColor whiteColor];
        
        self.cryptiiicButton.titleLabel.textColor = [UIColor blackColor];
        self.cryptiiicContentView.backgroundColor = [UIColor whiteColor];
        
        self.xerusdesignButton.titleLabel.textColor = [UIColor blackColor];
        self.xerusdesignContentView.backgroundColor = [UIColor whiteColor];
        
        self.appledry05Button.titleLabel.textColor = [UIColor blackColor];
        self.appledry05ContentView.backgroundColor = [UIColor whiteColor];
        
        self.ayyitzrobButton.titleLabel.textColor = [UIColor blackColor];
        self.ayyitzrobContentView.backgroundColor = [UIColor whiteColor];
        
        self.midnightchipButton.titleLabel.textColor = [UIColor blackColor];
        self.midnightchipContentView.backgroundColor = [UIColor whiteColor];
        
        self.swag_iosButton.titleLabel.textColor = [UIColor blackColor];
        self.swag_iosContentView.backgroundColor = [UIColor whiteColor];
        
        self.jailbreakbusterButton.titleLabel.textColor = [UIColor blackColor];
        self.jailbreakbusterContentView.backgroundColor = [UIColor whiteColor];
        
        self.benjweaverdevButton.titleLabel.textColor = [UIColor blackColor];
        self.benjweaverdevContentView.backgroundColor = [UIColor whiteColor];
    }
    else
    {
        
        self.pwn20wndButton.titleLabel.textColor = [UIColor whiteColor];
        self.pwn20wndContentView.backgroundColor = [UIColor blackColor];
        
        self.sbingnerButton.titleLabel.textColor = [UIColor whiteColor];
        self.sbingerContentView.backgroundColor = [UIColor blackColor];
        
        self.i41nbeerButton.titleLabel.textColor = [UIColor whiteColor];
        self.i41nbeerContentView.backgroundColor = [UIColor blackColor];
        
        self._bazadButton.titleLabel.textColor = [UIColor whiteColor];
        self._bazadContentView.backgroundColor = [UIColor blackColor];
        
        self.MorpheusButton.titleLabel.textColor = [UIColor whiteColor];
        self.MorpheusContentView.backgroundColor = [UIColor blackColor];
        
        self.xerubButton.titleLabel.textColor = [UIColor whiteColor];
        self.xerubContentView.backgroundColor = [UIColor blackColor];
        
        self.ibsparkesButton.titleLabel.textColor = [UIColor whiteColor];
        self.ibsparkesContentView.backgroundColor = [UIColor blackColor];
        
        self.stek29Button.titleLabel.textColor = [UIColor whiteColor];
        self.stek29ContentView.backgroundColor = [UIColor blackColor];
        
        self.theninjaprawnButton.titleLabel.textColor = [UIColor whiteColor];
        self.theninjaprawnContentView.backgroundColor = [UIColor blackColor];
        
        self.jonathansealsButton.titleLabel.textColor = [UIColor whiteColor];
        self.JonathansealsContentView.backgroundColor = [UIColor blackColor];
        
        self.saurikButton.titleLabel.textColor = [UIColor whiteColor];
        self.saurikContentView.backgroundColor = [UIColor blackColor];
        
        self.fce365Button.titleLabel.textColor = [UIColor whiteColor];
        self.fce365ContentView.backgroundColor = [UIColor blackColor];
        
        self.tihmstarButton.titleLabel.textColor = [UIColor whiteColor];
        self.tihmstarContentView.backgroundColor = [UIColor blackColor];
        
        self.s1guzaButton.titleLabel.textColor = [UIColor whiteColor];
        self.s1guzaContentView.backgroundColor = [UIColor blackColor];
        
        self.S0rryMyBadButton.titleLabel.textColor = [UIColor whiteColor];
        self.s0rrymybadContentView.backgroundColor = [UIColor blackColor];
        
        self.externalistButton.titleLabel.textColor = [UIColor whiteColor];
        self.externatlistContentView.backgroundColor = [UIColor blackColor];
        
        self.realbrighiupButton.titleLabel.textColor = [UIColor whiteColor];
        self.realbrighiuoContentView.backgroundColor = [UIColor blackColor];
        
        self.pwn20wndButton.titleLabel.textColor = [UIColor whiteColor];
        self.pwn20wndContentView.backgroundColor = [UIColor blackColor];
        
        self.nitotvButton.titleLabel.textColor = [UIColor whiteColor];
        self.nitotvContentView.backgroundColor = [UIColor blackColor];
        
        self._matchsticButton.titleLabel.textColor = [UIColor whiteColor];
        self.matchsticContentView.backgroundColor = [UIColor blackColor];
        
        self.umanghereButton.titleLabel.textColor = [UIColor whiteColor];
        self.umanghereContentView.backgroundColor = [UIColor blackColor];
        
        self.miscmistyButton.titleLabel.textColor = [UIColor whiteColor];
        self.miscmistyContentView.backgroundColor = [UIColor blackColor];
        
        self.pimskeksButton.titleLabel.textColor = [UIColor whiteColor];
        self.pimmskeksContentView.backgroundColor = [UIColor blackColor];
        
        self.coolstarorgButton.titleLabel.textColor = [UIColor whiteColor];
        self.coolstarorgContentView.backgroundColor = [UIColor blackColor];
        
        self.diatrusButton.titleLabel.textColor = [UIColor whiteColor];
        self.diatrusContentView.backgroundColor = [UIColor blackColor];
        
        self.HydriButton.titleLabel.textColor = [UIColor whiteColor];
        self.HydriContentView.backgroundColor = [UIColor blackColor];
        
        self.c9shadyButton.titleLabel.textColor = [UIColor whiteColor];
        self.c9shadyContentView.backgroundColor = [UIColor blackColor];
        
        self.pixelomerButton.titleLabel.textColor = [UIColor whiteColor];
        self.pixelomerContentView.backgroundColor = [UIColor blackColor];
        
        self.libimobiledeviceButton.titleLabel.textColor = [UIColor whiteColor];
        self.libimobiledeviceContentView.backgroundColor = [UIColor blackColor];
        
        self.undecimusresourcesButton.titleLabel.textColor = [UIColor whiteColor];
        self.undecimusresourcesContentView.backgroundColor = [UIColor blackColor];
        
        self.jakeashacksButton.titleLabel.textColor = [UIColor whiteColor];
        self.jakeashacksContentView.backgroundColor = [UIColor blackColor];
        
        self.notcomButton.titleLabel.textColor = [UIColor whiteColor];
        self.notcomContentView.backgroundColor = [UIColor blackColor];
        
        self.cryptiiicButton.titleLabel.textColor = [UIColor whiteColor];
        self.cryptiiicContentView.backgroundColor = [UIColor blackColor];
        
        self.xerusdesignButton.titleLabel.textColor = [UIColor whiteColor];
        self.xerusdesignContentView.backgroundColor = [UIColor blackColor];
        
        self.appledry05Button.titleLabel.textColor = [UIColor whiteColor];
        self.appledry05ContentView.backgroundColor = [UIColor blackColor];
        
        self.ayyitzrobButton.titleLabel.textColor = [UIColor whiteColor];
        self.ayyitzrobContentView.backgroundColor = [UIColor blackColor];
        
        self.midnightchipButton.titleLabel.textColor = [UIColor whiteColor];
        self.midnightchipContentView.backgroundColor = [UIColor blackColor];
        
        self.swag_iosButton.titleLabel.textColor = [UIColor whiteColor];
        self.swag_iosContentView.backgroundColor = [UIColor blackColor];
        
        self.jailbreakbusterButton.titleLabel.textColor = [UIColor whiteColor];
        self.jailbreakbusterContentView.backgroundColor = [UIColor blackColor];
        
        self.benjweaverdevButton.titleLabel.textColor = [UIColor whiteColor];
        self.benjweaverdevContentView.backgroundColor = [UIColor blackColor];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(10,10,200,200)];
    [myView setAlpha:1.0];
    [myView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    BOOL switchOn = [[NSUserDefaults standardUserDefaults] boolForKey:K_LIGHT_THEME];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (switchOn)
    {
        [myView setBackgroundColor:[UIColor clearColor]];
        [self.SpecialThanksTableView setBackgroundColor:[UIColor whiteColor]];
        
        [self.navigationController.view setTintColor:[UIColor whiteColor]];
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
        
//        self.pwn20wndButton.titleLabel.textColor = [UIColor blackColor];
//        self.pwn20wndContentView.backgroundColor = [UIColor whiteColor];
//
//        self.sbingnerButton.titleLabel.textColor = [UIColor blackColor];
//        self.sbingerContentView.backgroundColor = [UIColor whiteColor];
//
//        self.i41nbeerButton.titleLabel.textColor = [UIColor blackColor];
//        self.i41nbeerContentView.backgroundColor = [UIColor whiteColor];
//
//        self._bazadButton.titleLabel.textColor = [UIColor blackColor];
//        self._bazadContentView.backgroundColor = [UIColor whiteColor];
//
//        self.MorpheusButton.titleLabel.textColor = [UIColor blackColor];
//        self.MorpheusContentView.backgroundColor = [UIColor whiteColor];
//
//        self.xerubButton.titleLabel.textColor = [UIColor blackColor];
//        self.xerubContentView.backgroundColor = [UIColor whiteColor];
//
//        self.ibsparkesButton.titleLabel.textColor = [UIColor blackColor];
//        self.ibsparkesContentView.backgroundColor = [UIColor whiteColor];
//
//        self.stek29Button.titleLabel.textColor = [UIColor blackColor];
//        self.stek29ContentView.backgroundColor = [UIColor whiteColor];
//
//        self.theninjaprawnButton.titleLabel.textColor = [UIColor blackColor];
//        self.theninjaprawnContentView.backgroundColor = [UIColor whiteColor];
//
//        self.jonathansealsButton.titleLabel.textColor = [UIColor blackColor];
//        self.JonathansealsContentView.backgroundColor = [UIColor whiteColor];
//
//        self.saurikButton.titleLabel.textColor = [UIColor blackColor];
//        self.saurikContentView.backgroundColor = [UIColor whiteColor];
//
//        self.fce365Button.titleLabel.textColor = [UIColor blackColor];
//        self.fce365ContentView.backgroundColor = [UIColor whiteColor];
//
//        self.tihmstarButton.titleLabel.textColor = [UIColor blackColor];
//        self.tihmstarContentView.backgroundColor = [UIColor whiteColor];
//
//        self.s1guzaButton.titleLabel.textColor = [UIColor blackColor];
//        self.s1guzaContentView.backgroundColor = [UIColor whiteColor];
//
//        self.S0rryMyBadButton.titleLabel.textColor = [UIColor blackColor];
//        self.s0rrymybadContentView.backgroundColor = [UIColor whiteColor];
//
//        self.externalistButton.titleLabel.textColor = [UIColor blackColor];
//        self.externatlistContentView.backgroundColor = [UIColor whiteColor];
//
//        self.realbrighiupButton.titleLabel.textColor = [UIColor blackColor];
//        self.realbrighiuoContentView.backgroundColor = [UIColor whiteColor];
//
//        self.pwn20wndButton.titleLabel.textColor = [UIColor blackColor];
//        self.pwn20wndContentView.backgroundColor = [UIColor whiteColor];
//
//        self.nitotvButton.titleLabel.textColor = [UIColor blackColor];
//        self.nitotvContentView.backgroundColor = [UIColor whiteColor];
//
//        self._matchsticButton.titleLabel.textColor = [UIColor blackColor];
//        self.matchsticContentView.backgroundColor = [UIColor whiteColor];
//
//        self.umanghereButton.titleLabel.textColor = [UIColor blackColor];
//        self.umanghereContentView.backgroundColor = [UIColor whiteColor];
//
//        self.miscmistyButton.titleLabel.textColor = [UIColor blackColor];
//        self.miscmistyContentView.backgroundColor = [UIColor whiteColor];
//
//        self.pimskeksButton.titleLabel.textColor = [UIColor blackColor];
//        self.pimmskeksContentView.backgroundColor = [UIColor whiteColor];
//
//        self.coolstarorgButton.titleLabel.textColor = [UIColor blackColor];
//        self.coolstarorgContentView.backgroundColor = [UIColor whiteColor];
//
//        self.diatrusButton.titleLabel.textColor = [UIColor blackColor];
//        self.diatrusContentView.backgroundColor = [UIColor whiteColor];
//
//        self.HydriButton.titleLabel.textColor = [UIColor blackColor];
//        self.HydriContentView.backgroundColor = [UIColor whiteColor];
//
//        self.c9shadyButton.titleLabel.textColor = [UIColor blackColor];
//        self.c9shadyContentView.backgroundColor = [UIColor whiteColor];
//
//        self.pixelomerButton.titleLabel.textColor = [UIColor blackColor];
//        self.pixelomerContentView.backgroundColor = [UIColor whiteColor];
//
//        self.libimobiledeviceButton.titleLabel.textColor = [UIColor blackColor];
//        self.libimobiledeviceContentView.backgroundColor = [UIColor whiteColor];
//
//        self.undecimusresourcesButton.titleLabel.textColor = [UIColor blackColor];
//        self.undecimusresourcesContentView.backgroundColor = [UIColor whiteColor];
//
//        self.jakeashacksButton.titleLabel.textColor = [UIColor blackColor];
//        self.jakeashacksContentView.backgroundColor = [UIColor whiteColor];
//
//        self.notcomButton.titleLabel.textColor = [UIColor blackColor];
//        self.notcomContentView.backgroundColor = [UIColor whiteColor];
//
//        self.cryptiiicButton.titleLabel.textColor = [UIColor blackColor];
//        self.cryptiiicContentView.backgroundColor = [UIColor whiteColor];
//
//        self.xerusdesignButton.titleLabel.textColor = [UIColor blackColor];
//        self.xerusdesignContentView.backgroundColor = [UIColor whiteColor];
//
//        self.appledry05Button.titleLabel.textColor = [UIColor blackColor];
//        self.appledry05ContentView.backgroundColor = [UIColor whiteColor];
//
//        self.ayyitzrobButton.titleLabel.textColor = [UIColor blackColor];
//        self.ayyitzrobContentView.backgroundColor = [UIColor whiteColor];
//
//        self.midnightchipButton.titleLabel.textColor = [UIColor blackColor];
//        self.midnightchipContentView.backgroundColor = [UIColor whiteColor];
//
//        self.swag_iosButton.titleLabel.textColor = [UIColor blackColor];
//        self.swag_iosContentView.backgroundColor = [UIColor whiteColor];
//
//        self.jailbreakbusterButton.titleLabel.textColor = [UIColor blackColor];
//        self.jailbreakbusterContentView.backgroundColor = [UIColor whiteColor];
//
//        self.benjweaverdevButton.titleLabel.textColor = [UIColor blackColor];
//        self.benjweaverdevContentView.backgroundColor = [UIColor whiteColor];
    }
    else
    {
        [myView setBackgroundColor:[UIColor clearColor]];
        [self.SpecialThanksTableView setBackgroundColor:[UIColor blackColor]];
        
        [self.navigationController.view setTintColor:[UIColor blackColor]];
        self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
//        self.pwn20wndButton.titleLabel.textColor = [UIColor whiteColor];
//        self.pwn20wndContentView.backgroundColor = [UIColor blackColor];
//
//        self.sbingnerButton.titleLabel.textColor = [UIColor whiteColor];
//        self.sbingerContentView.backgroundColor = [UIColor blackColor];
//
//        self.i41nbeerButton.titleLabel.textColor = [UIColor whiteColor];
//        self.i41nbeerContentView.backgroundColor = [UIColor blackColor];
//
//        self._bazadButton.titleLabel.textColor = [UIColor whiteColor];
//        self._bazadContentView.backgroundColor = [UIColor blackColor];
//
//        self.MorpheusButton.titleLabel.textColor = [UIColor whiteColor];
//        self.MorpheusContentView.backgroundColor = [UIColor blackColor];
//
//        self.xerubButton.titleLabel.textColor = [UIColor whiteColor];
//        self.xerubContentView.backgroundColor = [UIColor blackColor];
//
//        self.ibsparkesButton.titleLabel.textColor = [UIColor whiteColor];
//        self.ibsparkesContentView.backgroundColor = [UIColor blackColor];
//
//        self.stek29Button.titleLabel.textColor = [UIColor whiteColor];
//        self.stek29ContentView.backgroundColor = [UIColor blackColor];
//
//        self.theninjaprawnButton.titleLabel.textColor = [UIColor whiteColor];
//        self.theninjaprawnContentView.backgroundColor = [UIColor blackColor];
//
//        self.jonathansealsButton.titleLabel.textColor = [UIColor whiteColor];
//        self.JonathansealsContentView.backgroundColor = [UIColor blackColor];
//
//        self.saurikButton.titleLabel.textColor = [UIColor whiteColor];
//        self.saurikContentView.backgroundColor = [UIColor blackColor];
//
//        self.fce365Button.titleLabel.textColor = [UIColor whiteColor];
//        self.fce365ContentView.backgroundColor = [UIColor blackColor];
//
//        self.tihmstarButton.titleLabel.textColor = [UIColor whiteColor];
//        self.tihmstarContentView.backgroundColor = [UIColor blackColor];
//
//        self.s1guzaButton.titleLabel.textColor = [UIColor whiteColor];
//        self.s1guzaContentView.backgroundColor = [UIColor blackColor];
//
//        self.S0rryMyBadButton.titleLabel.textColor = [UIColor whiteColor];
//        self.s0rrymybadContentView.backgroundColor = [UIColor blackColor];
//
//        self.externalistButton.titleLabel.textColor = [UIColor whiteColor];
//        self.externatlistContentView.backgroundColor = [UIColor blackColor];
//
//        self.realbrighiupButton.titleLabel.textColor = [UIColor whiteColor];
//        self.realbrighiuoContentView.backgroundColor = [UIColor blackColor];
//
//        self.pwn20wndButton.titleLabel.textColor = [UIColor whiteColor];
//        self.pwn20wndContentView.backgroundColor = [UIColor blackColor];
//
//        self.nitotvButton.titleLabel.textColor = [UIColor whiteColor];
//        self.nitotvContentView.backgroundColor = [UIColor blackColor];
//
//        self._matchsticButton.titleLabel.textColor = [UIColor whiteColor];
//        self.matchsticContentView.backgroundColor = [UIColor blackColor];
//
//        self.umanghereButton.titleLabel.textColor = [UIColor whiteColor];
//        self.umanghereContentView.backgroundColor = [UIColor blackColor];
//
//        self.miscmistyButton.titleLabel.textColor = [UIColor whiteColor];
//        self.miscmistyContentView.backgroundColor = [UIColor blackColor];
//
//        self.pimskeksButton.titleLabel.textColor = [UIColor whiteColor];
//        self.pimmskeksContentView.backgroundColor = [UIColor blackColor];
//
//        self.coolstarorgButton.titleLabel.textColor = [UIColor whiteColor];
//        self.coolstarorgContentView.backgroundColor = [UIColor blackColor];
//
//        self.diatrusButton.titleLabel.textColor = [UIColor whiteColor];
//        self.diatrusContentView.backgroundColor = [UIColor blackColor];
//
//        self.HydriButton.titleLabel.textColor = [UIColor whiteColor];
//        self.HydriContentView.backgroundColor = [UIColor blackColor];
//
//        self.c9shadyButton.titleLabel.textColor = [UIColor whiteColor];
//        self.c9shadyContentView.backgroundColor = [UIColor blackColor];
//
//        self.pixelomerButton.titleLabel.textColor = [UIColor whiteColor];
//        self.pixelomerContentView.backgroundColor = [UIColor blackColor];
//
//        self.libimobiledeviceButton.titleLabel.textColor = [UIColor whiteColor];
//        self.libimobiledeviceContentView.backgroundColor = [UIColor blackColor];
//
//        self.undecimusresourcesButton.titleLabel.textColor = [UIColor whiteColor];
//        self.undecimusresourcesContentView.backgroundColor = [UIColor blackColor];
//
//        self.jakeashacksButton.titleLabel.textColor = [UIColor whiteColor];
//        self.jakeashacksContentView.backgroundColor = [UIColor blackColor];
//
//        self.notcomButton.titleLabel.textColor = [UIColor whiteColor];
//        self.notcomContentView.backgroundColor = [UIColor blackColor];
//
//        self.cryptiiicButton.titleLabel.textColor = [UIColor whiteColor];
//        self.cryptiiicContentView.backgroundColor = [UIColor blackColor];
//
//        self.xerusdesignButton.titleLabel.textColor = [UIColor whiteColor];
//        self.xerusdesignContentView.backgroundColor = [UIColor blackColor];
//
//        self.appledry05Button.titleLabel.textColor = [UIColor whiteColor];
//        self.appledry05ContentView.backgroundColor = [UIColor blackColor];
//
//        self.ayyitzrobButton.titleLabel.textColor = [UIColor whiteColor];
//        self.ayyitzrobContentView.backgroundColor = [UIColor blackColor];
//
//        self.midnightchipButton.titleLabel.textColor = [UIColor whiteColor];
//        self.midnightchipContentView.backgroundColor = [UIColor blackColor];
//
//        self.swag_iosButton.titleLabel.textColor = [UIColor whiteColor];
//        self.swag_iosContentView.backgroundColor = [UIColor blackColor];
//
//        self.jailbreakbusterButton.titleLabel.textColor = [UIColor whiteColor];
//        self.jailbreakbusterContentView.backgroundColor = [UIColor blackColor];
//
//        self.benjweaverdevButton.titleLabel.textColor = [UIColor whiteColor];
//        self.benjweaverdevContentView.backgroundColor = [UIColor blackColor];
    }
    [self.tableView setBackgroundView:myView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (NSURL *)getURLForUserName:(NSString *)userName {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot://"]]) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"tweetbot:///user_profile/%@", userName]];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific://"]]) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"twitterrific:///profile?screen_name=%@", userName]];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings://"]]) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"tweetings:///user?screen_name=%@", userName]];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]]) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"https://mobile.twitter.com/%@", userName]];
    } else {
        return [NSURL URLWithString:[NSString stringWithFormat:@"https://mobile.twitter.com/%@", userName]];
    }
}

-(IBAction)tappedOnIanBeer:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"i41nbeer"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnPwn:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"pwn20wnd"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnBingner:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"sbingner"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnBazad:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"_bazad"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnMorpheus:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"Morpheus______"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnXerub:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"xerub"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnPsychoTea:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"ibsparkes"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnStek:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"stek29"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnNinjaPrawn:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"theninjaprawn"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnCryptic:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"Cryptiiiic"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnXerusDesign:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"xerusdesign"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnAppleDry:(id)sender{
   [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"AppleDry05"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnRob:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"AyyItzRob"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnMidnightChip:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"MidnightChip"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnGeoSn0w:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"FCE365"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnSwaggo:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"Swag_iOS"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnJailbreakbuster:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"jailbreakbuster"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnJakeashacks:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"Jakeashacks"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnJonathanSeals:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"JonathanSeals"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnSaurik:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"saurik"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnUndecimusResources:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/pwn20wndstuff/Undecimus-Resources"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnTihmstar:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"tihmstar"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnSiguza:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"s1guza"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnS0rryMyBad:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"S0rryMyBad"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnExternalist:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"Externalist"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnRealBrightiup:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"realBrightiup"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnNitoTV:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"nitoTV"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnMatchstic:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"_Matchstic"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnUmanghere:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"umanghere"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnMiscMisty:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"MiscMisty"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnSemaphore:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"notcom"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnPimskeks:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"pimskeks"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnLibimobiledevice:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/libimobiledevice"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnCoolStar:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"coolstarorg"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnBen:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"benjweaverdev"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnDiatrus:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"Pinseeker75"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnHydri:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"HydriDev_"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnShady:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"versusess"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnPixel:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"pixelomer"] options:@{} completionHandler:nil];
}

@end
