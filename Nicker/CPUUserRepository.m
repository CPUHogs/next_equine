//
//  CPUUserRepository.m
//  Nicker
//
//  Created by Ryan Johnson on 2/24/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import "CPUUserRepository.h"
#import "CPUUserProfile.h"

@interface CPUUserProfile () {
    NSMutableDictionary *_users;
    CPUUserRepository *_instance;
}

-(instancetype)init:(NSString*)plistPath;

@end

@implementation CPUUserRepository

#pragma mark - Initialization
+(void)initFromPlist:(NSString *)plistPath {
    static CPUUserRepository *repositoryPtr = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        repositoryPtr = [[self alloc] init:plistPath];
    });
}

-(instancetype)init:(NSString*) plistPath {
    if (self = [super init]) {

        _users = [NSMutableDictionary dictionary];

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
