//
//  Prospy.h
//  LSMSA
//
//  Created by Evan Cordell on 5/24/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Prospy : NSObject

@property (nonatomic, retain) IBOutlet NSString *name;
@property (nonatomic, retain) IBOutlet NSString *email;
@property (nonatomic, retain) IBOutlet NSString *currentSchool;
@property (nonatomic, retain) IBOutlet NSString *gradYear;
@property (nonatomic, retain) IBOutlet NSString *address1;
@property (nonatomic, retain) IBOutlet NSString *address2;
@property (nonatomic, retain) IBOutlet NSString *city;
@property (nonatomic, retain) IBOutlet NSString *state;
@property (nonatomic, retain) IBOutlet NSString *zip;
@property (nonatomic, retain) IBOutlet NSString *concentration;
@property (nonatomic, retain) IBOutlet NSString *telephoneNumber;

@end
