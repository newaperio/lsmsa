//
//  TwitterView.m
//  LSMSA
//
//  Created by Apple on 5/23/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "TweetTableViewCell.h"

static CGFloat const kTweetTextFontSize = 12;

static NSRegularExpression *__hashtagRegularExpression;
static inline NSRegularExpression * HashtagRegularExpression() {
    if (!__hashtagRegularExpression) {
        __hashtagRegularExpression = [[NSRegularExpression alloc] initWithPattern:@"\\B#\\w*[a-zA-Z]+\\w*" options:NSRegularExpressionCaseInsensitive error:nil];
    }
    
    return __hashtagRegularExpression;
}

static NSRegularExpression *__userRegularExpression;
static inline NSRegularExpression * UserRegularExpression() {
    if (!__userRegularExpression) {
        __userRegularExpression = [[NSRegularExpression alloc] initWithPattern:@"@([A-Za-z0-9_]+)" options:NSRegularExpressionCaseInsensitive error:nil];
    }
    
    return __userRegularExpression;
}

@implementation TweetTableViewCell

@synthesize thumb = _thumb, timeLabel = _timeLabel, tweetLabel = _tweetLabel, tweetString = _tweetString;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
        self.autoresizesSubviews = YES;
        
        //tweet label
        _tweetLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(78, 20, 235, 20)];
        _tweetLabel.font = [UIFont systemFontOfSize:kTweetTextFontSize];
        _tweetLabel.textColor = [UIColor darkGrayColor];
        _tweetLabel.lineBreakMode = UILineBreakModeWordWrap;
        _tweetLabel.numberOfLines = 0;
        _tweetLabel.highlightedTextColor = [UIColor clearColor];
        _tweetLabel.shadowColor = [UIColor colorWithWhite:0.87 alpha:1.0];
        _tweetLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
        _tweetLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        NSMutableDictionary *mutableLinkAttributes = [NSMutableDictionary dictionary];
        [mutableLinkAttributes setValue:(id)[[UIColor colorWithRed:(31.0/256.0) green:(152.0/256.0) blue:(200.0/256.0) alpha:1] CGColor] forKey:(NSString*)kCTForegroundColorAttributeName];
        [mutableLinkAttributes setValue:[NSNumber numberWithBool:YES] forKey:(NSString *)kCTUnderlineStyleAttributeName];
        _tweetLabel.linkAttributes = [NSDictionary dictionaryWithDictionary:mutableLinkAttributes];
        
        [self addSubview:_tweetLabel];
        
        //user label
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(78, 0, 222, 20)];
        _timeLabel.font = [UIFont boldSystemFontOfSize:14];
        _timeLabel.textColor = [UIColor blackColor];
        _timeLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:_timeLabel];
        
        //thumbnail
        _thumb = [[NINetworkImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
        _thumb.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:_thumb];
        
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setTweetString:(NSString *)string {
    [self.tweetLabel setText:string afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange stringRange = NSMakeRange(0, [mutableAttributedString length]);
        
        NSRegularExpression *regexp = HashtagRegularExpression();
        [regexp enumerateMatchesInString:[mutableAttributedString string] options:0 range:stringRange usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {            
            [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[[UIColor colorWithRed:(31.0/256.0) green:(152.0/256.0) blue:(200.0/256.0) alpha:1] CGColor] range:result.range];
        }];
        
        regexp = UserRegularExpression();
        [regexp enumerateMatchesInString:[mutableAttributedString string] options:0 range:stringRange usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {            
            [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[[UIColor colorWithRed:(31.0/256.0) green:(152.0/256.0) blue:(200.0/256.0) alpha:1] CGColor] range:result.range];
        }];
        
        return mutableAttributedString;
    }];
}

+ (CGFloat)heightForCellWithText:(NSString *)text forWidth:(CGFloat)width {
    CGFloat height = 30.0f;
    height += ceilf([text sizeWithFont:[UIFont systemFontOfSize:kTweetTextFontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap].height);
    return height;
}

@end

