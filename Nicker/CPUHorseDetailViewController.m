//
//  CPUHorseDetailViewController.m
//  Nicker
//
//  Created by Ryan Johnson on 2/11/17.
//  Copyright © 2017 johnsonrw82. All rights reserved.
//

#import "CPUHorseDetailViewController.h"
#import "CPUHorseDetailViewModel.h"
#import "CPUUtilFunctions.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface CPUHorseDetailViewController ()

-(void) configureViewController;
-(void) bindViewModel;

@end

@implementation CPUHorseDetailViewController

@synthesize scrollView = _scrollView;
@synthesize contentView = _contentView;

-(void)setHorseProfile:(CPUHorseProfile *)profile {
    self.activeProfile = profile;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // this gets rid of the annoying bottom bar hiding scroll view content
    // this might crash on IOS 6 or below -- need to test
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;

    [self configureViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper messages
// set up the view controller such that the view is inside the scroll view
-(void)configureViewController {
    // set up the view model
    self.viewModel = [[CPUHorseDetailViewModel alloc] initWithProfile:_activeProfile];

    // bind the view model
    [self bindViewModel];

    // image view
    // add border to the image view
    self.imageView.layer.masksToBounds = YES;
    [self.imageView.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.imageView.layer setBorderWidth:1.0];
    self.ownerAvatar.layer.masksToBounds = YES;
    [self.ownerAvatar.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.ownerAvatar.layer setBorderWidth:1.0];

    // border on the button
    self.contactSellerButton.layer.masksToBounds = YES;
    [self.contactSellerButton.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.contactSellerButton.layer setBorderWidth:1.0];

    // set up the scroll view
    CGSize size = self.contentView.bounds.size;
    self.contentView.frame = CGRectMake(0, 0, size.width, size.height);
    [self.scrollView addSubview:self.contentView];
    self.scrollView.contentSize = size;

    // If you don't use self.contentView anywhere else, clear it here.
    self.contentView = nil;
}

// bind the view to the view model
-(void) bindViewModel {
    // bind to the labels
    [RACObserve(self.viewModel, name) subscribeNext:^(NSString* value) {
        self.nameLabel.text = value;
    }];
    [RACObserve(self.viewModel, location) subscribeNext:^(NSString* value) {
        self.locationLabel.text = value;
    }];
    [RACObserve(self.viewModel, price) subscribeNext:^(NSString* value) {
        NSMutableString *tmp = [NSMutableString stringWithString:@"$"];
        [tmp appendString:value];
        self.priceLabel.text = tmp;
    }];
    [RACObserve(self.viewModel, gender) subscribeNext:^(NSString* value) {
        self.genderLabel.text = value;
    }];
    [RACObserve(self.viewModel, breed) subscribeNext:^(NSString* value) {
        self.breedLabel.text = value;
    }];
    [RACObserve(self.viewModel, age) subscribeNext:^(NSString* value) {
        self.ageLabel.text = value;
    }];
    [RACObserve(self.viewModel, height) subscribeNext:^(NSString* value) {
        self.heightLabel.text = value;
    }];
    [RACObserve(self.viewModel, color) subscribeNext:^(NSString* value) {
        self.colorLabel.text = value;
    }];

    // load the image
    [RACObserve(self.viewModel, visibleImageName) subscribeNext:^(NSString *value) {
        // load the image
        UIImage* image = [CPUUtilFunctions loadImageResource:value];
        if (image) {
            self.imageView.image = image;
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
