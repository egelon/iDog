//
//  ViewController.m
//  iDog
//
//  Created by Georgi Sabev on 2/18/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import "ViewController.h"
#import "InfoViewController.h"
#import "SearchViewController.h"
#import "AddViewController.h"

@implementation ViewController

@synthesize addButton;
@synthesize searchButton;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self action:@selector(infoButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *infoItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    
    [self.navigationItem setRightBarButtonItem:infoItem];
    
    self.title = @"iDog";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
	//release memory
    [self setAddButton:nil];
	[self setSearchButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (IBAction)addButton:(id)sender {
	
	AddViewController* addController = [[AddViewController alloc] init];
	[self.navigationController pushViewController:addController animated:YES];	 
}

- (IBAction)searchButton:(id)sender
{
	SearchViewController* searchController = [[SearchViewController alloc] init];
	[self.navigationController pushViewController:searchController animated:YES];
	 
}

- (IBAction)infoButtonAction:(id)sender {
    InfoViewController* infoController = [[InfoViewController alloc] init];
	[self.navigationController pushViewController:infoController animated:YES];
}
@end
