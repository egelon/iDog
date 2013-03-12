//
//  DetailViewController.h
//  iDog
//
//  Created by Georgi Sabev on 2/19/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import "ViewController.h"

@interface DetailViewController : ViewController
{
	NSNumber* myId;
	NSString* timestamp;
	NSNumber* lat;
	NSNumber* lon;
	NSString* name;
	NSString* area;
	NSString* gender;
	NSString* castrated;
	NSString* details;
	NSString* imageURL;
}

@property (strong, nonatomic) IBOutlet NSNumber* myId;
@property (strong, nonatomic) IBOutlet NSString* timestamp;
@property (strong, nonatomic) IBOutlet NSNumber* lat;
@property (strong, nonatomic) IBOutlet NSNumber* lon;
@property (strong, nonatomic) IBOutlet NSString* name;
@property (strong, nonatomic) IBOutlet NSString* area;
@property (strong, nonatomic) IBOutlet NSString* gender;
@property (strong, nonatomic) IBOutlet NSString* castrated;
@property (strong, nonatomic) IBOutlet NSString* details;
@property (strong, nonatomic) IBOutlet NSString* imageURL;

- (IBAction)showOnMapButton:(id)sender;
@end
