//
//  TwitterView.h
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TTTAttributedLabel.h"
#import "NINetworkImageView.h"

@interface TweetTableViewCell : UITableViewCell

@property (nonatomic, strong) NINetworkImageView *thumb;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) TTTAttributedLabel *tweetLabel;
@property (nonatomic, copy) NSString *tweetString;

+ (CGFloat)heightForCellWithText:(NSString *)text forWidth:(CGFloat)width;

@end