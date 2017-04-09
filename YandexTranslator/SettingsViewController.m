//
//  SettingsViewController.m
//  Yandex
//
//  Created by Admin on 4/1/17.
//  Copyright © 2017 AAkash. All rights reserved.
//
#import "UIView+CustomView.h"
#import "UIFont+CustomFont.h"
#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

-(void)setup {
    
    self.navigationItem.title = @"Settings";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName : [[UIFont mainFont]fontWithSize:18]}];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.tabBarController.tabBar setTranslucent:NO];
    
    self.settingsView = [[SettingsView alloc]init];
    [self.view addSubview:self.settingsView];
    
    [self.view addConstraintsWithFormat:@"H:|[v0]|" views:self.settingsView, nil];
    [self.view addConstraintsWithFormat:@"V:|[v0]|" views:self.settingsView, nil];
}

@end
