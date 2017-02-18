//
//  CPUHorseDetailViewController.h
//  Nicker
//
//  Created by Ryan Johnson on 2/11/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPUHorseDetailViewModel;
@class CPUHorseProfile;

@interface CPUHorseDetailViewController : UIViewController

// profile being displayed
@property (nonatomic) CPUHorseProfile *activeProfile;

// view outlets
@property (nonatomic,weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic) IBOutlet UIView *contentView;
// view elements
@property (nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) IBOutlet UILabel *priceLabel;
@property (nonatomic) IBOutlet UILabel *locationLabel;
@property (nonatomic) IBOutlet UILabel *ageLabel;
@property (nonatomic) IBOutlet UILabel *genderLabel;
@property (nonatomic) IBOutlet UILabel *heightLabel;
@property (nonatomic) IBOutlet UILabel *breedLabel;
@property (nonatomic) IBOutlet UILabel *colorLabel;
@property (nonatomic) IBOutlet UITextView *disciplinesTextView;
@property (nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) IBOutlet UIImageView *ownerAvatar;
@property (nonatomic) IBOutlet UIButton *contactSellerButton;

// view model
@property (nonatomic) CPUHorseDetailViewModel *viewModel;

// set the profile on this view controller
-(void)setHorseProfile:(CPUHorseProfile*)profile;

@end
