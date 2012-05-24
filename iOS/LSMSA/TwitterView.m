//
//  TwitterView.m
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "TwitterView.h"

@implementation TwitterView

@synthesize tweetText = _tweetText, tweetDate = _tweetDate, tweet = _tweet;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _tweet = [[Tweet alloc] init];
        _tweetDate = [[UILabel alloc] init];
        _tweetText = [[UILabel alloc] init];
    }
    return self;
}

-(void)setTweet:(Tweet *)tweet {
    //_tweet = tweet;
    _tweetText.text = _tweet.textBody;
    _tweetDate.text = [NSString stringWithFormat:@"%@",[_tweet dateCreated]];
    
}

@end
