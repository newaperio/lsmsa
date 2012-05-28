//
//  Prospy.h
//  LSMSA
//
//  Created by Evan Cordell on 5/24/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface Prospy : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *currentSchool;
@property (nonatomic, retain) NSString *gradYear;
@property (nonatomic, retain) NSString *address1;
@property (nonatomic, retain) NSString *address2;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *state;
@property (nonatomic, retain) NSString *zip;
@property (nonatomic, retain) NSString *concentration_id;
@property (nonatomic, retain) NSString *interest;
@property (nonatomic, retain) NSString *telephoneNumber;

-(void)sendInterest;

@end
