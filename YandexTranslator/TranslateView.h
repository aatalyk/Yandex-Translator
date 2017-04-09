//
//  TranslateView.h
//  YandexTranslator
//
//  Created by Admin on 3/28/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryView.h"

@interface TranslateView : UIView

@property (nonatomic, strong) UIView *languageLineView;
@property (nonatomic, strong) UIView *separatorView;
@property (nonatomic, strong) UILabel *inputLabel;
@property (nonatomic, strong) UITextView *inputTextView;
@property (nonatomic, strong) UILabel *outputLabel;
@property (nonatomic, strong) UITextView *outputTextView;
@property (nonatomic, strong) UIButton *starButton;
@property (nonatomic, strong) UIButton *inputLanguageButton;
@property (nonatomic, strong) UIButton *swapButton;
@property (nonatomic, strong) UIButton *outputLanguageButton;
@property (nonatomic, strong) HistoryView *historyView;

@end
