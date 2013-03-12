//
//  dbQuery.h
//  iDog
//
//  Created by Georgi Sabev on 2/18/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dbQuery : NSObject
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSDate *dateAdded;
@end
