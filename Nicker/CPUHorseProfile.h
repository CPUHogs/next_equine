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
@property (nonatomic) NSString *location;
@property (nonatomic) float price;
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
