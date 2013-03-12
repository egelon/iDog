//
//  SearchViewController.m
//  iDog
//
//  Created by Georgi Sabev on 2/18/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import "SearchViewController.h"
#import "WaitViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSON.h"


@implementation SearchViewController

@synthesize idField;
@synthesize nameField;
@synthesize areaField;
@synthesize searchButton;

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
	self.title = @"Search";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
	//release memory
	[self setIdField:nil];
	[self setNameField:nil];
    [self setAreaField:nil];
	[self setSearchButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

//to dismiss the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)searchButton:(id)sender {
	NSMutableString *id;
	NSMutableString *name;
	NSMutableString *area;
	
	if(idField.text)
	{
		id = [[NSMutableString alloc] initWithString:idField.text];
		
	}
	
	if(nameField.text)
	{
		name = [[NSMutableString alloc] initWithString:nameField.text];
	}
	
	if(areaField.text)
	{
		area = [[NSMutableString alloc] initWithString:areaField.text];
		
	}
    // Get device unique ID
	/*
    UIDevice *device = [UIDevice currentDevice];
    NSString *uniqueIdentifier = [device uniqueIdentifier];
	*/
	
	//navigate to next screen
	WaitViewController* waitController = [[WaitViewController alloc] init];
	waitController.id = id;
	waitController.name = name;
	waitController.area = area;
	[self.navigationController pushViewController:waitController animated:YES];
}

@end
