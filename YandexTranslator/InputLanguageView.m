//
//  SupportedLanguagesView.m
//  YandexTranslator
//
//  Created by Admin on 3/29/17.
//  Copyright © 2017 AAkash. All rights reserved.
//


#import "Language.h"
#import "ApiHelper.h"
#import "AppDelegate.h"
#import "YandexTranslator.h"
#import "InputLanguageView.h"
#import "UIView+CustomView.h"
#import "UIColor+CustomColor.h"

@interface InputLanguageView()

@property (nonatomic, strong) NSMutableArray *supportedLanguages;

@end

@implementation InputLanguageView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setup];
        self.supportedLanguages = [[NSMutableArray alloc]init];
    }
    
    return self;
}

-(void)setup {
    
    self.tableView = [[UITableView alloc] init];
    [self addSubview:self.tableView];
    
    [self addConstraintsWithFormat:@"H:|[v0]|" views:self.tableView, nil];
    [self addConstraintsWithFormat:@"V:|[v0]|" views:self.tableView, nil];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self getSupportedLanguages];
}

-(void)getSupportedLanguages {
    
    YandexTranslator *yandexTranslator = [[YandexTranslator alloc] init];
    NSString *urlString = [yandexTranslator generateUrlStringForSupportedLanguages];
    [ApiHelper getListOfSupportedLanguages:urlString closure:^(NSDictionary *dictionary) {
        
        NSArray *keys = [dictionary allKeys];
        keys = [keys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
        for(int i = 0; i<keys.count; i++) {
            [self.supportedLanguages addObject:[[Language alloc]initWithShorLanguage:keys[i] longLanguage:dictionary[keys[i]]]];
        }
        
        [self.tableView reloadData];
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.inputLanguageDelegate returnSelectedInputLanguage:[self.supportedLanguages objectAtIndex:indexPath.row]];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.supportedLanguages.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.supportedLanguages objectAtIndex:indexPath.row] longLanguage];
    cell.backgroundColor = [UIColor lightGrayBackgroundColor];
    return cell;
}

@end
