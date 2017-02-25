//
//  CPUUserRepository.h
//  Nicker
//
//  Created by Ryan Johnson on 2/24/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CPUUserProfile;

@interface CPUUserRepository : NSObject

@property (nonatomic, copy) NSDictionary* users;

+(instancetype)getInstance;
+(void)initFromPlist:(NSString*)plistPath;
-(CPUUserProfile*)profileWithUsername:(NSString*)username;

@end
