//
//  TranslateView.m
//  YandexTranslator
//
//  Created by Admin on 3/28/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "TranslateView.h"
#import "UIView+CustomView.h"
#import "UIFont+CustomFont.h"
#import "UIColor+CustomColor.h"

@implementation TranslateView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setup];
    }
    
    return self;
}

#pragma mark - Setup Views
-(void)setup {
    
    CGSize screenBounds = [UIScreen mainScreen].bounds.size;

    self.backgroundColor = [UIColor lightGrayBackgroundColor];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:(25) forKey:@"fontSize"];
    [userDefaults synchronize];
    
    self.languageLineView = [[UIView alloc] init];
    self.languageLineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.languageLineView];
        
    self.inputTextView = [[UITextView alloc] init];
    self.inputTextView.backgroundColor = [UIColor whiteColor];
    self.inputTextView.font = [UIFont mainFont];
    self.inputTextView.contentInset = UIEdgeInsetsMake(30, 10, 0, 10);
    self.inputTextView.text = @"Tap to text";
    self.inputTextView.textColor = [UIColor lightGrayColor];
    [self addSubview:self.inputTextView];
    
    self.inputLabel = [[UILabel alloc]init];
    self.inputLabel.font = [[UIFont mainFont]fontWithSize:16];
    self.inputLabel.text = @"ENGLISH";
    [self addSubview:self.inputLabel];
    
    self.separatorView = [[UIView alloc]init];
    self.separatorView.backgroundColor = [UIColor lightGrayBackgroundColor];
    [self addSubview:self.separatorView];
    
    self.outputTextView = [[UITextView alloc] init];
    self.outputTextView.backgroundColor = [UIColor mainBlueColor];
    self.outputTextView.font = [UIFont mainFont];
    self.outputTextView.contentInset = UIEdgeInsetsMake(40, 5, 0, 10);
    [self.outputTextView setEditable:NO];
    self.outputTextView.textColor = [UIColor whiteColor];
    self.outputTextView.layer.cornerRadius = 3;
    [self addSubview:self.outputTextView];
    
    self.outputLabel = [[UILabel alloc]init];
    self.outputLabel.font = [[UIFont mainFont]fontWithSize:16];
    self.outputLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.outputLabel];
    
    self.starButton = [[UIButton alloc]init];
    [self.starButton setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
     self.swapButton.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.starButton];
    
    self.inputLanguageButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, screenBounds.width*0.4, screenBounds.height/14)];
    [self.inputLanguageButton setTitle:@"English ▾" forState:UIControlStateNormal];
    [self.inputLanguageButton setTitleColor:[UIColor mainBlueColor] forState:UIControlStateNormal];
    self.inputLanguageButton.titleLabel.font = [[UIFont mainFont] fontWithSize:20];
    self.inputLanguageButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.inputLanguageButton];
    
    self.swapButton = [[UIButton alloc]initWithFrame:CGRectMake(screenBounds.width*0.4, 0, screenBounds.width*0.2, screenBounds.height/14)];
    [self.swapButton setImage:[UIImage imageNamed:@"swap"] forState:UIControlStateNormal];
    self.swapButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.swapButton];
    
    self.outputLanguageButton = [[UIButton alloc]initWithFrame:CGRectMake(screenBounds.width*0.6, 0, screenBounds.width*0.4, screenBounds.height/14)];
    [self.outputLanguageButton setTitle:@"Russian ▾" forState:UIControlStateNormal];
    [self.outputLanguageButton setTitleColor:[UIColor mainBlueColor] forState:UIControlStateNormal];
    self.outputLanguageButton.titleLabel.font = [[UIFont mainFont] fontWithSize:20];
    self.outputLanguageButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.outputLanguageButton];
    
    self.historyView = [[HistoryView alloc]init];
    [self addSubview:self.historyView];
    
    //Horizontal Constraints
    [self addConstraintsWithFormat:@"H:|[v0]|" views:self.languageLineView, nil];
    [self addConstraintsWithFormat:@"H:|[v0]|" views:self.inputTextView, nil];
    [self addConstraintsWithFormat:@"H:|-10-[v0]-10-|" views:self.outputTextView, nil];
    [self addConstraintsWithFormat:@"H:[v0(40)]-20-|" views:self.starButton, nil];
    [self addConstraintsWithFormat:@"H:|-15-[v0]|" views:self.inputLabel, nil];
    [self addConstraintsWithFormat:@"H:|-20-[v0]|" views:self.outputLabel, nil];
    [self addConstraintsWithFormat:@"H:|[v0]|" views:self.separatorView, nil];
    [self addConstraintsWithFormat:@"H:|-10-[v0]-10-|" views:self.historyView, nil];
    
    //Vertical Constraints
    [self addConstraintsWithFormat:[NSString stringWithFormat:@"V:|[v0(%f)]-0-[v1(%f)]-15-[v2(%f)]-10-[v3]-5-|", screenBounds.height/14, screenBounds.height/4, screenBounds.height/4] views:self.languageLineView, self.inputTextView, self.outputTextView, self.historyView, nil];
    [self addConstraintsWithFormat:[NSString stringWithFormat:@"V:|-%f-[v0(%f)]", screenBounds.height/2.8, 40.0] views:self.starButton, nil];
    [self addConstraintsWithFormat:[NSString stringWithFormat:@"V:|-%f-[v0(%f)]", screenBounds.height/2.7, 20.0] views:self.outputLabel, nil];
    [self addConstraintsWithFormat:[NSString stringWithFormat:@"V:|-%f-[v0(%f)]", screenBounds.height/10, 20.0] views:self.inputLabel, nil];
    [self addConstraintsWithFormat:[NSString stringWithFormat:@"V:|-%f-[v0(%f)]", screenBounds.height/14, 1.0f] views:self.separatorView, nil];
}

@end
