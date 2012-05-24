//
//  NewsTableController.h
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/Restkit.h>
#import "FacebookStatus.h"
#import "Tweet.h"
#import "StatusTableViewCell.h"
#import "TweetTableViewCell.h"
#import "TTTAttributedLabel.h"

@interface NewsTableController : UITableViewController <RKObjectLoaderDelegate, TTTAttributedLabelDelegate, UIActionSheetDelegate> {
    NSArray* _tweets;
    NSArray* _facebookStatuses;
    NSMutableArray* _allUpdates;
}

-(void) loadTwitterContent;
-(void) loadFacebookContent;
-(void) sortAndCombineUpdates;

@end
