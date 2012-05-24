//
//  TwitterModel.m
//  LSMSA
//
//  Created by Apple on 5/22/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

@synthesize createdAt = _createdAt, profileImageUrlString = _profileImageUrlString, text = _text, fromUser = _fromUser;

- (void)setProfileImageUrlString:(NSString *)profileImageUrlString {    
    // Set the image for the image managed object.
    NSData  *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:profileImageUrlString]];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // Create image folder if it doesn't exist
    NSError *folderCreateError = nil;
    NSString *imageFolderPath = [documentsDirectory stringByAppendingPathComponent:@"images"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:imageFolderPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:imageFolderPath withIntermediateDirectories:NO attributes:nil error:&folderCreateError];
        if (folderCreateError) {
            NSLog(@"Error creating folder: %@", folderCreateError);
        }
    }
    
    NSString *fileName = [profileImageUrlString lastPathComponent];
    
    // Write to file
    NSString *path = [imageFolderPath stringByAppendingPathComponent:[NSString stringWithString:fileName]];
    [imageData writeToFile:path atomically:NO];
    _profileImageUrlString = path;
}
/*
- (void)setText:(NSString *)text {
    NSString *parsedText = [text stringByDecodingHTMLEntities];
    _text = parsedText;
}*/

@end
