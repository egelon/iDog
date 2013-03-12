//
//  WaitViewController.m
//  iDog
//
//  Created by Georgi on 2/18/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import "WaitViewController.h"
#import "TableViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSON.h"

#import "MBProgressHUD.h"


@implementation WaitViewController

@synthesize textView;
@synthesize id;
@synthesize name;
@synthesize area;

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
	self.title = @"Executing request";
	
	
	NSURL *url = [NSURL URLWithString:@"http://geocashe.netau.net"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
	[request setPostValue:@"tursene" forKey:@"requestType"];
    [request setPostValue:id forKey:@"id"];
    [request setPostValue:name forKey:@"name"];
    [request setPostValue:area forKey:@"area"];
	
	
    [request setDelegate:self];
    [request startAsynchronous];
	
	//show the request HUD
	MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
	hud.labelText = @"Connecting to database";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
	//release memory
	[self setId:nil];
	[self setName:nil];
	[self setArea:nil];
	[self setTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
	//hide the HUD
	[MBProgressHUD hideHUDForView:self.view animated:YES];
    
	if (request.responseStatusCode == 400)
	{
        textView.text = @"Invalid id";
    }
	else if (request.responseStatusCode == 403)
	{
        textView.text = @"Forbidden access to this id";
    }
	else if (request.responseStatusCode == 200)
	{
		textView.text = @"200 - OK";
		
        NSString *responseString = [request responseString];
        NSArray *responseDict = [responseString JSONValue];
		NSLog(@"%@",responseDict);
		
		TableViewController* tableController = [[TableViewController alloc] init];
		tableController.keyArray = responseDict;
		[self.navigationController pushViewController:tableController animated:YES];
		
    }
	else
	{
        textView.text = @"Unexpected error";
    }
	
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
	//hide the HUD
	[MBProgressHUD hideHUDForView:self.view animated:YES];
    
	NSError *error = [request error];
    textView.text = error.localizedDescription;
}


@end
