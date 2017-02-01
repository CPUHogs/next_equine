//
//  CPUViewModel.m
//  Nicker
//
//  Created by Ryan Johnson on 11/20/16.
//  Copyright © 2016 johnsonrw82. All rights reserved.
//

#import "CPUViewModel.h"
#import "HorseProfile.h"
#import "CPUViewController.h"

@interface CPUViewModel () {
    NSMutableArray *_horseProfiles;
    int nextIndex;
    BOOL endOfList;
}

@end

@implementation CPUViewModel

#pragma mark - Initialization
-(instancetype) initWithData:(NSArray*)profileData {
    _horseProfiles = [NSMutableArray array];
    for (NSDictionary *dict in profileData) {
        HorseProfile *profile = [[HorseProfile alloc] initWithName:[dict objectForKey:@"name"]
                                                      withLocation:[dict objectForKey:@"location"]
                                                         withPrice:[[dict objectForKey:@"price"] floatValue]
                                                          hasImage:[dict objectForKey:@"imageName"]];

        if (profile) {
            [_horseProfiles addObject:profile];
        }
        else {
            NSLog(@"Error: Profile was unable to be loaded");
        }
    }

    nextIndex = 0;
    endOfList = NO;
    self.likedProfiles = [NSMutableArray array];

    return self;
}

#pragma mark - Horse Profile methods
-(void)addHorseProfile:(HorseProfile *)profile {

    [_horseProfiles addObject:profile];
}

-(void)removeHorseProfile:(HorseProfile *)profile {
    if (_horseProfiles) {
        [_horseProfiles removeObject:profile];
    }
}

#pragma mark - Helper methods
-(void)showNextProfile {
    if (nextIndex < [self.horseProfiles count]) {
        // show the profile to the user (set the ui elements)
        HorseProfile *profile = [self.horseProfiles objectAtIndex:nextIndex];
        self.nameLabelString = [profile name];
        self.locationLabelString = [profile location];
        self.priceLabelString = [NSString stringWithFormat:@"%.2f",[profile price]];
        // load the image
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:[profile imageBaseName]
                                                              ofType:[profile imageType]];
        //[self.imageView setImage:[UIImage imageWithContentsOfFile:imagePath]];
        self.visibleImage = [UIImage imageWithContentsOfFile:imagePath];

        // todo: find a better way to relay info back
        [self.controller updateView];

        NSLog(@"%@", profile);
        nextIndex++;
    }
    else {
        endOfList = YES;
    }
}

#pragma mark - Handler methods
-(void)likeProfile {
    // add to the liked list
    if (!endOfList) {
        //[UIView beginAnimations:nil context:NULL];
        //[UIView setAnimationDuration:3.0f];
        //[UIView commitAnimations];

        [self.likedProfiles addObject:[self.horseProfiles objectAtIndex:nextIndex-1]];
        [self showNextProfile];
    }
}

-(void)skipProfile {
    [self showNextProfile];
}

@end
