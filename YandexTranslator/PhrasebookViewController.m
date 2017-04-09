//
//  SavedTextsViewController.m
//  Yandex
//
//  Created by Admin on 3/31/17.
//  Copyright © 2017 AAkash. All rights reserved.
//
#import "CoreDataHelper.h"
#import "UIFont+CustomFont.h"
#import "UIView+CustomView.h"
#import "PhrasebookViewController.h"

@interface PhrasebookViewController ()

@end

@implementation PhrasebookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.phrasebookView fetchSavedTranslations];
}

-(void)setup {
    
    self.navigationItem.title = @"Phrasebook";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName : [[UIFont mainFont]fontWithSize:18]}];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UIBarButtonItem *dropButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"delete"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(dropAllData)];
    [self.navigationItem setRightBarButtonItem:dropButtonItem];
    
    self.phrasebookView = [[PhrasebookView alloc]init];
    [self.view addSubview:self.phrasebookView];
    
    [self.view addConstraintsWithFormat:@"H:|[v0]|" views:self.phrasebookView, nil];
    [self.view addConstraintsWithFormat:@"V:|[v0]|" views:self.phrasebookView, nil];
}

-(void)dropAllData {
    [CoreDataHelper dropAllData];
    [self.phrasebookView fetchSavedTranslations];
}

@end
