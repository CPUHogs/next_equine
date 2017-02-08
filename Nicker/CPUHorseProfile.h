//
//  HorseProfile.h
//  Nicker
//
//  Created by Ryan Johnson on 11/19/16.
//  Copyright © 2016 johnsonrw82. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPUHorseProfile : NSObject

NS_ASSUME_NONNULL_BEGIN

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *location; // TODO: change to city/state
@property (nonatomic) float price;
@property (nonatomic, readonly) int age;
@property (nonatomic) NSDate* birthDate;
@property (nonatomic) NSString* gender; // TODO: make this an enum
@property (nonatomic) float height;
@property (nonatomic) NSString* breed; // TODO: make this an enum
@property (nonatomic) NSString* color;
@property (nonatomic) NSMutableArray* disciplines;

@property (nonatomic) NSUUID* ownerId; // ID of the owner of this horse (seller?)

@property (nonatomic, nullable) NSString *imageName;
@property (nonatomic, readonly) NSString *imageType;
@property (nonatomic, readonly) NSString *imageBaseName;

-(NSString*)description;
-(instancetype _Nullable)initWithName:(NSString*)name
               withLocation:(NSString*)location
                  withPrice:(float)price
                   hasImage:(NSString* _Nullable)imageName;

NS_ASSUME_NONNULL_END

@end
