//
//  ViewController.h
//  YandexTranslator
//
//  Created by Admin on 3/28/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "Language.h"
#import "ApiHelper.h"
#import <UIKit/UIKit.h>
#import "TranslateView.h"
#import "OutputLanguageView.h"
#import "InputLanguageView.h"

@interface TranslateViewController : UIViewController<UITextViewDelegate, SelectOutputLanguageDelegate, SelectInputLanguageDelegate>

@property (nonatomic, strong) TranslateView *translateView;
@property (nonatomic, strong) InputLanguageView *inputLanguageView;
@property (nonatomic, strong) OutputLanguageView *outputLanguageView;
@property (nonatomic, strong) Language *outputLanguage;
@property (nonatomic, strong) Language *inputLanguage;
@property (nonatomic, strong) Language *detectedLanguage;

@end

