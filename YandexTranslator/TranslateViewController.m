//
//  ViewController.m
//  YandexTranslator
//
//  Created by Admin on 3/28/17.
//  Copyright © 2017 AAkash & FYessimkulova. All rights reserved.
//
#import "ApiHelper.h"
#import "AppDelegate.h"
#import "TranslateView.h"
#import "CoreDataHelper.h"
#import "YandexTranslator.h"
#import <CoreData/CoreData.h>
#import "UIFont+CustomFont.h"
#import "UIView+CustomView.h"
#import "TranslateViewController.h"

@interface TranslateViewController()

@property CGSize screenBounds;

@end

@implementation TranslateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

-(void)viewDidAppear:(BOOL)animated {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    float fontSize = [userDefaults floatForKey:@"fontSize"];
    self.translateView.inputTextView.font = [[UIFont mainFont]fontWithSize:fontSize];
    
    [self checkCoreDataForText];
    [self.translateView.historyView fetchSavedHistory];
}

#pragma mark - Setup Views
-(void)setup {
    
    self.screenBounds = [UIScreen mainScreen].bounds.size;
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    
    UISwipeGestureRecognizer *downRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [downRecognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [self.view addGestureRecognizer:downRecognizer];
    
    self.inputLanguage = [[Language alloc]initWithShorLanguage:@"en" longLanguage:@"English"];
    self.outputLanguage = [[Language alloc]initWithShorLanguage:@"ru" longLanguage:@"Russian"];
    
    self.navigationItem.title = @"Yandex";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName : [[UIFont mainFont]fontWithSize:18]}];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.tabBarController.tabBar setTranslucent:NO];

    self.translateView = [[TranslateView alloc] init];
    [self.translateView.inputTextView setDelegate:self];
    [self.translateView.outputLanguageButton addTarget:self action:@selector(showOutputLanguages) forControlEvents:UIControlEventTouchUpInside];
    [self.translateView.inputLanguageButton addTarget:self action:@selector(showInputLanguages) forControlEvents:UIControlEventTouchUpInside];
    [self.translateView.starButton addTarget:self action:@selector(saveTranslation) forControlEvents:UIControlEventTouchUpInside];
    [self.translateView.swapButton addTarget:self action:@selector(swapLanguages) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.translateView];
    
    self.inputLanguageView = [[InputLanguageView alloc] initWithFrame:CGRectMake(-self.screenBounds.width/2, self.screenBounds.height/14, self.screenBounds.width/2, self.screenBounds.height*11/14)];
    self.inputLanguageView.inputLanguageDelegate = self;
    [self.view addSubview:self.inputLanguageView];
    
    self.outputLanguageView = [[OutputLanguageView alloc] initWithFrame:CGRectMake(self.screenBounds.width, self.screenBounds.height/14, self.screenBounds.width/2, self.screenBounds.height*11/14)];
    self.outputLanguageView.outputLanguageDelegate = self;
    [self.view addSubview:self.outputLanguageView];
    
    [self.view addConstraintsWithFormat:@"H:|[v0]|" views:self.translateView, nil];
    [self.view addConstraintsWithFormat:@"V:|[v0]|" views:self.translateView, nil];
}

-(void)translateText {
    
    [self detectLanguage];
    
    YandexTranslator *yandexTranslator = [[YandexTranslator alloc] init];
    yandexTranslator.lang = [NSString stringWithFormat:@"%@-%@", self.detectedLanguage.shortLanguage, self.outputLanguage.shortLanguage];
    yandexTranslator.text = self.translateView.inputTextView.text;
    
    NSString *apiString = [yandexTranslator generateUrlStringForTranslation];

    [ApiHelper translateTextUsingApi:apiString closure:^(NSString *string) {
        self.translateView.outputTextView.text = string;
    }];
}

-(void)detectLanguage {
    
    YandexTranslator *yandexTranslator = [[YandexTranslator alloc] init];
    yandexTranslator.text = self.translateView.inputTextView.text;
    
    NSString *apiString = [yandexTranslator generateUrlStringForLanguageDetection];
    
    [ApiHelper detectLanguage:apiString closure:^(NSString *language) {
        self.detectedLanguage = [[Language alloc]initWithShorLanguage:language longLanguage:self.outputLanguageView.languages[language]];
    }];
    self.translateView.inputLabel.text = [self.detectedLanguage.longLanguage uppercaseString];
    self.translateView.outputLabel.text = [self.outputLanguage.longLanguage uppercaseString];
}

-(void)saveTranslation {
    
     if([CoreDataHelper isObjectExist:self.translateView.inputTextView.text translatedText:self.translateView.outputTextView.text]) {
         [CoreDataHelper deleteTranslation:self.translateView.inputTextView.text translatedText:self.translateView.outputTextView.text];
         [self.translateView.starButton setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
     } else {
         [CoreDataHelper saveTranslation:self.translateView.inputTextView.text translatedText:self.translateView.outputTextView.text];
         [self.translateView.starButton setImage:[UIImage imageNamed:@"starred"] forState:UIControlStateNormal];
     }
}

-(void)saveHistory {
    [CoreDataHelper saveHistory:self.translateView.inputTextView.text translatedText:self.translateView.outputTextView.text];
}

-(void)checkCoreDataForText {
    if([CoreDataHelper isObjectExist:self.translateView.inputTextView.text translatedText:self.translateView.outputTextView.text]) {
        [self.translateView.starButton setImage:[UIImage imageNamed:@"starred"] forState:UIControlStateNormal];
    } else {
        [self.translateView.starButton setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
    }
}

-(void)swapLanguages {
    
    [self.translateView.inputLanguageButton setTitle:[NSString stringWithFormat:@"%@ ▾", self.outputLanguage.longLanguage] forState:UIControlStateNormal];
    [self.translateView.outputLanguageButton setTitle:[NSString stringWithFormat:@"%@ ▾", self.inputLanguage.longLanguage] forState:UIControlStateNormal];
    
    Language *temp = self.inputLanguage;
    self.inputLanguage = self.outputLanguage;
    self.outputLanguage = temp;
    
    CGRect initialInputLanguageFrame = self.translateView.inputLanguageButton.frame;
    CGRect initialOutputLanguageFrame = self.translateView.outputLanguageButton.frame;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.translateView.inputLanguageButton.frame = CGRectMake(self.screenBounds.width*0.6, 0, self.screenBounds.width*0.4, self.screenBounds.height/14);
    } completion:^(BOOL finished) {
        self.translateView.inputLanguageButton.frame = initialInputLanguageFrame;
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.translateView.outputLanguageButton.frame = CGRectMake(0, 0, self.screenBounds.width*0.4, self.screenBounds.height/14);
    } completion:^(BOOL finished) {
        self.translateView.outputLanguageButton.frame = initialOutputLanguageFrame;
    }];
    
    [self translateText];
}

-(void)returnSelectedOutputLanguage:(Language*)language {
    self.outputLanguage = language;
    [self.translateView.outputLanguageButton setTitle:[NSString stringWithFormat:@"%@ ▾", [language longLanguage]] forState:UIControlStateNormal];
    [self showOutputLanguages];
    [self translateText];
}

-(void)returnSelectedInputLanguage:(Language *)language {
    self.inputLanguage = language;
    [self.translateView.inputLanguageButton setTitle:[NSString stringWithFormat:@"%@ ▾", [language longLanguage]] forState:UIControlStateNormal];
    [self showInputLanguages];
    [self translateText];
}

-(void)showOutputLanguages {
    [UIView animateWithDuration:0.3 animations:^{
        if(self.outputLanguageView.frame.origin.x == self.screenBounds.width/2) {
            self.outputLanguageView.frame = CGRectMake(self.screenBounds.width, self.screenBounds.height/14, self.screenBounds.width/2, self.screenBounds.height*11/14);
        } else {
            self.outputLanguageView.frame = CGRectMake(self.screenBounds.width/2, self.screenBounds.height/14, self.screenBounds.width/2, self.screenBounds.height*11/14);
        }
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self translateText];
    [self.translateView.inputTextView resignFirstResponder];
    [self saveHistory];
    [self.translateView.historyView fetchSavedHistory];
}

-(void)hideKeyboard {
    [self translateText];
    [self.translateView.inputTextView resignFirstResponder];
    [self saveHistory];
    [self.translateView.historyView fetchSavedHistory];
}

-(void)showInputLanguages {
    [UIView animateWithDuration:0.3 animations:^{
        if(self.inputLanguageView.frame.origin.x == 0) {
            self.inputLanguageView.frame = CGRectMake(-self.screenBounds.width/2, self.screenBounds.height/14, self.screenBounds.width/2, self.screenBounds.height*11/14);
        } else {
            self.inputLanguageView.frame = CGRectMake(0, self.screenBounds.height/14, self.screenBounds.width/2, self.screenBounds.height*11/14);
        }
    }];
}

#pragma mark - UITextViewDelegate
-(void)textViewDidChange:(UITextView *)textView {
    [self translateText];
    [self checkCoreDataForText];
    if([self.translateView.inputTextView.text isEqualToString:@""]) {
        self.translateView.outputTextView.text = @"";
    }
}

-(void)textViewDidBeginEditing:(UITextView *)textView {
    if([self.translateView.inputTextView.text isEqualToString:@"Tap to text"]) {
        self.translateView.inputTextView.text = @"";
        self.translateView.inputTextView.textColor = [UIColor blackColor];
    }
    [self.translateView.inputTextView becomeFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [self translateText];
        [self saveHistory];
        [self.translateView.historyView fetchSavedHistory];
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}


@end
