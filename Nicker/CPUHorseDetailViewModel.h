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

#pragma mark - Initializer methods
-(instancetype)initWithProfile:(CPUHorseProfile*)profile;

@end
