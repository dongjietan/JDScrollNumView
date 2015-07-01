//
//  ViewController.h
//  JDScrollNumView
//
//  Created by Jay on 15/7/1.
//  Copyright (c) 2015年 ithooks. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDScrollNumView;
@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet JDScrollNumView *scrollNumber;

- (IBAction)none:(id)sender;
- (IBAction)fromZero:(id)sender;
- (IBAction)fromLast:(id)sender;
- (IBAction)fast:(id)sender;
- (IBAction)random:(id)sender;

@end

