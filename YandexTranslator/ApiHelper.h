//
//  ApiHelper.h
//  YandexTranslator
//
//  Created by Admin on 3/28/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiHelper : NSObject

+(void)translateTextUsingApi:(NSString*)apiString closure:(void (^)(NSString* string))closure;
+(void)getListOfSupportedLanguages:(NSString*)urlString closure:(void (^)(NSDictionary* dictionary))closure;
+(void)detectLanguage:(NSString*)urlString closure:(void(^)(NSString* language))closure;

@end
