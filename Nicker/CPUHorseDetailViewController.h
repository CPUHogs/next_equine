//
//  CPUHorseDetailViewController.h
//  Nicker
//
//  Created by Ryan Johnson on 2/11/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPUHorseProfile;

@interface CPUHorseDetailViewController : UIViewController

@property (nonatomic) CPUHorseProfile *activeProfile;

-(void)setHorseProfile:(CPUHorseProfile*)profile;

@end
