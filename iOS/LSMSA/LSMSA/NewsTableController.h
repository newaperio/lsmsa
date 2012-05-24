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
#import "FacebookView.h"
#import "TwitterView.h"

@interface NewsTableController : UITableViewController <RKObjectLoaderDelegate> {
    NSArray* _tweets;
    NSArray* _facebookStatuses;
    NSMutableArray* newArray;
}

-(void) loadTwitterContent;
-(void) loadFacebookContent;
-(void) sortTheDataFromTheStuffWeGotFromJsonInAPinchThankYouNSArrayForGivingUsGoodFunctionsNotLikeThis;

@end
