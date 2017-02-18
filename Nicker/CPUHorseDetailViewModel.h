//
//  CPUHorseDetailViewModel.h
//  Nicker
//
//  Created by Ryan Johnson on 2/11/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CPUHorseProfile;

@interface CPUHorseDetailViewModel : NSObject

@property (nonatomic, readonly) CPUHorseProfile *activeProfile;

# pragma mark - Properties of profile
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *price;
@property (nonatomic) NSString *location;
@property (nonatomic) NSString *age;
@property (nonatomic) NSString *gender;
@property (nonatomic) NSString *height;
@property (nonatomic) NSString *breed;
@property (nonatomic) NSString *color;
@property (nonatomic) NSMutableArray *disciplines;
@property (nonatomic) NSString* visibleImageName;

#pragma mark - Initializer methods
-(instancetype)initWithProfile:(CPUHorseProfile*)profile;

@end
