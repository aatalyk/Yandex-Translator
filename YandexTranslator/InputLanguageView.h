//
//  InputLanguageView.h
//  Yandex
//
//  Created by Admin on 3/31/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "Language.h"
#import <UIKit/UIKit.h>

@protocol SelectInputLanguageDelegate <NSObject>
-(void)returnSelectedInputLanguage:(Language*)language;
@end

@interface InputLanguageView : UIView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, weak) id <SelectInputLanguageDelegate> inputLanguageDelegate;

@end
