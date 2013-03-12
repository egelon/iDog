//
//  ViewController.h
//  iDog
//
//  Created by Georgi Sabev on 2/18/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
	UIButton *addButton;
	UIButton *searchButton;
}

@property (nonatomic, strong) IBOutlet UIButton *addButton;
@property (nonatomic, strong) IBOutlet UIButton *searchButton;

- (IBAction)infoButtonAction:(id)sender;

- (IBAction)addButton:(id)sender;
- (IBAction)searchButton:(id)sender;

@end
