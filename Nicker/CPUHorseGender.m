//
//  CPUHorseGender.m
//  Nicker
//
//  Created by Ryan Johnson on 2/7/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import "CPUHorseGender.h"

@implementation CPUHorseGender

+(HorseGender)fromString:(NSString *)gender {
    if ([gender caseInsensitiveCompare:@"MARE"] == NSOrderedSame) {
        return MARE;
    }
    else if ([gender caseInsensitiveCompare:@"GELDING"] == NSOrderedSame) {
        return GELDING;
    }
    else if ([gender caseInsensitiveCompare:@"STALLION"] == NSOrderedSame) {
        return STALLION;
    }
    else if ([gender caseInsensitiveCompare:@"COLT"] == NSOrderedSame) {
        return COLT;
    }
    else if ([gender caseInsensitiveCompare:@"FILLY"] == NSOrderedSame) {
        return FILLY;
    }
    // unknown type
    else {
        [NSException raise:NSGenericException format:@"Unknown gender type."];
    }

    return UNKNOWN_GENDER;
}

+(NSString*)genderAsString:(HorseGender)gender {
    NSString* result = nil;
    switch(gender) {
        case MARE:
            result = @"Mare";
            break;
        case GELDING:
            result = @"Gelding";
            break;
        case STALLION:
            result = @"Stallion";
            break;
        case COLT:
            result = @"Colt";
            break;
        case FILLY:
            result = @"Filly";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unknown gender type."];
            break;

    }

    return result;
}

@end
