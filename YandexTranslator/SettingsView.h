//
//  SettingsView.h
//  Yandex
//
//  Created by Admin on 4/1/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsView : UIView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, strong) NSArray *sectionTitleArray;

@end
