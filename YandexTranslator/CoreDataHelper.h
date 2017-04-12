//
//  CoreDataHelper.h
//  Yandex
//
//  Created by Admin on 3/31/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataHelper : NSObject

//Translation Entity
+(void)saveTranslation:(NSString*)originalText translatedText:(NSString*)translatedText;
+(void)fetchSavedTranslations:(void(^)(NSArray *array))closure;
+(void)deleteTranslation:(NSString*)originalText translatedText:(NSString*)translatedText;
+(BOOL)isObjectExist:(NSString*)originalText translatedText:(NSString*)translatedText;
+(void)dropAllData;

//History Entity
+(void)saveHistory:(NSString*)originalText translatedText:(NSString*)translatedText;
+(void)fetchSavedHistory:(void(^)(NSArray *array))closure;
+(void)deleteHistory:(NSString*)originalText translatedText:(NSString*)translatedText;

@end
