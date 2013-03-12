//
//  TableViewController.h
//  iDog
//
//  Created by Georgi Sabev on 2/19/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
{
	NSDictionary *responseDict;
	NSArray* keyArray;
}
@property (strong, nonatomic) IBOutlet NSDictionary *responseDict;
@property (strong, nonatomic) IBOutlet NSArray *keyArray;

@end
