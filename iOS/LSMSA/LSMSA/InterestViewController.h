//
//  InterestViewController.h
//  LSMSA
//
//  Created by Chris King on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InterestViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *name;
@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) IBOutlet UITextField *currentSchool;
@property (nonatomic, retain) IBOutlet UITextField *gradYear;
@property (nonatomic, retain) IBOutlet UITextField *address1;
@property (nonatomic, retain) IBOutlet UITextField *address2;
@property (nonatomic, retain) IBOutlet UITextField *city;
@property (nonatomic, retain) IBOutlet UITextField *state;
@property (nonatomic, retain) IBOutlet UITextField *zip;
@property (nonatomic, retain) IBOutlet UITextField *concentration;
@property (nonatomic, retain) IBOutlet UITextField *telephoneNumber;


-(IBAction)sendPressed:(id)sender;



@end
