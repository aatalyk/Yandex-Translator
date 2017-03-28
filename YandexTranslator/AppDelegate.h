//
//  AppDelegate.h
//  YandexTranslator
//
//  Created by Admin on 3/28/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end
