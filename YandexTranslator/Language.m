//
//  Language.m
//  Yandex
//
//  Created by Admin on 3/31/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "Language.h"

@implementation Language

-(id)initWithShorLanguage:(NSString *)shorLanguage longLanguage:(NSString *)longLanguage {
    self = [super init];
    
    if(self) {
        self.shortLanguage = shorLanguage;
        self.longLanguage = longLanguage;
    }
    
    return self;
}

@end
