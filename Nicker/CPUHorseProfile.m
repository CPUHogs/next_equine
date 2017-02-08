//
//  HorseProfile.m
//  Nicker
//
//  Created by Ryan Johnson on 11/19/16.
//  Copyright © 2016 johnsonrw82. All rights reserved.
//

#import "CPUHorseProfile.h"

@implementation CPUHorseProfile

#pragma mark - Initializer section
-(instancetype)initWithName:(NSString *)name
               withLocation:(NSString *)location
                  withPrice:(float)price
                   hasImage:(NSString *)imageName {
    if (self = [super init]) {
        self.name = name;
        self.location = location;
        self.price = price;
        self.imageName = imageName;

        NSArray *imageParts = [self.imageName componentsSeparatedByString:@"."];
        _imageBaseName = [imageParts objectAtIndex:0];
        if ([imageParts count] == 2) {
            _imageType = [imageParts objectAtIndex:1];
        }
        else {
            return nil;
        }

        return self;
    }
    else {
        return nil;
    }
}

#pragma mark - Description
-(NSString*)description {
    NSString *description = [NSString stringWithFormat:@"HorseProfile = [name = %@\n" \
                             @"location = %@\nprice = %.2f]",
                             self.name, self.location, self.price];
    return description;
}

@end
