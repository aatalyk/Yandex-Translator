//
//  YandexTranslator.m
//  YandexTranslator
//
//  Created by Admin on 3/28/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "YandexTranslator.h"

@implementation YandexTranslator

-(id)init {
    self = [super init];
    
    if(self) {
       self.translateApi = @"https://translate.yandex.net/api/v1.5/tr.json/translate?";
       self.languagesApi = @"https://translate.yandex.net/api/v1.5/tr.json/getLangs?";
       self.detectLanguageApi = @"https://translate.yandex.net/api/v1.5/tr.json/detect?";
       self.key = @"trnsl.1.1.20170328T051040Z.4109dc60b326468c.4fb35c5ce64343ceb76874b60575a82bf5a6e03f";
       self.lang = @"ru";
       self.ui = @"en";
    }
    
    return self;
}

-(NSString*)generateUrlStringForTranslation {
    NSString *text = [self.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    text = [text stringByReplacingOccurrencesOfString:@"\n" withString:@"%20"];
    NSString *urlString = [NSString stringWithFormat:@"%@lang=%@&key=%@&text=%@", self.translateApi, self.lang, self.key, text];
    return urlString;
}

-(NSString*)generateUrlStringForSupportedLanguages {
    NSString *urlString = [NSString stringWithFormat:@"%@ui=%@&key=%@", self.languagesApi, self.ui, self.key];
    return urlString;
}

-(NSString*)generateUrlStringForLanguageDetection {
    NSString *text = [self.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    text = [text stringByReplacingOccurrencesOfString:@"\n" withString:@"%20"];
    NSString *urlString = [NSString stringWithFormat:@"%@&key=%@&text=%@", self.detectLanguageApi, self.key, text];
    return urlString;
}

@end
