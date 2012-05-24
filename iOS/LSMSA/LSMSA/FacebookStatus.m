//
//  FacebookPhotoModel.m
//  LSMSA
//
//  Created by Apple on 5/22/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "FacebookStatus.h"

@implementation FacebookStatus

@synthesize message = _message, imageURL = _imageURL, createdAt = _createdAt;

- (void)setImageURL:(NSString *)imageURL {    
    // Set the image for the image managed object.
    NSData  *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
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
    
    NSString *fileName = [imageURL lastPathComponent];
    
    // Write to file
    NSString *path = [imageFolderPath stringByAppendingPathComponent:[NSString stringWithString:fileName]];
    [imageData writeToFile:path atomically:NO];
    _imageURL = path;
}

@end
