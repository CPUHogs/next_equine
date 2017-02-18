//
//  HorseProfile.m
//  Nicker
//
//  Created by Ryan Johnson on 11/19/16.
//  Copyright © 2016 johnsonrw82. All rights reserved.
//

#import "CPUHorseProfile.h"
#import "CPUHorseGender.h"
#import "CPUHorseColor.h"

@interface CPUHorseProfile()

// helper function to initialize
-(BOOL)initHelper:(NSString*)name
     withLocation:(NSString*)location
        withPrice:(float)price
    withBirthdate:(NSDate*)birthdate
       withGender:(HorseGender)gender
       withHeight:(float)height
        withBreed:(NSString*)breed
        withColor:(HorseColor)color
  withDisciplines:(NSArray*)disciplines
    withImageName:(NSString*)imageName;

@end

@implementation CPUHorseProfile

#pragma mark - Initializer section
-(instancetype)initWithName:(NSString *)name
               withLocation:(NSString *)location
                  withPrice:(float)price
                   hasImage:(NSString *)imageName {
    if (self = [super init]) {
        if (![self initHelper:name
                 withLocation:location
                    withPrice:price
                withBirthdate:[NSDate date]
                   withGender:GELDING
                   withHeight:15.1
                    withBreed:@"Breed"
                    withColor:WHITE
              withDisciplines:nil
                withImageName:imageName]) {
            return nil;
        }

        return self;
    }
    else {
        return nil;
    }
}

-(instancetype)initWithProfile:(CPUHorseProfile *)profile {
    if (self = [super init]) {
        if (![self initHelper:profile.name
                 withLocation:profile.location
                    withPrice:profile.price
                withBirthdate:profile.birthDate
                   withGender:profile.gender
                   withHeight:profile.height
                    withBreed:profile.breed
                    withColor:profile.color
              withDisciplines:profile.disciplines
                withImageName:profile.imageName]) {
            return nil;
        }

        return self;
    }
    else {
        return nil;
    }
}

-(BOOL)initHelper:(NSString *)name
     withLocation:(NSString *)location
        withPrice:(float)price
    withBirthdate:(NSDate *)birthdate
       withGender:(HorseGender)gender
       withHeight:(float)height
        withBreed:(NSString *)breed
        withColor:(HorseColor)color
  withDisciplines:(NSArray *)disciplines
    withImageName:(NSString*)imageName {

    BOOL result = YES;

    self.name = name;
    self.location = location;
    self.price = price;
    self.imageName = imageName;

    // get the years from the date difference
    self.birthDate = birthdate;
    NSDateComponents* components;
    components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear
                                                 fromDate:birthdate
                                                   toDate:[NSDate date]
                                                  options:0];
    _age = (int)[components year];

    self.gender = gender;
    self.breed = breed;
    self.color = color;
    if (disciplines != nil) {
        self.disciplines = [NSMutableArray arrayWithArray:disciplines];
    }

    // need to validate this for formatting
    self.height = height;

    return result;
}

#pragma mark - Description
-(NSString*)description {
    NSString *description = [NSString stringWithFormat:@"HorseProfile = [name = %@\n" \
                             @"location = %@\nprice = %.2f]",
                             self.name, self.location, self.price];
    return description;
}

@end
