//
//  FacebookView.h
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TTTAttributedLabel.h"
#import "NINetworkImageView.h"

@interface StatusTableViewCell : UITableViewCell

@property (nonatomic, retain) TTTAttributedLabel *statusLabel;
@property (nonatomic, retain) NSString *statusString;
@property (nonatomic, retain) UILabel *statusDate;
@property (nonatomic, retain) NINetworkImageView *statusImage;

@end
