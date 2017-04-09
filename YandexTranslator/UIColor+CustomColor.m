//
//  UIColor+CustomColor.m
//  YandexTranslator
//
//  Created by Admin on 3/29/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "UIColor+CustomColor.h"

@implementation UIColor (CustomColor)

+(UIColor*)mainBlueColor {
    return [UIColor colorWithRed:82.0f/255.0f green:144.0f/255.0f blue:245.0f/255.0f alpha:1.0f];
}

+(UIColor*)lightGrayBackgroundColor {
    return [UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0f];
}

+(UIColor*)darkGrayTextColor {
    return [UIColor colorWithRed:100.0f/255.0f green:129.0f/255.0f blue:142.0f/255.0f alpha:1.0f];
}

@end
