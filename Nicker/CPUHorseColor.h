//
//  CPUHorseColor.h
//  Nicker
//
//  Created by Ryan Johnson on 2/11/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPUHorseColor : NSObject

typedef enum {
    BAY,
    BLACK,
    BUCKSKIN,
    CHESTNUT,
    CREMELLO,
    DUN,
    GREY,
    GRULLO,
    LIVER_CHESTNUT,
    OTHER,
    PALOMINO,
    ROAN,
    SORREL,
    WHITE,
    UNKNOWN_COLOR
} HorseColor;

+(NSString*)colorAsString:(HorseColor)color;
+(HorseColor)fromString:(NSString*)colorString;

@end
