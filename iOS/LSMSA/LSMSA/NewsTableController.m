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
        [self sortAndCombineUpdates];
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
    [statusMapping mapKeyPath:@"created_time" toAttribute:@"createdAt"];
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
    [tweetMapping mapKeyPath:@"text" toAttribute:@"text"];
    [tweetMapping mapKeyPath:@"created_at" toAttribute:@"createdAt"];
    [tweetMapping mapKeyPath:@"user.profile_image_url" toAttribute:@"profileImageUrlString"];
    [tweetMapping mapKeyPath:@"user.name" toAttribute:@"fromUser"];
    
    [RKObjectMapping addDefaultDateFormatterForString:@"E MMM d HH:mm:ss Z y" inTimeZone:nil];
    
    
    [twitterObjectManager.mappingProvider addObjectMapping:tweetMapping];
    
    [twitterObjectManager loadObjectsAtResourcePath:@"" usingBlock:^(RKObjectLoader *loader) {
        loader.objectMapping = [[RKObjectManager sharedManager].mappingProvider objectMappingForClass:[Tweet class]];
        loader.delegate = bself;
        NSLog(@"echo");
    }];
}

-(void)sortAndCombineUpdates
{
    NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
    for (Tweet* tweet in _tweets) {
        [tmpArray addObject:tweet];
    }
    for (FacebookStatus* status in _facebookStatuses) {
        [tmpArray addObject:status];
    }
    
    _allUpdates = [NSMutableArray arrayWithArray:[tmpArray sortedArrayUsingComparator:^(id a, id b) {
        NSDate *first = [a createdAt];
        NSDate *second = [b createdAt];
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
    return [_allUpdates count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *statusCellIdentifier = @"Status";
    
    static NSString *tweetCellIdentifier = @"Tweet";
    
    if([[_allUpdates objectAtIndex: indexPath.row] class] == [FacebookStatus class])
    {
        StatusTableViewCell *facebookCell = [tableView dequeueReusableCellWithIdentifier:statusCellIdentifier];
        if (facebookCell == nil) {
            facebookCell = [[StatusTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:statusCellIdentifier];
            facebookCell.statusImage.layer.masksToBounds = YES;
            facebookCell.statusImage.layer.frame = CGRectInset(facebookCell.statusImage.layer.frame, 5, 5);
            facebookCell.statusImage.layer.cornerRadius = 5.0;
            facebookCell.statusLabel.delegate = self;
            facebookCell.statusLabel.userInteractionEnabled = YES;
            facebookCell.statusLabel.dataDetectorTypes = UIDataDetectorTypeLink | UIDataDetectorTypePhoneNumber;
            facebookCell.statusLabel.backgroundColor = [UIColor clearColor];
            facebookCell.statusDate.backgroundColor = [UIColor clearColor];
            facebookCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        FacebookStatus *status = [_allUpdates objectAtIndex:indexPath.row];
        facebookCell.statusString = status.message;
        facebookCell.statusDate.text = [NSString stringWithFormat:@"%@ on facebook", [status.createdAt stringWithHumanizedTimeDifference]];
        facebookCell.statusImage.image = [UIImage imageWithContentsOfFile:status.imageURL];
        return facebookCell;
    } else if([[_allUpdates objectAtIndex: indexPath.row] class] == [Tweet class])
    {
        TweetTableViewCell *twitterCell = [self.tableView dequeueReusableCellWithIdentifier:tweetCellIdentifier];
        if (twitterCell == nil) {
            twitterCell = [[TweetTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tweetCellIdentifier];
            twitterCell.thumb.layer.masksToBounds = YES;
            twitterCell.thumb.layer.frame = CGRectInset(twitterCell.thumb.layer.frame, 5, 5);
            twitterCell.thumb.layer.cornerRadius = 5.0;
            twitterCell.tweetLabel.delegate = self;
            twitterCell.tweetLabel.userInteractionEnabled = YES;
            twitterCell.tweetLabel.dataDetectorTypes = UIDataDetectorTypeLink | UIDataDetectorTypePhoneNumber;
            twitterCell.tweetLabel.backgroundColor = [UIColor clearColor];
            twitterCell.timeLabel.backgroundColor = [UIColor clearColor];
            twitterCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        Tweet *tweet= [_allUpdates objectAtIndex:indexPath.row];
        twitterCell.thumb.image = [UIImage imageWithContentsOfFile:tweet.profileImageUrlString];
        twitterCell.timeLabel.text = [NSString stringWithFormat:@"%@ on twitter", [tweet.createdAt stringWithHumanizedTimeDifference]];
        twitterCell.tweetString = tweet.text;
        return twitterCell;
    }
    
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([[_allUpdates objectAtIndex:indexPath.row] class] == [Tweet class]) {
        CGFloat height = 0.0;
        if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
            height = [TweetTableViewCell heightForCellWithText:[[_allUpdates objectAtIndex:indexPath.row] text] forWidth:235.0];
        } else if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
            height = [TweetTableViewCell heightForCellWithText:[[_allUpdates objectAtIndex:indexPath.row] text] forWidth:395.0];
        }
        return (height >= 70) ? height : 70;
    } else if ([[_allUpdates objectAtIndex:indexPath.row] class] == [FacebookStatus class]) {
        CGFloat height = 0.0;
        if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
            height = [TweetTableViewCell heightForCellWithText:[[_allUpdates objectAtIndex:indexPath.row] message] forWidth:235.0];
        } else if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
            height = [TweetTableViewCell heightForCellWithText:[[_allUpdates objectAtIndex:indexPath.row] message] forWidth:395.0];
        }
        return (height >= 70) ? height : 70;
    } else {
        return 70;
    }
}

#pragma mark - TTTAttributedLabelDelegate

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url {
    [[[UIActionSheet alloc] initWithTitle:[url absoluteString] delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", nil) destructiveButtonTitle:nil otherButtonTitles:NSLocalizedString(@"Open in Link Safari", nil), nil] showFromTabBar:self.tabBarController.tabBar];
}

#pragma mark - UIActionSheetDelegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        return;
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:actionSheet.title]];
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
