//
//  Translation+CoreDataProperties.m
//  Yandex
//
//  Created by Admin on 4/2/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "Translation+CoreDataProperties.h"

@implementation Translation (CoreDataProperties)

+ (NSFetchRequest<Translation *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Translation"];
}

@dynamic originalText;
@dynamic translatedText;

@end
