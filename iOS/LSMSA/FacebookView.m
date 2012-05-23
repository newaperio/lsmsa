//
//  FacebookView.m
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "FacebookView.h"

@implementation FacebookView

@synthesize statusArray;
@synthesize statusText;

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
    
    static NSString *CellIdentifier = @"Status";
    
    FacebookView *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[FacebookView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    return cell;
}

@end
