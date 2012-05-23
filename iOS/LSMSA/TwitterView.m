//
//  TwitterView.m
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "TwitterView.h"

@implementation TwitterView

@synthesize tweetText = _text, tweetDate = _date, tweet = _tweet;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


    return cell;
}

-(void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    [self updateCell];
    
}

-(void) updateCell;
{
    [_date setText: [_tweet textBody]];
    [_date setText: [NSString stringWithFormat:@"%@",[_tweet dateCreated]]];
}

@end
