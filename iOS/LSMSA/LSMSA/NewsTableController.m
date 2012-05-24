//
//  NewsTableController.m
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "NewsTableController.h"


@implementation NewsTableController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    
    [self loadFacebookContent];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
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
        [self.tableView reloadData];
    }
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error
{
    NSLog(@"EPIC FAIL!");
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
    NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
    for (Tweet* tweet in _tweets) {
        [tmpArray addObject:tweet];
    }
    for (FacebookStatus* status in _facebookStatuses) {
        [tmpArray addObject:status];
    }
    
    newArray = [NSMutableArray arrayWithArray:[tmpArray sortedArrayUsingComparator:^(id a, id b) {
        NSDate *first = [a dateCreated];
        NSDate *second = [b dateCreated];
        return [second compare:first];
    }] ];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [newArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *statusCellIdentifier = @"Status";
    
    static NSString *tweetCellIdentifier = @"Tweet";
    
    if([[newArray objectAtIndex: indexPath.row] class] == [FacebookStatus class])
    {
        FacebookView *facebookCell = [tableView dequeueReusableCellWithIdentifier:statusCellIdentifier];
        if (facebookCell == nil) {
            facebookCell = [[FacebookView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:statusCellIdentifier];
        }
        //facebookCell.frame = CGRectMake(facebookCell.frame.origin.x, facebookCell.frame.origin.y, facebookCell.frame.size.width, 50);
        facebookCell.status = [newArray objectAtIndex:indexPath.row];
        return facebookCell;
    } else if([[newArray objectAtIndex: indexPath.row] class] == [Tweet class])
    {
        TwitterView *twitterCell = [self.tableView dequeueReusableCellWithIdentifier:tweetCellIdentifier];
        if (twitterCell == nil) {
            twitterCell = [[TwitterView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tweetCellIdentifier];
        }
        //twitterCell.frame = CGRectMake(twitterCell.frame.origin.x, twitterCell.frame.origin.y, twitterCell.frame.size.width, 50);
        Tweet *tweet = [newArray objectAtIndex:indexPath.row];
        twitterCell.tweetDate.text = [NSString stringWithFormat:@"%@", tweet.dateCreated];
        twitterCell.tweetText.text = tweet.textBody;
        return twitterCell;
    }
    
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
