//
//  FacebookView.m
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "StatusTableViewCell.h"

@implementation StatusTableViewCell

@synthesize statusText = _text, statusDate = _date, statusImage = _image, status = _status;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _status = [[FacebookStatus alloc] init];
        _date = [[UILabel alloc]init];
        _text = [[UILabel alloc]init];
    }
    return self;
}


-(void) setStatus:(FacebookStatus *)status
{
    _status = status;
    [_text setText:[_status message]];
    [_date setText:[NSString stringWithFormat:@"%@",[_status createdAt]]];
}

@end
