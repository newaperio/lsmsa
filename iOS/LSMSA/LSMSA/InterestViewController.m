//
//  InterestViewController.m
//  LSMSA
//
//  Created by Chris King on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "InterestViewController.h"

@implementation InterestViewController

@synthesize name = _name, email = _email, currentSchool = _currentSchool, gradYear = _gradYear, address1 = _address1, address2 = _address2;
@synthesize city = _city, state = _state, zip = _zip;
//all the rest

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)sendPressed:(id)sender {
    Prospy *prospy = [[Prospy alloc]init];
    prospy.name = self.name.text;
    prospy.email = self.email.text;
    prospy.gradYear = self.gradYear.text;
    prospy.currentSchool = self.currentSchool.text;
    prospy.address1 = self.address1.text;
    prospy.address2 = self.address2.text;
    prospy.city = self.city.text;
    prospy.state = self.state.text;
    prospy.telephoneNumber = self.telephoneNumber.text;
    prospy.zip = self.zip.text;
    prospy.concentration = self.concentration.text;
}

@end
