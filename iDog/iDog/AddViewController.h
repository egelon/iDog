//
//  AddViewController.h
//  iDog
//
//  Created by Georgi Sabev on 2/19/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AddViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>
{
	UITextField *areaField;
	UITextField *nameField;
	UISegmentedControl *genderControl;
	UISegmentedControl *castratedControl;
	UITextField *statusField;
	UITextField *descriptionField;
	
	IBOutlet CLLocationManager *locationManager;
}

@property (strong, nonatomic) IBOutlet UITextField *areaField;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *castratedControl;
@property (strong, nonatomic) IBOutlet UITextField *statusField;
@property (strong, nonatomic) IBOutlet UIImageView *photoImage;
@property (strong, nonatomic) IBOutlet UITextField *descriptionField;

- (IBAction)addButton:(id)sender;

@end
