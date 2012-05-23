//
//  NewsTableController.h
//  LSMSA
//
//  Created by Apple on 5/22/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/Restkit.h>
#import "FacebookStatus.h"
#import "Tweet.h"

@interface NewsTableController : UIViewController <RKObjectLoaderDelegate>
{
    NSMutableArray* _tweets;
    NSMutableArray* _facebookStatuses;
    //NSMutableArray* _scoop; -- we are probably going to drop the source "Inside Scoop" because it gives us no XML and bad HTML. (its html 4.0)
}

@end
