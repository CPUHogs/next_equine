//
//  CPUViewModel.m
//  Nicker
//
//  Created by Ryan Johnson on 11/20/16.
//  Copyright © 2016 johnsonrw82. All rights reserved.
//

#import "CPUViewModel.h"
#import "CPUHorseProfile.h"
#import "CPUViewController.h"
#import "CPUUtilFunctions.h"

@interface CPUViewModel () {
    NSMutableArray *_horseProfiles;
    int nextIndex;
    BOOL endOfList;
}

@end

@implementation CPUViewModel

#pragma mark - Initialization
// initialize the profile data from the plist file
-(instancetype) initWithData:(NSArray*)profileData {
    _horseProfiles = [NSMutableArray array];
    // for each dictionary in the array, pull out all the data corresponding to the keys
    for (NSDictionary *dict in profileData) {
        CPUHorseProfile *profile =
        [[CPUHorseProfile alloc] initWithName:[dict objectForKey:@"name"]
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
-(void)addHorseProfile:(CPUHorseProfile *)profile {

    [_horseProfiles addObject:profile];
}

-(void)removeHorseProfile:(CPUHorseProfile *)profile {
    if (_horseProfiles) {
        [_horseProfiles removeObject:profile];
    }
}

#pragma mark - Helper methods
-(void)showNextProfile {
    if (nextIndex < [self.horseProfiles count]) {
        // show the profile to the user (set the ui elements)
        CPUHorseProfile *profile = [self.horseProfiles objectAtIndex:nextIndex];
        self.nameLabelString = [profile name];
        self.locationLabelString = [profile location];
        self.priceLabelString = [NSString stringWithFormat:@"%.2f",[profile price]];
        // set the visible image name
        self.visibleImageName = [profile imageName];

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
