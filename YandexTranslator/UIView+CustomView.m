//
//  UIView+CustomView.m
//  YandexTranslator
//
//  Created by Admin on 3/28/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "UIView+CustomView.h"

@implementation UIView (CustomView)

-(void)addConstraintsWithFormat:(NSString *)format views:(UIView *)view, ... {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    int index = 1;
    va_list views;
    va_start(views, view);
    
    UIView *arg = nil;
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [dictionary setValue:view forKey:@"v0"];
    
    while ((arg = va_arg(views, UIView*))) {
        arg.translatesAutoresizingMaskIntoConstraints = NO;
        NSString *key = [NSString stringWithFormat:@"v%i", index];
        [dictionary setValue:arg forKey:key];
        index++;
    }
    
    va_end(views);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:dictionary]];
}

@end
