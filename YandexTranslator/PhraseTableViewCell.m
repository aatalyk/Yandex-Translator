//
//  PhraseTableViewCell.m
//  Yandex
//
//  Created by Admin on 4/1/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import "UIView+CustomView.h"
#import "UIFont+CustomFont.h"
#import "PhraseTableViewCell.h"

@implementation PhraseTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setup];
    }
    
    return self;
}

-(void)setup {
    
    CGSize screenBounds = [UIScreen mainScreen].bounds.size;
    
    self.originalTextLabel = [[UILabel alloc]init];
    self.originalTextLabel.font = [[UIFont mainFont]fontWithSize:20];
    [self addSubview:self.originalTextLabel];
    
    self.translatedTextLabel = [[UILabel alloc]init];
    self.translatedTextLabel.font = [[UIFont mainFont]fontWithSize:16];
    [self addSubview:self.translatedTextLabel];
    
    [self addConstraintsWithFormat:@"H:|-20-[v0]-20-|" views:self.originalTextLabel, nil];
    [self addConstraintsWithFormat:@"H:|-20-[v0]-20-|" views:self.translatedTextLabel, nil];
    
    [self addConstraintsWithFormat:[NSString stringWithFormat:@"V:|[v0(%f)]-0-[v1(%f)]-10-|", screenBounds.height/10*0.7, screenBounds.height/10*0.3] views:self.originalTextLabel, self.translatedTextLabel, nil];
}

@end
