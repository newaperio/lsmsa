//
//  TwitterModel.h
//  LSMSA
//
//  Created by Apple on 5/22/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+HTML.h"

@interface Tweet : NSObject

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSString * profileImageUrlString;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSString * fromUser;

@end
