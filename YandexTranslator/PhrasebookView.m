//
//  SavedTextsView.m
//  Yandex
//
//  Created by Admin on 3/31/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "PhrasebookView.h"
#import "CoreDataHelper.h"
#import "UIView+CustomView.h"
#import "PhraseTableViewCell.h"

@implementation PhrasebookView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setup];
    }
    
    return self;
}

-(void)setup {
    
    CGSize screenBounds = [UIScreen mainScreen].bounds.size;
    
    self.phraseArray = [[NSMutableArray alloc]init];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.rowHeight = screenBounds.height/10;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.tableView];
    
    [self addConstraintsWithFormat:@"H:|[v0]|" views:self.tableView, nil];
    [self addConstraintsWithFormat:@"V:|[v0]|" views:self.tableView, nil];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[PhraseTableViewCell class] forCellReuseIdentifier:@"SavedTextCell"];
    
    [self fetchSavedTranslations];
}

-(void)fetchSavedTranslations {
    
    [CoreDataHelper fetchSavedTranslations:^(NSArray *array) {
        self.phraseArray = [NSMutableArray arrayWithArray:array];
    }];
    
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.phraseArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PhraseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SavedTextCell" forIndexPath:indexPath];
    cell.originalTextLabel.text = [[self.phraseArray objectAtIndex:indexPath.row]valueForKey:@"originalText"];
    cell.translatedTextLabel.text = [[self.phraseArray objectAtIndex:indexPath.row]valueForKey:@"translatedText"];
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(NSArray<UITableViewRowAction*>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        [CoreDataHelper deleteTranslation:[[self.phraseArray objectAtIndex:indexPath.row]valueForKey:@"originalText"] translatedText:[[self.phraseArray objectAtIndex:indexPath.row]valueForKey:@"translatedText"]];
        [self.phraseArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    delete.backgroundColor = [UIColor redColor];
    return @[delete];
}

@end
