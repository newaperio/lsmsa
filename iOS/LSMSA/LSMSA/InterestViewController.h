//
//  InterestViewController.h
//  LSMSA
//
//  Created by Chris King on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Prospy.h"

@interface InterestViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *nameTextField;
@property (nonatomic, retain) IBOutlet UITextField *emailTextField;
@property (nonatomic, retain) IBOutlet UITextField *currentSchoolTextField;
@property (nonatomic, retain) IBOutlet UITextField *gradYearTextField;
@property (nonatomic, retain) IBOutlet UITextField *address1TextField;
@property (nonatomic, retain) IBOutlet UITextField *address2TextField;
@property (nonatomic, retain) IBOutlet UITextField *cityTextField;
@property (nonatomic, retain) IBOutlet UITextField *stateTextField;
@property (nonatomic, retain) IBOutlet UITextField *zipTextField;
@property (nonatomic, retain) IBOutlet UITextField *concentrationTextField;
@property (nonatomic, retain) IBOutlet UITextField *telephoneNumberTextField;


-(IBAction)sendPressed:(id)sender;



@end
