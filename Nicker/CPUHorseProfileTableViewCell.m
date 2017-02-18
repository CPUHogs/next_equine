//
//  HorseProfileTableCellTableViewCell.m
//  Nicker
//
//  Created by Ryan Johnson on 11/20/16.
//  Copyright © 2016 johnsonrw82. All rights reserved.
//

#import "CPUHorseProfile.h"
#import "CPUHorseProfileTableViewCell.h"
#import "CPUUtilFunctions.h"

@implementation CPUHorseProfileTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Setup

-(void)fromHorseProfile:(CPUHorseProfile *)profile {
    // set the source profile object
    _profileObject = [[CPUHorseProfile alloc] initWithProfile:profile];

    self.nameLabel.text = profile.name;
    self.locationLabel.text = profile.location;
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f", profile.price];
    // look up the image
    UIImage* image = [CPUUtilFunctions loadImageResource:profile.imageName];

    CGFloat scale = [[UIScreen mainScreen]scale];
    CGSize newSize = CGSizeMake(83.0, 83.0);
    /*You can remove the below comment if you dont want to scale the image in retina   device .Dont forget to comment UIGraphicsBeginImageContextWithOptions*/
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);

    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    self.imageView.image = resizedImage;
}

@end
