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

@interface TweetTableViewCell : UITableViewCell {
    UIImageView *_thumb;
    UILabel *_timeLabel;
    TTTAttributedLabel *_tweetLabel;
    NSString *_tweetString;
}

@property (nonatomic, strong) UIImageView *thumb;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) TTTAttributedLabel *tweetLabel;
@property (nonatomic, copy) NSString *tweetString;

+ (CGFloat)heightForCellWithText:(NSString *)text forWidth:(CGFloat)width;

@end