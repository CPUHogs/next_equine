//
//  CPUUtilFunctions.m
//  Nicker
//
//  Created by Ryan Johnson on 2/18/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import "CPUUtilFunctions.h"

@implementation CPUUtilFunctions

// Utility function for loading an image resource
+(UIImage*)loadImageResource:(NSString *)resourceName {

    // split the image name into the base name and extension
    NSArray *imageParts = [resourceName componentsSeparatedByString:@"."];
    NSString* imageBaseName = [imageParts objectAtIndex:0];
    if ([imageParts count] == 2) {
        NSString* imageType = [imageParts objectAtIndex:1];

        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageBaseName
                                                              ofType:imageType];
        // return a new image with the contents of the path found by resource lookup
        return [UIImage imageWithContentsOfFile:imagePath];
    }

    return nil;
}

@end
