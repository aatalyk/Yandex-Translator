//
//  Translation+CoreDataProperties.h
//  Yandex
//
//  Created by Admin on 4/2/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "Translation+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Translation (CoreDataProperties)

+ (NSFetchRequest<Translation *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *originalText;
@property (nullable, nonatomic, copy) NSString *translatedText;

@end

NS_ASSUME_NONNULL_END
