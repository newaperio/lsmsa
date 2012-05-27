//
//  InterestViewController.m
//  LSMSA
//
//  Created by Chris King on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "InterestViewController.h"

static CGFloat const kTabBarHeight = 49;

@implementation InterestViewController

@synthesize nameTextField = _nameTextField, emailTextField = _emailTextField, currentSchoolTextField = _currentSchoolTextField, gradYearTextField = _gradYearTextField, address1TextField = _address1TextField, address2TextField = _address2TextField, concentrationTextField = _concentrationTextField, telephoneNumberTextField = _telephoneNumberTextField;
@synthesize cityTextField = _cityTextField, stateTextField = _stateTextField, zipTextField = _zipTextField, scrollView = _scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.contentSize = self.scrollView.frame.size;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)sendPressed:(id)sender {
    Prospy *prospy = [[Prospy alloc] init];
    prospy.name = self.nameTextField.text;
    prospy.email = self.emailTextField.text;
    prospy.gradYear = self.gradYearTextField.text;
    prospy.currentSchool = self.currentSchoolTextField.text;
    prospy.address1 = self.address1TextField.text;
    prospy.address2 = self.address2TextField.text;
    prospy.city = self.cityTextField.text;
    prospy.state = self.stateTextField.text;
    prospy.telephoneNumber = self.telephoneNumberTextField.text;
    prospy.zip = self.zipTextField.text;
    prospy.concentration = self.concentrationTextField.text;
    
    RKObjectManager *objectManager = [RKObjectManager objectManagerWithBaseURLString:@"http://blazing-fog-9465.herokuapp.com/"];
    objectManager.client.username = @"LsmsaAdmin";
    objectManager.client.password = @"eagles";
    objectManager.client.authenticationType = RKRequestAuthenticationTypeHTTP;
    
    [RKObjectManager setSharedManager:objectManager];
    
    RKObjectMapping *prospyMapping = [RKObjectMapping mappingForClass:[Prospy class]];
    [prospyMapping mapKeyPathsToAttributes:@"name", @"name", @"email", @"email", @"high_school", @"currentSchool", @"address_1", @"address1", @"address_2", @"address2", @"city", @"city", @"state", @"state", @"zip", @"zip", @"telephone_number", @"telephoneNumber", @"year", @"gradYear", nil];
    [objectManager.mappingProvider setObjectMapping:prospyMapping forKeyPath:@"prosipies"];
    [objectManager.mappingProvider setSerializationMapping:[prospyMapping inverseMapping] forClass:[Prospy class]];
    
    [objectManager.router routeClass:[Prospy class] toResourcePath:@"prospies" forMethod:RKRequestMethodPOST];
    
    __weak RKObjectMapping *bProspyMapping = prospyMapping;
    [objectManager postObject:prospy usingBlock:^(RKObjectLoader *loader) {
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
