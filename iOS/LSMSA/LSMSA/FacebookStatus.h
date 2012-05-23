//
//  FacebookPhotoModel.h
//  LSMSA
//
//  Created by Apple on 5/22/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Restkit/Restkit.h>

@interface FacebookStatus : NSObject

@property(nonatomic, retain) NSString* message;
@property(nonatomic, retain) NSString* imageURL;
@property(nonatomic, retain) NSDate* dateCreated;

@end
