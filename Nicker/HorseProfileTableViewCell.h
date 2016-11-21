//
//  HorseProfileTableCellTableViewCell.h
//  Nicker
//
//  Created by Ryan Johnson on 11/20/16.
//  Copyright © 2016 johnsonrw82. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorseProfileTableCellTableViewCell : UITableViewCell

@property (nonatomic) IBOutlet UIImageView *thumbnail;
@property (nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) IBOutlet UILabel *locationLabel;
@property (nonatomic) IBOutlet UILabel *priceLabel;

@end
