//
//  WaitViewController.h
//  iDog
//
//  Created by Georgi on 2/18/13.
//  Copyright (c) 2013 Georgi Sabev. All rights reserved.
//

#import "ViewController.h"

@interface WaitViewController : ViewController
{
	UITextField *textView;
	NSMutableString *id;
	NSMutableString *name;
	NSMutableString *area;
}
@property (strong, nonatomic) IBOutlet UITextField *textView;
@property (strong, nonatomic) IBOutlet NSMutableString *id;
@property (strong, nonatomic) IBOutlet NSMutableString *name;
@property (strong, nonatomic) IBOutlet NSMutableString *area;


@end
