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

@property (nonatomic, strong) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) IBOutlet UITextField *emailTextField;
@property (nonatomic, strong) IBOutlet UITextField *currentSchoolTextField;
@property (nonatomic, strong) IBOutlet UITextField *gradYearTextField;
@property (nonatomic, strong) IBOutlet UITextField *address1TextField;
@property (nonatomic, strong) IBOutlet UITextField *address2TextField;
@property (nonatomic, strong) IBOutlet UITextField *cityTextField;
@property (nonatomic, strong) IBOutlet UITextField *stateTextField;
@property (nonatomic, strong) IBOutlet UITextField *zipTextField;
@property (nonatomic, strong) IBOutlet UITextField *concentrationTextField;
@property (nonatomic, strong) IBOutlet UITextField *telephoneNumberTextField;


-(IBAction)sendPressed:(id)sender;



@end
