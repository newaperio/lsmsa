//
//  FacebookView.h
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookStatus.h"

@interface StatusTableViewCell : UITableViewCell

@property (nonatomic, retain) FacebookStatus *status;

@property (nonatomic, retain) IBOutlet UILabel *statusText;
@property (nonatomic, retain) IBOutlet UILabel *statusDate;
@property (nonatomic, retain) IBOutlet UIImageView *statusImage;

@end
