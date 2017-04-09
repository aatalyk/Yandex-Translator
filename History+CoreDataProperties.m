//
//  History+CoreDataProperties.m
//  Yandex
//
//  Created by Admin on 4/2/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "History+CoreDataProperties.h"

@implementation History (CoreDataProperties)

+ (NSFetchRequest<History *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"History"];
}

@dynamic originalHistoryText;
@dynamic translatedHistoryText;

@end
