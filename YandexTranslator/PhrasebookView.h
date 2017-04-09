//
//  SavedTextsView.h
//  Yandex
//
//  Created by Admin on 3/31/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhrasebookView : UIView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *phraseArray;

-(void)fetchSavedTranslations;

@end
