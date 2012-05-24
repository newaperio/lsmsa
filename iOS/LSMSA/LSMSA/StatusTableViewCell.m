//
//  FacebookView.m
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "StatusTableViewCell.h"

static CGFloat const kStatusTextFontSize = 12;

@implementation StatusTableViewCell

@synthesize statusDate = _statusDate, statusLabel = _statusLabel, statusImage = _statusImage, statusString = _statusString;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
        self.autoresizesSubviews = YES;
        
        //status label
        _statusLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(78, 20, 235, 20)];
        _statusLabel.font = [UIFont systemFontOfSize:kStatusTextFontSize];
        _statusLabel.textColor = [UIColor darkGrayColor];
        _statusLabel.lineBreakMode = UILineBreakModeWordWrap;
        _statusLabel.numberOfLines = 0;
        _statusLabel.highlightedTextColor = [UIColor clearColor];
        _statusLabel.shadowColor = [UIColor colorWithWhite:0.87 alpha:1.0];
        _statusLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
        _statusLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        NSMutableDictionary *mutableLinkAttributes = [NSMutableDictionary dictionary];
        [mutableLinkAttributes setValue:(id)[[UIColor colorWithRed:(31.0/256.0) green:(152.0/256.0) blue:(200.0/256.0) alpha:1] CGColor] forKey:(NSString*)kCTForegroundColorAttributeName];
        [mutableLinkAttributes setValue:[NSNumber numberWithBool:YES] forKey:(NSString *)kCTUnderlineStyleAttributeName];
        _statusLabel.linkAttributes = [NSDictionary dictionaryWithDictionary:mutableLinkAttributes];
        
        [self addSubview:_statusLabel];
        /*
        //user label
        _userLabel = [[UILabel alloc] initWithFrame:CGRectMake(78, 0, 222, 20)];
        _userLabel.font = [UIFont boldSystemFontOfSize:14];
        _userLabel.textColor = [UIColor blackColor];
        _userLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:_userLabel];
        
        //thumbnail
        _thumb = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
        _thumb.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:_thumb];
         */
        
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor] CGColor], (id)[[UIColor colorWithWhite:(246.0/256.0) alpha:1.0] CGColor], nil];
    [self.layer insertSublayer:gradient atIndex:0];
}

- (void)setStatusString:(NSString *)string {
    [self.statusLabel setText:string afterInheritingLabelAttributesAndConfiguringWithBlock:nil];
}

+ (CGFloat)heightForCellWithText:(NSString *)text forWidth:(CGFloat)width {
    CGFloat height = 30.0f;
    height += ceilf([text sizeWithFont:[UIFont systemFontOfSize:kStatusTextFontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap].height);
    return height;
}

@end
