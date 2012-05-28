//
//  Prospy.m
//  LSMSA
//
//  Created by Evan Cordell on 5/24/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "Prospy.h"

@implementation Prospy

@synthesize name = _name, email = _email, currentSchool = _currentSchool, gradYear = _gradYear, address1 = _address1, address2 = _address2, concentration_id = _concentration_id, telephoneNumber = _telephoneNumber;
@synthesize city = _city, state = _state, zip = _zip, interest = _interest;

- (void)sendInterest {
    RKObjectManager *objectManager = [RKObjectManager objectManagerWithBaseURLString:@"http://blazing-fog-9465.herokuapp.com/"];
    objectManager.client.username = @"LsmsaAdmin";
    objectManager.client.password = @"eagles";
    objectManager.client.authenticationType = RKRequestAuthenticationTypeHTTP;
    
    [RKObjectManager setSharedManager:objectManager];
    
    RKObjectMapping *prospyMapping = [RKObjectMapping mappingForClass:[Prospy class]];
    [prospyMapping mapKeyPathsToAttributes:@"name", @"name", @"email", @"email", @"high_school", @"currentSchool", @"address_1", @"address1", @"address_2", @"address2", @"city", @"city", @"state", @"state", @"zip", @"zip", @"telephone_number", @"telephoneNumber", @"year", @"gradYear", @"interest", @"interest", nil];
    [objectManager.mappingProvider setObjectMapping:prospyMapping forKeyPath:@"prosipies"];
    [objectManager.mappingProvider setSerializationMapping:[prospyMapping inverseMapping] forClass:[Prospy class]];
    
    [objectManager.router routeClass:[Prospy class] toResourcePath:@"prospies" forMethod:RKRequestMethodPOST];
    
    __weak RKObjectMapping *bProspyMapping = prospyMapping;
    [objectManager postObject:self usingBlock:^(RKObjectLoader *loader) {
        loader.objectMapping = bProspyMapping;
        loader.onDidFailLoadWithError = ^(NSError *error) {
            NSLog(@"%@", error);
        };
        loader.onDidFailWithError = ^(NSError *error) {
            NSLog(@"%@", error);
        };
    }];
}

@end
