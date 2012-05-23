//
//  TwitterView.m
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "TwitterView.h"

@implementation TwitterView

@synthesize tweetText;
@synthesize tweetArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Tweet";
    
    TwitterView *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TwitterView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    return cell;
}

@end
