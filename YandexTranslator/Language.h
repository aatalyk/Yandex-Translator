//
//  Language.h
//  Yandex
//
//  Created by Admin on 3/31/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Language : NSObject

@property (nonatomic, strong) NSString *shortLanguage;
@property (nonatomic, strong) NSString *longLanguage;

-(id)initWithShorLanguage:(NSString*)shorLanguage longLanguage:(NSString*)longLanguage;

@end
