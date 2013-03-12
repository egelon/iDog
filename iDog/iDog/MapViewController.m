//
//  MapViewController.m
//  iDog
//
//  Created by Georgi on 2/19/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import "MapViewController.h"
#import "DogAnnotation.h"

@implementation MapViewController

@synthesize myID;
@synthesize dogName;
@synthesize dogArea;
@synthesize coordLat;
@synthesize coordLon;

@synthesize mapView;

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
	self.title = @"Dog location";
	
	CLLocationCoordinate2D location;
	location.latitude = (CLLocationDegrees)[coordLat doubleValue];
	location.longitude = (CLLocationDegrees)[coordLon doubleValue];
	
	//NSLog(@"%@",location.latitude);
	
	// Add the annotation to our map view
	DogAnnotation *newAnnotation = [[DogAnnotation alloc] initWithName:dogName andArea:dogArea andCoordinate:location];
	
	
	
	[self.mapView addAnnotation:newAnnotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    static NSString *identifier = @"DogAnnotation";
    if ([annotation isKindOfClass:[DogAnnotation class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        //UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        //annotationView.rightCalloutAccessoryView = detailButton;
        
        annotationView.pinColor = MKPinAnnotationColorPurple;
        
        return annotationView;
    }
    
    return nil;
}


// When a map annotation point is added, zoom to it (1500 range)
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
	CLLocationCoordinate2D location;
	location.latitude = (CLLocationDegrees)[coordLat doubleValue];
	location.longitude = (CLLocationDegrees)[coordLon doubleValue];
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 1500, 1500);
	[mv setRegion:region animated:YES];
}


@end
