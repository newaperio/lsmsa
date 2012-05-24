//
//  TwitterView.h
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TwitterView : UITableViewCell

@property (nonatomic, retain) Tweet* tweet;

@property (nonatomic, retain) IBOutlet UILabel *tweetDate;
@property (nonatomic, retain) IBOutlet UILabel *tweetText;

@end
