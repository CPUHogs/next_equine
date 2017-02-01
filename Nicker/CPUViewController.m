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

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface CPUViewController() {
    NSArray *initProfileData;
}

@end

@implementation CPUViewController

#pragma mark - Setup methods
-(void)initializeData:(NSArray*)profileData {
    initProfileData = [NSArray arrayWithArray:profileData];
}

-(void)bindViewModel {
    [RACObserve(self.viewModel,nameLabelString) subscribeNext:^(NSString* value) {
        self.nameLabel.text = value;
    }];
    [RACObserve(self.viewModel,priceLabelString) subscribeNext:^(NSString* value) {
        self.priceLabel.text = value;
    }];
    [RACObserve(self.viewModel,locationLabelString) subscribeNext:^(NSString* value) {
        self.locationLabel.text = value;
    }];
}

#pragma mark - Action methods
-(IBAction)likeProfile:(id)sender {
    self.likeToastView.alpha = 0.0f;
    self.likeToastView.hidden = NO;
    [self.viewModel likeProfile];

}

-(IBAction)skipProfile:(id)sender {
    [self.viewModel skipProfile];
}

-(void)updateView {
    // bind the UI elements
    //self.nameLabel.text = self.viewModel.nameLabelString;
    //self.priceLabel.text = self.viewModel.priceLabelString;
    //self.locationLabel.text = self.viewModel.locationLabelString;

    // visible image
    self.imageView.image = self.viewModel.visibleImage;
}

#pragma mark - Delegate callback methods
- (void)viewDidLoad {
    [super viewDidLoad];

    // init the view model object for this controller
    self.viewModel = [[CPUViewModel alloc] initWithData:initProfileData];
    self.viewModel.controller = self;

    // add border to the image view
    self.imageView.layer.masksToBounds = YES;
    [self.imageView.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.imageView.layer setBorderWidth:1.0];

    // bind the view model
    [self bindViewModel];

    // show the next profile
    [self.viewModel showNextProfile];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    [(HorseProfileTableViewController*)[segue destinationViewController] setLikedProfiles:self.viewModel.likedProfiles];
}

@end
