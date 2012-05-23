//
//  TwitterModel.h
//  LSMSA
//
//  Created by Apple on 5/22/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject

@property (nonatomic, retain) NSString* textBody;
@property (nonatomic, retain) NSDate* dateCreated;

- (Tweet *)getTweet;

@end