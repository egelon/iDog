//
//  DogDBItem.h
//  iDog
//
//  Created by Georgi Sabev on 2/18/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DogDBItem : NSObject

@property (nonatomic, strong) NSNumber *DB_id;
@property (nonatomic, strong) NSDate *DB_timestamp;

@property (nonatomic, strong) NSDate *timestamp_Start;
@property (nonatomic, strong) NSDate *timestamp_End;

@property (nonatomic, strong) NSMutableString *DB_area;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSMutableString *DB_name;
@property (nonatomic, strong) NSMutableString *DB_gender;
@property (nonatomic, strong) NSNumber *DB_castrated;
@property (nonatomic, strong) NSMutableString *DB_description;
@property (nonatomic, strong) NSData *DB_image;

@end
