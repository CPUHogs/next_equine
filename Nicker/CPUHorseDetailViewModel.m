//
//  CPUHorseDetailViewModel.m
//  Nicker
//
//  Created by Ryan Johnson on 2/11/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import "CPUHorseDetailViewModel.h"
#import "CPUHorseProfile.h"
#import "CPUHorseGender.h"
#import "CPUHorseColor.h"

@implementation CPUHorseDetailViewModel

-(instancetype)initWithProfile:(CPUHorseProfile*)profile {
    if (self = [super init]) {
        if (profile) {
            // set the active profile for this view model
            _activeProfile = profile;

            // set the properties from the profile
            _name = [profile name];
            _price = [NSString stringWithFormat:@"%.2f",[profile price]];
            _location = [profile location];
            _age = [NSString stringWithFormat:@"%d",[profile age]];
            _gender = [CPUHorseGender genderAsString:[profile gender]];
            _height = [NSString stringWithFormat:@"%.1f",[profile height]];
            _breed = [profile breed];
            _color = [CPUHorseColor colorAsString:[profile color]];
            _disciplines = [NSMutableArray arrayWithArray:[profile disciplines]];
            _visibleImageName = [profile imageName];

            return self;
        }

        return nil;
    }

    return nil;
}

@end
