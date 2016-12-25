//
//  ViewController.m
//  Nicker
//
//  Created by Ryan Johnson on 11/19/16.
//  Copyright © 2016 johnsonrw82. All rights reserved.
//

#import "CPUViewController.h"
#import "CPUViewModel.h"
#import "HorseProfileTableViewController.h"

@interface CPUViewController() {
    CPUViewModel *viewModel;
    NSArray *initProfileData;
}

@end

@implementation CPUViewController

#pragma mark - Setup methods
-(void)initializeData:(NSArray*)profileData {
    initProfileData = [NSArray arrayWithArray:profileData];
}

#pragma mark - Action methods
-(IBAction)likeProfile:(id)sender {
    self.likeToastView.alpha = 0.0f;
    self.likeToastView.hidden = NO;
    [viewModel likeProfile];

}

-(IBAction)skipProfile:(id)sender {
    [viewModel skipProfile];
}

-(void)updateView {
    // bind the UI elements
    self.nameLabel.text = viewModel.nameLabelString;
    self.priceLabel.text = viewModel.priceLabelString;
    self.locationLabel.text = viewModel.locationLabelString;

    // visible image
    self.imageView.image = viewModel.visibleImage;
}

#pragma mark - Delegate callback methods
- (void)viewDidLoad {
    [super viewDidLoad];

    // init the view model object for this controller
    viewModel = [[CPUViewModel alloc] initWithData:initProfileData];
    viewModel.controller = self;

    // add border to the image view
    self.imageView.layer.masksToBounds = YES;
    [self.imageView.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.imageView.layer setBorderWidth:1.0];

    // show the next profile
    [viewModel showNextProfile];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    [(HorseProfileTableViewController*)[segue destinationViewController] setLikedProfiles:viewModel.likedProfiles];
}

@end
