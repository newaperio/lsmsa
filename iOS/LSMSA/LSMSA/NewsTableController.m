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
    [self testInfo];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"Got to it!");
    
    
    [self loadFacebookContent];
    
    
    
    //facebookObjectManager.baseURL = @"https://api.twitter.com/1/statuses/user_timeline.json?screen_name=LSMSA&count=20";
    
    // ^^ Evan is gonna work on the above comment'dout code for us since it involes him modifying restkit. 
    
    
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

-(void)objectLoader: (RKObjectLoader*)objectLoader didLoadObjects:(NSArray *)objects{
    if([[NSString stringWithFormat:@"%@", [[objects objectAtIndex:0] class]] isEqualToString: @"FacebookStatus"])
    {
        _facebookStatuses = objects;
        [self loadTwitterContent];
    }
    if([[NSString stringWithFormat:@"%@", [[objects objectAtIndex:0] class]] isEqualToString: @"Tweet"]) {
        _tweets = objects;
        NSLog(@"%@", _tweets);
        
    }
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error
{
    NSLog(@"EPIC FAIL!");
}

-(void)testInfo
{
    NSLog(@"got it 2.0");
    for (FacebookStatus *status in _facebookStatuses) {
        NSLog(@"%@", status);
    }
    
    for (Tweet *tweet in _tweets) {
        NSLog(@"%@", tweet);
    }
}

-(void) loadFacebookContent
{
    RKObjectManager* facebookObjectManager = [RKObjectManager objectManagerWithBaseURL:[NSURL URLWithString:@"https://graph.facebook.com/LSMSA/feed?access_token=229258737190118%7Cd_25JuHSsUdI2hw12QlfH1DSXdg"]];
    RKObjectMapping* statusMapping = [RKObjectMapping mappingForClass:[FacebookStatus class]];
    [statusMapping mapKeyPath:@"message" toAttribute:@"message"];
    [statusMapping mapKeyPath:@"picture" toAttribute:@"imageURL"];
    [statusMapping mapKeyPath:@"created_time" toAttribute:@"dateCreated"];
    [facebookObjectManager.mappingProvider setMapping:statusMapping forKeyPath:@"data"];
    [facebookObjectManager loadObjectsAtResourcePath:@"" delegate:self];
}

-(void) loadTwitterContent
{
    // DO NOT EDIT
    __weak NewsTableController *bself = self;
    RKObjectManager* twitterObjectManager = [RKObjectManager objectManagerWithBaseURL:[NSURL URLWithString:@"https://api.twitter.com/1/statuses/user_timeline.json?screen_name=LSMSA&count=20"]];
    [RKObjectManager setSharedManager:twitterObjectManager];
    
   
    
    RKObjectMapping* tweetMapping = [RKObjectMapping mappingForClass:[Tweet class]];
    [tweetMapping mapKeyPath:@"text" toAttribute:@"textBody"];
    [tweetMapping mapKeyPath:@"created_at" toAttribute:@"dateCreated"];
    //[twitterObjectManager.mappingProvider setMapping:tweetMapping forKeyPath:@""];
    [twitterObjectManager.mappingProvider addObjectMapping:tweetMapping];
    tweetMapping.forceCollectionMapping = TRUE;
    [twitterObjectManager loadObjectsAtResourcePath:@"" usingBlock:^(RKObjectLoader *loader) {
        loader.objectMapping = [[RKObjectManager sharedManager].mappingProvider objectMappingForClass:[Tweet class]];
        loader.delegate = bself;
        NSLog(@"echo");
    }];

    [twitterObjectManager loadObjectsAtResourcePath:@"" delegate:self];

}

@end
