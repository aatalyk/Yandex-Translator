//
//  History+CoreDataProperties.h
//  Yandex
//
//  Created by Admin on 4/2/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "History+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface History (CoreDataProperties)

+ (NSFetchRequest<History *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *originalHistoryText;
@property (nullable, nonatomic, copy) NSString *translatedHistoryText;

@end

NS_ASSUME_NONNULL_END
