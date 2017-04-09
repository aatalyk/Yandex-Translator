//
//  YandexTranslator.h
//  YandexTranslator
//
//  Created by Admin on 3/28/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YandexTranslator : NSObject

@property (nonatomic, strong) NSString *translateApi;
@property (nonatomic, strong) NSString *languagesApi;
@property (nonatomic, strong) NSString *detectLanguageApi;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *lang;
@property (nonatomic, strong) NSString *ui;
@property (nonatomic, strong) NSString *text;

-(NSString*)generateUrlStringForTranslation;
-(NSString*)generateUrlStringForSupportedLanguages;
-(NSString*)generateUrlStringForLanguageDetection;

@end
