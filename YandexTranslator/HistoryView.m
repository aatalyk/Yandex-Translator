//
//  SavedTextsView.m
//  Yandex
//
//  Created by Admin on 3/31/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "HistoryView.h"
#import "CoreDataHelper.h"
#import "UIView+CustomView.h"

@implementation HistoryView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setup];
    }
    
    return self;
}

-(void)setup {
    
    self.historyArray = [[NSMutableArray alloc]init];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.tableView];
    
    [self addConstraintsWithFormat:@"H:|[v0]|" views:self.tableView, nil];
    [self addConstraintsWithFormat:@"V:|[v0]|" views:self.tableView, nil];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HistoryCell"];
    
    [self fetchSavedHistory];
}

-(void)fetchSavedHistory {
    
    [CoreDataHelper fetchSavedHistory:^(NSArray *array) {
        self.historyArray = [NSMutableArray arrayWithArray:array];
    }];
    
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.historyArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryCell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.historyArray objectAtIndex:indexPath.row]valueForKey:@"originalHistoryText"];
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(NSArray<UITableViewRowAction*>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        [CoreDataHelper deleteHistory:[[self.historyArray objectAtIndex:indexPath.row]valueForKey:@"originalHistoryText"] translatedText:[[self.historyArray objectAtIndex:indexPath.row]valueForKey:@"translatedHistoryText"]];
        [self.historyArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    delete.backgroundColor = [UIColor redColor];
    return @[delete];
}

@end
