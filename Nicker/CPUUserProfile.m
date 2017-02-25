//
//  CPUUserBio.m
//  Nicker
//
//  Created by Ryan Johnson on 2/7/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import "CPUUserProfile.h"

@interface CPUUserProfile ()
// private helper method to init data
-(BOOL)initWithData:(NSString*)userName
      withFirstName:(NSString*)firstName
       withLastName:(NSString*)lastName
           withCity:(NSString*)city
          withState:(NSString*)state
        withZipCode:(NSString*)zipCode
   withEmailAddress:(NSString*)emailAddress
    withPhoneNumber:(NSString*)phoneNumber;

@end

@implementation CPUUserProfile

#pragma mark Initialization methods

// default initializer
-(instancetype)init {
    // init with some default data
    if (self = [super init]) {
        if (![self initWithData:@"newuser"
                  withFirstName:@"John"
                   withLastName:@"Doe"
                       withCity:@"Unknown"
                      withState:@"Unknown"
                    withZipCode:@"Unknown"
               withEmailAddress:@"Unknown"
                withPhoneNumber:@"Unknown"]) {
            return nil; // if something wrong with the data
        }

        return self;
    }
    else {
        return nil;
    }
}

// initialize with names only
-(instancetype)initWithNames:(NSString*)userName
               withFirstName:(NSString *)firstName
                withLastName:(NSString *)lastName {
    if (self = [super init]) {
        if (![self initWithData:userName
                  withFirstName:firstName
                   withLastName:lastName
                       withCity:@"Unknown"
                      withState:@"Unknown"
                    withZipCode:@"Unknown"
               withEmailAddress:@"Unknown"
                withPhoneNumber:@"Unknown"]) {
            return nil; // if something wrong with the data
        }

        return self;
    }
    else {
        return nil;
    }
}

// initialize with all profile data
-(instancetype)initWithUsername:(NSString*)userName
                  withFirstName:(NSString*)firstName
                   withLastName:(NSString*)lastName
                       withCity:(NSString*)city
                      withState:(NSString*)state
                    withZipCode:(NSString*)zipCode
               withEmailAddress:(NSString*)emailAddress
                withPhoneNumber:(NSString*)phoneNumber {

    if (self = [super init]) {
        if (![self initWithData:userName
                  withFirstName:firstName
                   withLastName:lastName
                       withCity:city
                      withState:state
                    withZipCode:zipCode
               withEmailAddress:emailAddress
                withPhoneNumber:phoneNumber]) {
            return nil; // if something wrong with the data
        }

        // return initialized class object
        return self;
    }
    else {
        return nil;
    }
}

#pragma mark Private methods
// perform setting and validation of the user input data
-(BOOL)initWithData:(NSString*)userName
      withFirstName:(NSString*)firstName
       withLastName:(NSString*)lastName
           withCity:(NSString*)city
          withState:(NSString*)state
        withZipCode:(NSString*)zipCode
   withEmailAddress:(NSString*)emailAddress
    withPhoneNumber:(NSString*)phoneNumber
{
    // generate a UUID
    _userId = [NSUUID UUID];
    // person's username
    _userName = userName;

    //TODO: perform validation on input data here
    self.firstName = firstName;
    self.lastName = lastName;
    self.city = city;
    self.state = state;
    self.zipCode = zipCode;
    self.emailAddress = emailAddress;
    self.phoneNumber = phoneNumber;

    return true;
}

@end
