//
//  HorseProfileTableViewController.h
//  Nicker
//
//  Created by Ryan Johnson on 11/20/16.
//  Copyright © 2016 johnsonrw82. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPUHorseProfileTableViewController : UITableViewController

// set the list of liked profiles so the user can browse them
-(void)setLikedProfiles:(NSArray*)profiles;

@end
