//
//  CPUViewModel.h
//  Nicker
//
//  Created by Ryan Johnson on 11/20/16.
//  Copyright © 2016 johnsonrw82. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class CPUHorseProfile;
@class CPUViewController;

@interface CPUViewModel : NSObject

// list of horse profiles
@property (nonatomic, copy) NSArray *horseProfiles;
@property (nonatomic) NSMutableArray *likedProfiles;
@property (nonatomic) NSString *nameLabelString;
@property (nonatomic) NSString *locationLabelString;
@property (nonatomic) NSString *priceLabelString;
@property (nonatomic) NSString *visibleImageName;

// init methods
-(instancetype)initWithData:(NSArray*)profileData;

// methods to add/remove profiles
-(void)addHorseProfile:(CPUHorseProfile*)profile;
-(void)removeHorseProfile:(CPUHorseProfile*)profile;

// handler methods
-(void)likeProfile;
-(void)skipProfile;

// helpers
-(void)showNextProfile;

@end
