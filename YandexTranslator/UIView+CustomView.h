//
//  UIView+CustomView.h
//  YandexTranslator
//
//  Created by Admin on 3/28/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CustomView)

-(void)addConstraintsWithFormat:(NSString*)format views:(UIView*)view, ...;

@end
