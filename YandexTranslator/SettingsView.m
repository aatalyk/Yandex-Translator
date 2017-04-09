//
//  SettingsView.m
//  Yandex
//
//  Created by Admin on 4/1/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "SettingsView.h"
#import "UIFont+CustomFont.h"
#import "UIView+CustomView.h"
#import "UIColor+CustomColor.h"

@implementation SettingsView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setup];
    }
    
    return self;
}

-(void)setup {
    
    self.dictionary = @{@"FONT SIZE" : @[@"Small", @"Regular", @"Big"],
                        @"ABOUT DEVELOPER" : @[@"Atalyk Akash"]};
    self.sectionTitleArray = [self.dictionary allKeys];
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.backgroundColor = [UIColor lightGrayBackgroundColor];
    [self addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SettingsCell"];
    
    [self addConstraintsWithFormat:@"H:|[v0]|" views:self.tableView, nil];
    [self addConstraintsWithFormat:@"V:|[v0]|" views:self.tableView, nil];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.sectionTitleArray objectAtIndex:section];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *sectionTitle = [self.sectionTitleArray objectAtIndex:section];
    NSArray *sectionObjects = [self.dictionary objectForKey:sectionTitle];
    return sectionObjects.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingsCell" forIndexPath:indexPath];
    NSString *sectionTitle = [self.sectionTitleArray objectAtIndex:indexPath.section];
    NSArray *sectionObjects = [self.dictionary objectForKey:sectionTitle];
    cell.textLabel.text = [sectionObjects objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = [UIColor lightGrayBackgroundColor];
    
    UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView*)view;
    headerView.textLabel.font = [[UIFont mainFont]fontWithSize:15];
    headerView.textLabel.textColor = [UIColor darkGrayTextColor];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:(20+5*indexPath.row) forKey:@"fontSize"];
    [userDefaults synchronize];
}

@end
