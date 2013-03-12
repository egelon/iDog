//
//  DogAnnotation.m
//  iDog
//
//  Created by Georgi Sabev on 2/18/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import "DogAnnotation.h"

@implementation DogAnnotation
@synthesize dogName;
@synthesize dogArea;
@synthesize dog2DCoordinate = _dog2DCoordinate;

- (id)initWithName:(NSString*)name andArea:(NSString*)area andCoordinate:(CLLocationCoordinate2D)coordinate
{
	[super init];
	dogName = name;
	dogArea = area;
	_dog2DCoordinate = coordinate;
	return self;
}


- (NSString *)title
{
    return self.dogName;
}

- (NSString *)subtitle
{
    return self.dogArea;
}

- (CLLocationCoordinate2D)coordinate
{
    return self.dog2DCoordinate;
}

@end
