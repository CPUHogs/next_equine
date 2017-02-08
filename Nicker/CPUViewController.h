//
//  ViewController.h
//  Nicker
//
//  Created by Ryan Johnson on 11/19/16.
//  Copyright © 2016 johnsonrw82. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CPUHorseProfile;
@class CPUViewModel;

@interface CPUViewController : UIViewController

// UI elements
@property (nonatomic) IBOutlet UIButton *skipButton;
@property (nonatomic) IBOutlet UIButton *likeButton;
@property (nonatomic) IBOutlet UIButton *showListButton;
@property (nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) IBOutlet UILabel *locationLabel;
@property (nonatomic) IBOutlet UILabel *priceLabel;
@property (nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) IBOutlet UIView *likeToastView;

@property (nonatomic) CPUViewModel *viewModel;

// update
-(void)updateView;

// IBActions
-(IBAction)likeProfile:(id)sender;
-(IBAction)skipProfile:(id)sender;

// setup methods
-(void)initializeData:(NSArray*)profileData;
-(void)bindViewModel;

@end

