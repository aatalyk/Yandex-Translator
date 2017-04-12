//
//  ApiHelper.m
//  YandexTranslator
//
//  Created by Admin on 3/28/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "Language.h"
#import "ApiHelper.h"

@implementation ApiHelper

#pragma mark - Translate Text Using Yandex Api
+(void)translateTextUsingApi:(NSString*)apiString closure:(void (^)(NSString* string))closure {
    
    NSMutableString *string = [[NSMutableString alloc] init];
    
    NSURL *url = [NSURL URLWithString:apiString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        
        //if([httpResponse statusCode] >= 200 && [httpResponse statusCode] <= 300) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            NSArray *array = [json valueForKey:@"text"];
            
            [string stringByAppendingString:[NSString stringWithFormat:@"%@", array[0]]];
   
            dispatch_async(dispatch_get_main_queue(), ^{
                closure(array[0]);
            });
        //}
    }];
    
    [task resume];
}

#pragma mark - Query Supported Languages
+(void)getListOfSupportedLanguages:(NSString*)urlString closure:(void (^)(NSDictionary* dictionary))closure {
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        
        ///if([httpResponse statusCode] >= 200 && [httpResponse statusCode] <= 300) {
            
            NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSDictionary *dictionary = [json valueForKey:@"langs"];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                closure(dictionary);
            });
        //}
        
    }];
    
    [task resume];
}

+(void)detectLanguage:(NSString*)urlString closure:(void(^)(NSString* language))closure {
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        
            NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSString *language = [json valueForKey:@"lang"];
       
            dispatch_async(dispatch_get_main_queue(), ^{
                closure(language);
            });
        
        
    }];
    
    [task resume];
}

@end
