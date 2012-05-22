//
//  TwitterModel.h
//  LSMSA
//
//  Created by Apple on 5/22/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwitterModel : NSObject

@property (nonatomic,retain) NSString* TextBody;
@property (nonatomic,retain) NSDate* DateCreated;

-(TwitterModel*) GetTweet;

@end
