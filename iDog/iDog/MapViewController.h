//
//  MapViewController.h
//  iDog
//
//  Created by Georgi on 2/19/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
{
	MKMapView *mapView;
}

@property (nonatomic, strong) NSString *dogName;
@property (nonatomic, strong) NSString *myID;
@property (nonatomic, strong) NSString *dogArea;
@property (nonatomic, strong) NSNumber* coordLat;
@property (nonatomic, strong) NSNumber* coordLon;

@property(nonatomic, retain) IBOutlet MKMapView *mapView;

@end
