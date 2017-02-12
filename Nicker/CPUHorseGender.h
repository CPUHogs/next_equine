//
//  CPUHorseGender.h
//  Nicker
//
//  Created by Ryan Johnson on 2/7/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPUHorseGender : NSObject

// horse gender types
typedef enum {
    MARE,
    GELDING,
    STALLION,
    COLT,
    FILLY,
    UNKNOWN_GENDER
} HorseGender;

+(HorseGender)fromString:(NSString*)gender;
+(NSString*)genderAsString:(HorseGender)gender;

@end
