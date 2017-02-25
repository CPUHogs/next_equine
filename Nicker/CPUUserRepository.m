//
//  CPUUserRepository.m
//  Nicker
//
//  Created by Ryan Johnson on 2/24/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import "CPUUserRepository.h"
#import "CPUUserProfile.h"

@interface CPUUserRepository () {
    NSMutableDictionary *_users;
    NSMutableDictionary *_usernameToId;
    CPUUserRepository *_instance;
}

-(instancetype)init:(NSString*)plistPath;

@end

@implementation CPUUserRepository

static CPUUserRepository *repositoryPtr = nil;

#pragma mark Initialization
+(instancetype)getInstance {
    if (!repositoryPtr) {
        [NSException raise:NSGenericException format:@"User repository must be initialized prior to use!"];
        return nil;
    }
    return repositoryPtr;
}

+(void)initFromPlist:(NSString *)plistPath {
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        repositoryPtr = [[self alloc] init:plistPath];
    });
}

-(CPUUserProfile*) profileWithUsername:(NSString *)username {
    NSString* userId = [_usernameToId valueForKey:username];
    if (userId) {
        return [_users valueForKey:userId];
    }

    return nil;
}

#pragma mark Private methods
-(instancetype)init:(NSString*) plistPath {
    if (self = [super init]) {

        _users = [NSMutableDictionary dictionary];
        _usernameToId = [NSMutableDictionary dictionary];

        NSArray* dicts = [NSArray arrayWithContentsOfFile:plistPath];

        for (NSDictionary *dict in dicts) {
            // init each profile and store it
            CPUUserProfile *profile = [[CPUUserProfile alloc] initWithUsername:[dict objectForKey:@"username"]
                                                                 withFirstName:[dict objectForKey:@"firstName"]
                                                                  withLastName:[dict objectForKey:@"lastName"]
                                                                      withCity:[dict objectForKey:@"city"]
                                                                     withState:[dict objectForKey:@"state"]
                                                                   withZipCode:[dict objectForKey:@"zipCode"]
                                                              withEmailAddress:[dict objectForKey:@"emailAddress"]
                                                               withPhoneNumber:[dict objectForKey:@"phoneNumber"]];

            if (profile) {
                // pull out the ID from the new profile and store it in the dictionary
                [_users setValue:profile
                          forKey:[NSString stringWithFormat:@"%@",[profile userId]]];
                // hash the user ID woth the username
                [_usernameToId setValue:[NSString stringWithFormat:@"%@",[profile userId]]
                                                            forKey:[profile userName]];
            }
            else {
                NSLog(@"ERROR: Unable to load user profile");
            }

        }

        NSLog(@"Users: %@",_users);

        return self;
    }

    return nil;

}

@end
