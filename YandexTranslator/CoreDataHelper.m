//
//  CoreDataHelper.m
//  Yandex
//
//  Created by Admin on 3/31/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataHelper.h"
#import <CoreData/CoreData.h>

@implementation CoreDataHelper

+(void)saveTranslation:(NSString*)originalText translatedText:(NSString*)translatedText {
    
    NSManagedObjectContext *context = nil;
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    if([delegate respondsToSelector:@selector(managedObjectContext)]) {
        context = delegate.persistentContainer.viewContext;
    }
    
    NSManagedObject *text = [NSEntityDescription insertNewObjectForEntityForName:@"Translation" inManagedObjectContext:context];
    [text setValue:originalText forKey:@"originalText"];
    [text setValue:translatedText forKey:@"translatedText"];
    
    NSError *error = nil;
    
    if(![context save:&error]) {
        NSLog(@"Can not save object %@ %@", error, [error localizedDescription]);
    }
}

+(void)fetchSavedTranslations:(void(^)(NSArray *array))closure {
    
    NSManagedObjectContext *context = nil;
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    context = delegate.persistentContainer.viewContext;
    if([delegate respondsToSelector:@selector(managedObjectContext)]) {
        context = delegate.persistentContainer.viewContext;
    }
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Translation"];
    
    NSError *error = nil;
    
    NSArray *texts = [context executeFetchRequest:fetchRequest error:&error];
    
    if(!texts) {
        NSLog(@"Error fetching Translation objects: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    
    closure(texts);
}

+(void)deleteTranslation:(NSString*)originalText translatedText:(NSString*)translatedText {
    
    NSManagedObjectContext *context = nil;
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    if([delegate respondsToSelector:@selector(managedObjectContext)]) {
        context = delegate.persistentContainer.viewContext;
    }
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Translation" inManagedObjectContext:context];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    [fetchRequest setEntity:entityDescription];
    [fetchRequest setFetchLimit:1];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"originalText == %@ AND translatedText == %@", originalText, translatedText]];
    NSArray *array = [context executeFetchRequest:fetchRequest error:nil];
    
    for(NSManagedObject *object in array) {
        [context deleteObject:object];
    }

    NSError *error = nil;
    
    if (![context save:&error]) {
        NSLog(@"Error deleting Translation object: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

+(void)dropAllData {
    NSManagedObjectContext *context = nil;
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    if([delegate respondsToSelector:@selector(managedObjectContext)]) {
        context = delegate.persistentContainer.viewContext;
    }
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Translation" inManagedObjectContext:context];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    [fetchRequest setEntity:entityDescription];
    NSArray *array = [context executeFetchRequest:fetchRequest error:nil];
    
    for(NSManagedObject *object in array) {
        [context deleteObject:object];
    }
    
    NSError *error = nil;
    
    if (![context save:&error]) {
        NSLog(@"Error deleting Translation object: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

+(BOOL)isObjectExist:(NSString*)originalText translatedText:(NSString*)translatedText {
    
    NSManagedObjectContext *context = nil;
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    if([delegate respondsToSelector:@selector(managedObjectContext)]) {
        context = delegate.persistentContainer.viewContext;
    }
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Translation" inManagedObjectContext:context];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    [fetchRequest setEntity:entityDescription];
    [fetchRequest setFetchLimit:1];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"originalText == %@ AND translatedText == %@", originalText, translatedText]];
    
    NSError *error = nil;
    NSUInteger count = [context countForFetchRequest:fetchRequest error:&error];
    if(count) return YES;
    else return NO;
}

+(void)saveHistory:(NSString*)originalText translatedText:(NSString*)translatedText {
    
    NSManagedObjectContext *context = nil;
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    if([delegate respondsToSelector:@selector(managedObjectContext)]) {
        context = delegate.persistentContainer.viewContext;
    }
    
    NSManagedObject *text = [NSEntityDescription insertNewObjectForEntityForName:@"History" inManagedObjectContext:context];
    [text setValue:originalText forKey:@"originalHistoryText"];
    [text setValue:translatedText forKey:@"translatedHistoryText"];
    
    NSError *error = nil;
    
    if(![context save:&error]) {
        NSLog(@"Can not save object %@ %@", error, [error localizedDescription]);
    }
}

+(void)fetchSavedHistory:(void(^)(NSArray *array))closure {
    
    NSManagedObjectContext *context = nil;
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    if([delegate respondsToSelector:@selector(managedObjectContext)]) {
        context = delegate.persistentContainer.viewContext;
    }
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"History"];
    
    NSError *error = nil;
    
    NSArray *history = [context executeFetchRequest:fetchRequest error:&error];
    
    if(!history) {
        NSLog(@"Error fetching Translation objects: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    
    closure(history);
}

+(void)deleteHistory:(NSString*)originalText translatedText:(NSString*)translatedText {
    
    NSManagedObjectContext *context = nil;
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    if([delegate respondsToSelector:@selector(managedObjectContext)]) {
        context = delegate.persistentContainer.viewContext;
    }
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"History" inManagedObjectContext:context];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    [fetchRequest setEntity:entityDescription];
    [fetchRequest setFetchLimit:1];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"originalHistoryText == %@ AND translatedHistoryText == %@", originalText, translatedText]];
    NSArray *array = [context executeFetchRequest:fetchRequest error:nil];
    
    for(NSManagedObject *object in array) {
        [context deleteObject:object];
    }
    
    NSError *error = nil;
    
    if (![context save:&error]) {
        NSLog(@"Error deleting Translation object: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

@end
