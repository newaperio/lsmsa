//
//  FacebookPhotoModel.h
//  LSMSA
//
//  Created by Apple on 5/22/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Restkit/Restkit.h>

@interface FacebookPhotoModel : NSObject
@property(nonatomic, retain) NSString* Message;
@property(nonatomic, retain) NSString* ImageURL;
@property(nonatomic, retain) NSDate* DateCreated;

@end
