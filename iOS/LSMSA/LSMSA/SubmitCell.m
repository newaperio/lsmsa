//
//  SubmitCell.m
//  LSMSA
//
//  Created by Evan Cordell on 5/27/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "SubmitCell.h"

@implementation SubmitCell
@synthesize button = _button;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _button.frame = self.frame;
        [_button setTitle:@"Submit" forState:UIControlStateNormal];
        _button.tintColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.0 alpha:0.3];
        [self addSubview:_button];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
