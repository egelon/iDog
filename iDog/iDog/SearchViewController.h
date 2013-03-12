//
//  SearchViewController.h
//  iDog
//
//  Created by Georgi Sabev on 2/18/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbQuery.h"

@interface SearchViewController : UIViewController <UITextFieldDelegate>
{
	UITextField *idField;
	UITextField *nameField;
	UITextField *areaField;
}

@property (strong, nonatomic) IBOutlet UITextField *idField;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *areaField;
@property (nonatomic, strong) IBOutlet UIButton *searchButton;

- (IBAction)searchButton:(id)sender;

@end
