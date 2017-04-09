//
//  PhraseTableViewCell.h
//  Yandex
//
//  Created by Admin on 4/1/17.
//  Copyright © 2017 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhraseTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *originalTextLabel;
@property (nonatomic, strong) UILabel *translatedTextLabel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
