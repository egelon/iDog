//
//  AddViewController.m
//  iDog
//
//  Created by Georgi Sabev on 2/19/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import "AddViewController.h"
#import "ViewController.h"

#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSON.h"

#import "MBProgressHUD.h"

@implementation AddViewController

@synthesize areaField;
@synthesize nameField;
@synthesize genderControl;
@synthesize castratedControl;
@synthesize statusField;
@synthesize descriptionField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	self.title = @"Add a new dog";
	
	//start listening to for my GPS location
	locationManager = [[CLLocationManager alloc] init];
	locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
	locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
	[locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//to dismiss the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidUnload
{
	//release memory
    [self setAreaField:nil];
	[self setNameField:nil];
	[self setGenderControl:nil];
	[self setCastratedControl:nil];
	[self setStatusField:nil];
	[self setDescriptionField:nil];
	
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)addPhotoButton:(id)sender {
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose Picture" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Choose From Gallery", @"Take Picture", nil];
        [actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
    }else{
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose Picture" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Choose From Gallery", nil];
        [actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        [actionSheet dismissWithClickedButtonIndex:-1 animated:YES];
    }else {
        [self addPictureWithTypeOfSource:buttonIndex];
    }
}

- (void)addPictureWithTypeOfSource:(int)sourceType{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    if(sourceType == 0){
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }else if(sourceType == 1){
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
    }
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!image) {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
	
    self.photoImage.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addButton:(id)sender {
	NSString* lat = [NSString stringWithFormat:@"%f", locationManager.location.coordinate.latitude];
	NSString* lon = [NSString stringWithFormat:@"%f", locationManager.location.coordinate.longitude];
	
	
	//populate the insert request data in the POST body
	
	NSURL *url = [NSURL URLWithString:@"http://geocashe.netau.net"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
	[request setPostValue:@"dobavqne" forKey:@"requestType"];
	
    [request setPostValue:areaField.text forKey:@"area"];
	
	[request setPostValue:lat forKey:@"geoLatitude"];
	[request setPostValue:lon forKey:@"geoLongitude"];
	
    

	if(genderControl.selectedSegmentIndex == 0)
		[request setPostValue:@"M" forKey:@"gender"];
	else
		[request setPostValue:@"F" forKey:@"gender"];
	
	switch(castratedControl.selectedSegmentIndex)
	{
		case 0:
			[request setPostValue:@"1" forKey:@"castrated"];
			break;
		case 1:
			[request setPostValue:@"0" forKey:@"castrated"];
			break;
	}
	
	[request setPostValue:descriptionField.text forKey:@"description"];
	[request setPostValue:nameField.text forKey:@"name"];
	
	
	
	//ADD THE PHOTO
	if(self.photoImage.image == nil)
	{
		[request setPostValue:@"" forKey:@"picture"];
	}
	else
	{
		[request setPostValue:@"true" forKey:@"picture"];
		
		NSData *imageData = UIImageJPEGRepresentation(self.photoImage.image, 0.7);
		[request setData:imageData withFileName:@"myphoto.jpg" andContentType:@"image/jpeg" forKey:@"file"];
	}
	
    [request setDelegate:self];
    [request startAsynchronous];
	
	NSLog(@"%@",[request debugDescription]);
	
	//show the request HUD
	MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
	hud.labelText = @"Connecting to database";
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
	//hide the HUD
	[MBProgressHUD hideHUDForView:self.view animated:YES];
    
	if (request.responseStatusCode == 400)
	{
		UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Database error 400"
														  message:@"The database refused the request. Try again later"
														 delegate:self
												cancelButtonTitle:@"OK"
												otherButtonTitles:nil];
		[message show];
    }
	else if (request.responseStatusCode == 403)
	{
		UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Database error 403"
														  message:@"Forbidden access to the database. Try again later."
														 delegate:self
												cancelButtonTitle:@"OK"
												otherButtonTitles:nil];
		[message show];
    }
	else if (request.responseStatusCode == 200)
	{
		UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Success!"
														  message:@"New dog sucessfully added to the database."
														 delegate:self
												cancelButtonTitle:@"OK"
												otherButtonTitles:nil];
		[message show];
    }
	else
	{
		UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Unexpected error"
														  message:@"Something went wrong :("
														 delegate:self
												cancelButtonTitle:@"OK"
												otherButtonTitles:nil];
		[message show];
    }
	
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
	//hide the HUD
	[MBProgressHUD hideHUDForView:self.view animated:YES];
    
	NSError *error = [request error];
	
	UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Request failed"
													  message:error.localizedDescription
													 delegate:self
											cancelButtonTitle:@"OK"
											otherButtonTitles:nil];
	[message show];
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"OK"])
    {
        //NSLog(@"Button 1 was selected.");
		[self.navigationController popViewControllerAnimated:YES];
    }
}

@end
