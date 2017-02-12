//
//  CPUHorseColor.m
//  Nicker
//
//  Created by Ryan Johnson on 2/11/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import "CPUHorseColor.h"

@implementation CPUHorseColor

+(NSString*)colorAsString:(HorseColor)colorString {
    switch(colorString) {
        case BAY:
            return @"Bay";
        case BLACK:
            return @"Black";
        case BUCKSKIN:
            return @"Buckskin";
        case CHESTNUT:
            return @"Chestnut";
        case CREMELLO:
            return @"Cremello";
        case DUN:
            return @"Dun";
        case GREY:
            return @"Grey";
        case GRULLO:
            return @"Grullo";
        case LIVER_CHESTNUT:
            return @"Liver Chestnut";
        case OTHER:
            return @"Other";
        case PALOMINO:
            return @"Palomino";
        case ROAN:
            return @"Roan";
        case SORREL:
            return @"Sorrel";
        case WHITE:
            return @"White";
        default:
            [NSException raise:NSGenericException format:@"Unknown color!"];
            break;
    }

    return nil;
}

+(HorseColor)fromString:(NSString*)color {
    if ([color caseInsensitiveCompare:@"Bay"] == NSOrderedSame) {
        return BAY;
    }
    else if([color caseInsensitiveCompare:@"Black"] == NSOrderedSame) {
        return BLACK;
    }
    else if([color caseInsensitiveCompare:@"Buckskin"] == NSOrderedSame) {
        return BUCKSKIN;
    }
    else if([color caseInsensitiveCompare:@"Chestnut"] == NSOrderedSame) {
        return CHESTNUT;
    }
    else if([color caseInsensitiveCompare:@"Cremello"] == NSOrderedSame) {
        return CREMELLO;
    }
    else if([color caseInsensitiveCompare:@"Dun"] == NSOrderedSame) {
        return DUN;
    }
    else if([color caseInsensitiveCompare:@"Grey"] == NSOrderedSame) {
        return GREY;
    }
    else if([color caseInsensitiveCompare:@"Grullo"] == NSOrderedSame) {
        return GRULLO;
    }
    else if([color caseInsensitiveCompare:@"Liver Chestnut"] == NSOrderedSame) {
        return LIVER_CHESTNUT;
    }
    else if([color caseInsensitiveCompare:@"Other"] == NSOrderedSame) {
        return OTHER;
    }
    else if([color caseInsensitiveCompare:@"Palomino"] == NSOrderedSame) {
        return PALOMINO;
    }
    else if([color caseInsensitiveCompare:@"Roan"] == NSOrderedSame) {
        return ROAN;
    }
    else if([color caseInsensitiveCompare:@"Sorrel"] == NSOrderedSame) {
        return SORREL;
    }
    else if([color caseInsensitiveCompare:@"White"] == NSOrderedSame) {
        return WHITE;
    }
    else {
        [NSException raise:NSGenericException format:@"Unknown color string!"];
        return UNKNOWN_COLOR;
    }
}

@end
