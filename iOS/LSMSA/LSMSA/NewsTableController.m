//
//  NewsTableController.m
//  LSMSA
//
//  Created by Apple on 5/22/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "NewsTableController.h"

@implementation NewsTableController

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
    
    RKObjectManager* facebookObjectManager = [RKObjectManager objectManagerWithBaseURL:[NSURL URLWithString:@"https://graph.facebook.com/LSMSA/feed?access_token=229258737190118%7Cd_25JuHSsUdI2hw12QlfH1DSXdg"]];
    RKObjectMapping* statusMapping = [RKObjectMapping mappingForClass:[FacebookStatus class]];
    [statusMapping mapKeyPath:@"message" toAttribute:@"Message"];
    [statusMapping mapKeyPath:@"picture" toAttribute:@"ImageURL"];
    [statusMapping mapKeyPath:@"created_time" toAttribute:@"DateCreated"];
    [facebookObjectManager.mappingProvider setMapping:statusMapping forKeyPath:@"data"];
    
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

@end
