//
//  SupportedLanguagesView.h
//  YandexTranslator
//
//  Created by Admin on 3/29/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "Language.h"
#import <UIKit/UIKit.h>

@protocol SelectOutputLanguageDelegate <NSObject>
-(void)returnSelectedOutputLanguage:(Language*)language;
@end

@interface OutputLanguageView : UIView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSDictionary *languages;

@property (nonatomic, weak) id <SelectOutputLanguageDelegate> outputLanguageDelegate;

@end
