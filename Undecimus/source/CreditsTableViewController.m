//
//  CreditsTableViewController.m
//  Undecimus
//
//  Created by Pwn20wnd on 9/14/18.
//  Copyright © 2018 - 2019 Pwn20wnd. All rights reserved.
//

#import "CreditsTableViewController.h"
#include "SettingsTableViewController.h"

@interface CreditsTableViewController ()

@end

@implementation CreditsTableViewController

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

-(void)viewDidLayoutSubviews {
    
    NSString *theme = [[NSUserDefaults standardUserDefaults] objectForKey:K_THEME];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if ([theme isEqualToString:@"White"])
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
    if([theme isEqualToString:@"True Black"])
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
    if([theme isEqualToString:@"Dark Purple"])
    {
        
        self.pwn20wndButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.pwn20wndContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.sbingnerButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.sbingerContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.i41nbeerButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.i41nbeerContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self._bazadButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self._bazadContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.MorpheusButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.MorpheusContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.xerubButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.xerubContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.ibsparkesButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.ibsparkesContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.stek29Button.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.stek29ContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.theninjaprawnButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.theninjaprawnContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.jonathansealsButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.JonathansealsContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.saurikButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.saurikContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.fce365Button.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.fce365ContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.tihmstarButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.tihmstarContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.s1guzaButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.s1guzaContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.S0rryMyBadButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.s0rrymybadContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.externalistButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.externatlistContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.realbrighiupButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.realbrighiuoContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.pwn20wndButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.pwn20wndContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.nitotvButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.nitotvContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self._matchsticButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.matchsticContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.umanghereButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.umanghereContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.miscmistyButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.miscmistyContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.pimskeksButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.pimmskeksContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.coolstarorgButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.coolstarorgContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.diatrusButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.diatrusContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.HydriButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.HydriContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.c9shadyButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.c9shadyContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.pixelomerButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.pixelomerContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.libimobiledeviceButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.libimobiledeviceContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.undecimusresourcesButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.undecimusresourcesContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.jakeashacksButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.jakeashacksContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.notcomButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.notcomContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.cryptiiicButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.cryptiiicContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.xerusdesignButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.xerusdesignContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.appledry05Button.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.appledry05ContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.ayyitzrobButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.ayyitzrobContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.midnightchipButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.midnightchipContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.swag_iosButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.swag_iosContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.jailbreakbusterButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.jailbreakbusterContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
        self.benjweaverdevButton.titleLabel.textColor = UIColorFromRGB(0xE9E9EA);
        self.benjweaverdevContentView.backgroundColor = UIColorFromRGB(0x17151C);
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(10,10,200,200)];
    [myView setAlpha:1.0];
    [myView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    NSString *theme = [[NSUserDefaults standardUserDefaults] objectForKey:K_THEME];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if ([theme isEqualToString:@"True Black"])
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
    if ([theme isEqualToString:@"Dark Purple"])
    {
        [myView setBackgroundColor:[UIColor clearColor]];
        [self.SpecialThanksTableView setBackgroundColor:UIColorFromRGB(0x17151C)];
        
        [self.navigationController.view setTintColor:UIColorFromRGB(0x17151C)];
        self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x17151C);
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.tintColor = UIColorFromRGB(0xE9E9EA);
    }
    if ([theme isEqualToString:@"White"])
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
