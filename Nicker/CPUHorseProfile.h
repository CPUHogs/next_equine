//
//  HorseProfile.h
//  Nicker
//
//  Created by Ryan Johnson on 11/19/16.
//  Copyright © 2016 johnsonrw82. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPUHorseGender.h"
#import "CPUHorseColor.h"

@interface CPUHorseProfile : NSObject

NS_ASSUME_NONNULL_BEGIN

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *location; // TODO: change to city/state
@property (nonatomic) float price;
@property (nonatomic, readonly) int age;
@property (nonatomic) NSDate* birthDate;
@property (nonatomic) HorseGender gender;
@property (nonatomic) float height;
@property (nonatomic) NSString* breed; // TODO: make this an enum
@property (nonatomic) HorseColor color;
@property (nonatomic) NSString* ownerUsername;
@property (nonatomic) NSMutableArray* disciplines;

@property (nonatomic) NSUUID* ownerId; // ID of the owner of this horse (seller?)

@property (nonatomic, nullable) NSString *imageName;

-(NSString*)description;
-(instancetype _Nullable)initWithName:(NSString*)name
               withLocation:(NSString*)location
                  withPrice:(float)price
                   hasImage:(NSString* _Nullable)imageName;

-(instancetype _Nullable)initWithProfile:(CPUHorseProfile*)profile;
NS_ASSUME_NONNULL_END

@end
