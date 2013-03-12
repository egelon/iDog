//
//  DogAnnotation.h
//  iDog
//
//  Created by Georgi Sabev on 2/18/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface DogAnnotation : NSObject <MKAnnotation>
{
	NSString *dogName;
	NSString *dogArea;
}

@property (nonatomic, copy) NSString *dogName;
@property (nonatomic, copy) NSString *dogArea;
@property (nonatomic, readonly) CLLocationCoordinate2D dog2DCoordinate;

- (id)initWithName:(NSString*)name andArea:(NSString*)area andCoordinate:(CLLocationCoordinate2D)coordinate;

@end
