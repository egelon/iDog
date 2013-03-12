//
//  DetailViewController.m
//  iDog
//
//  Created by Georgi Sabev on 2/19/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import "DetailViewController.h"
#import "MapViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *castratedLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet UILabel *latLabel;
@property (weak, nonatomic) IBOutlet UILabel *lonLabel;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;

@end

@implementation DetailViewController

@synthesize myId;
@synthesize timestamp;
@synthesize lat;
@synthesize lon;
@synthesize name;
@synthesize area;
@synthesize gender;
@synthesize castrated;
@synthesize details;
@synthesize imageURL;

@synthesize idLabel;
@synthesize timestampLabel;
@synthesize latLabel;
@synthesize lonLabel;
@synthesize nameLabel;
@synthesize areaLabel;
@synthesize genderLabel;
@synthesize castratedLabel;
@synthesize detailLabel;
@synthesize thumbnailImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidUnload
{
	//release memory
	[self setMyId:nil];
	[self setTimestamp:nil];
	[self setLat:nil];
	[self setLon:nil];
	[self setName:nil];
	[self setArea:nil];
	[self setGender:nil];
	[self setCastrated:nil];
	[self setDetails:nil];
	[self setImageURL:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	idLabel.text = [myId stringValue];
	timestampLabel.text=timestamp;
	latLabel.text=[lat stringValue];
	lonLabel.text=[lon stringValue];
	nameLabel.text = name;
	areaLabel.text = area;
	genderLabel.text = gender;
	castratedLabel.text = castrated;
	detailLabel.text = details;
	
	thumbnailImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
	
	self.title = @"Details";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showOnMapButton:(id)sender
{
	MapViewController* mapController = [[MapViewController alloc] init];
	mapController.dogName = name;
	mapController.dogArea = area;
	mapController.coordLat = self.lat;
	mapController.coordLon = self.lon;
	
	[self.navigationController pushViewController:mapController animated:YES];
}

@end
