//
//  CreditsTableViewController.m
//  Undecimus
//
//  Created by Pwn20wnd on 9/14/18.
//  Copyright © 2018 - 2019 Pwn20wnd. All rights reserved.
//

#import "CreditsTableViewController.h"
#include "SettingsTableViewController.h"
#include "prefs.h"

@interface CreditsTableViewController ()

@end

@implementation CreditsTableViewController

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

-(void)viewDidLayoutSubviews {
    prefs_t *prefs = copy_prefs();
    
    self.pwn20wndButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.pwn20wndContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.sbingnerButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.sbingerContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.i41nbeerButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.i41nbeerContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self._bazadButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self._bazadContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.MorpheusButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.MorpheusContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.xerubButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.xerubContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.ibsparkesButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.ibsparkesContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.stek29Button.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.stek29ContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.theninjaprawnButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.theninjaprawnContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.jonathansealsButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.JonathansealsContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.saurikButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.saurikContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.fce365Button.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.fce365ContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.tihmstarButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.tihmstarContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.s1guzaButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.s1guzaContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.S0rryMyBadButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.s0rrymybadContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.externalistButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.externatlistContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.realbrighiupButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.realbrighiuoContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.pwn20wndButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.pwn20wndContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.nitotvButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.nitotvContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self._matchsticButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.matchsticContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.umanghereButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.umanghereContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.miscmistyButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.miscmistyContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.pimskeksButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.pimmskeksContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.coolstarorgButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.coolstarorgContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.diatrusButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.diatrusContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.HydriButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.HydriContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.c9shadyButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.c9shadyContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.pixelomerButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.pixelomerContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.AaronButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.AaronContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.CarsukiButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.CarsukiContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.libimobiledeviceButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.libimobiledeviceContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.undecimusresourcesButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.undecimusresourcesContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.jakeashacksButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.jakeashacksContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.notcomButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.notcomContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.cryptiiicButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.cryptiiicContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.xerusdesignButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.xerusdesignContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.appledry05Button.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.appledry05ContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.ayyitzrobButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.ayyitzrobContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.midnightchipButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.midnightchipContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.swag_iosButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.swag_iosContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.jailbreakbusterButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.jailbreakbusterContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.benjweaverdevButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.benjweaverdevContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.SamgButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.SamgContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.DennisButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.DennisContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.iOSAppDevButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.iOSAppDevContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.UbikButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.UbikContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    self.PatrickButton.titleLabel.textColor = UIColorFromRGB(prefs->textColor);
    self.PatrickContentView.backgroundColor = UIColorFromRGB(prefs->backgroundColor);
    
    release_prefs(&prefs);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(10,10,200,200)];
    [myView setAlpha:1.0];
    [myView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    prefs_t *prefs = copy_prefs();

    [myView setBackgroundColor:[UIColor clearColor]];
    [self.SpecialThanksTableView setBackgroundColor:UIColorFromRGB(prefs->backgroundColor)];
    
    [self.navigationController.view setTintColor:UIColorFromRGB(prefs->backgroundColor)];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(prefs->backgroundColor);
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = UIColorFromRGB(prefs->textColor);

    [self.tableView setBackgroundView:myView];
    release_prefs(&prefs);
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

-(IBAction)tappedOnAaron:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"23Aaron_"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnCarsuki:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"carsuki_"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnPatrick:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"patriccsimpson"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnDennis:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"DennisBednarz"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOniOSAppDev:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"iOS_App_Dev"] options:@{} completionHandler:nil];
}

-(IBAction)tappedOnUbik:(id)sender{
    [[UIApplication sharedApplication] openURL:[CreditsTableViewController getURLForUserName:@"HiMyNameIsUbik"] options:@{} completionHandler:nil];
}

@end
