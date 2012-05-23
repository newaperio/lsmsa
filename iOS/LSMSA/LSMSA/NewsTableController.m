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
    newArray = [[NSMutableArray alloc] init];
    
    [self loadFacebookContent]; // LOADS ALL CONTENTERS
    
    
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
        [self sortTheDataFromTheStuffWeGotFromJsonInAPinchThankYouNSArrayForGivingUsGoodFunctionsNotLikeThis];
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
        NSLog(@"%@", [status dateCreated]);
    }
    
    for (Tweet *tweet in _tweets) {
        NSLog(@"%@", tweet.dateCreated);
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
    tweetMapping.forceCollectionMapping = TRUE;
    
    [RKObjectMapping addDefaultDateFormatterForString:@"E MMM d HH:mm:ss Z y" inTimeZone:nil];

    
    [twitterObjectManager.mappingProvider addObjectMapping:tweetMapping];
        
    [twitterObjectManager loadObjectsAtResourcePath:@"" usingBlock:^(RKObjectLoader *loader) {
        loader.objectMapping = [[RKObjectManager sharedManager].mappingProvider objectMappingForClass:[Tweet class]];
        loader.delegate = bself;
        NSLog(@"echo");
    }];
}

-(void)sortTheDataFromTheStuffWeGotFromJsonInAPinchThankYouNSArrayForGivingUsGoodFunctionsNotLikeThis
{
    for (Tweet* tweet in _tweets) {
        [newArray addObject:tweet];
    }
    for (FacebookStatus* status in _facebookStatuses) {
        [newArray addObject:status];
    }
    
    newArray = [NSMutableArray arrayWithArray:[newArray sortedArrayUsingComparator:^(id a, id b) {
        NSDate *first = [a dateCreated];
        NSDate *second = [b dateCreated];
        return [second compare:first
                ];
    }] ];
    
    for (id obj in newArray) {
        NSLog(@"%@",[obj dateCreated]);
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if([[newArray objectAtIndex: indexPath.row] class] == [FacebookStatus class])
    {
        static NSString *statusCellIdentifier = @"Status";
        FacebookView *cell = [tableView dequeueReusableCellWithIdentifier:statusCellIdentifier];
        if (cell == nil) {
            cell = [[FacebookView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:statusCellIdentifier];
            cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, 50);
            return cell;
        }
    }
    
    else if([[newArray objectAtIndex: indexPath.row] class] == [Tweet class])
    {
        static NSString *tweetCellIdentifier = @"Tweet";
        
        TwitterView *cell = [tableView dequeueReusableCellWithIdentifier:tweetCellIdentifier];
        if (cell == nil) {
            cell = [[TwitterView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tweetCellIdentifier];
            cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, 50);
            return cell;
        }
    }

    return nil; // Something crapped itself
}
@end
