//
//  CPUUserBio.h
//  Nicker
//
//  Created by Ryan Johnson on 2/7/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPUUserProfile : NSObject

@property (nonatomic, readonly) NSUUID* userId;
@property (nonatomic, readonly) NSString* userName;
@property (nonatomic) NSString* firstName;
@property (nonatomic) NSString* lastName;
@property (nonatomic) NSString* city;
@property (nonatomic) NSString* state;
@property (nonatomic) NSString* zipCode;
@property (nonatomic) float averageRating;
@property (nonatomic) NSString* emailAddress;
@property (nonatomic) NSString* phoneNumber;
@property (nonatomic) NSString* websiteUrl;
@property (nonatomic) NSString* additionalInfo;

#pragma mark Initialization methods
-(instancetype)init;
-(instancetype)initWithNames:(NSString*)userName
               withFirstName:(NSString*)firstName
                withLastName:(NSString*)lastName;
-(instancetype)initWithProfileData:(NSString*)userName
                     withFirstName:(NSString*)firstName
                      withLastName:(NSString*)lastName
                          withCity:(NSString*)city
                         withState:(NSString*)state
                       withZipCode:(NSString*)zipCode
                  withEmailAddress:(NSString*)emailAddress
                   withPhoneNumber:(NSString*)phoneNumber;

@end
