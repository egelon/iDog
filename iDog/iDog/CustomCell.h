//
//  CustomCell.h
//  iDog
//
//  Created by Georgi Sabev on 2/19/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *areaLabel;
@property (nonatomic, weak) IBOutlet UILabel *genderLabel;
@property (nonatomic, weak) IBOutlet UILabel *castratedLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@end
