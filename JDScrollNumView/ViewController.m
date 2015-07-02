//
//  ViewController.m
//  JDScrollNumView
//
//  Created by Jay on 15/7/1.
//  Copyright (c) 2015年 ithooks. All rights reserved.
//

#import "ViewController.h"
#import "JDScrollNumView.h"

#define kAllFullSuperviewMask      UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [[UIImage imageNamed:@"bj_numbg"] stretchableImageWithLeftCapWidth:10 topCapHeight:14];
//    self.scrollNumber.backgroundView = [[UIImageView alloc] initWithImage:image];
    
    CGRect tmp = {{0, 0}, {100, 100}};
    UIView *digitBackView = [[UIView alloc] initWithFrame:tmp];
    digitBackView.backgroundColor = [UIColor clearColor];
    digitBackView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    digitBackView.autoresizesSubviews = YES;
    image = [[UIImage imageNamed:@"money_bg"] stretchableImageWithLeftCapWidth:12 topCapHeight:12];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:image];
    bgImageView.frame = tmp;
    bgImageView.autoresizingMask = kAllFullSuperviewMask;
    [digitBackView addSubview:bgImageView];
    image = [[UIImage imageNamed:@"money_bg_mask"] stretchableImageWithLeftCapWidth:12 topCapHeight:12];
    UIImageView *bgMaskImageView = [[UIImageView alloc] initWithImage:image];
    bgMaskImageView.autoresizingMask = kAllFullSuperviewMask;
    bgMaskImageView.frame = tmp;
    [digitBackView addSubview:bgMaskImageView];
    
//    self.scrollNumber.digitBackgroundView = digitBackView;
    self.scrollNumber.numberSize = 8;
    self.scrollNumber.digitColor = [UIColor whiteColor];
    self.scrollNumber.digitFont = [UIFont systemFontOfSize:40.0];
    [self.scrollNumber didConfigFinish];
}

- (void)viewDidUnload
{
    [self setScrollNumber:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)none:(id)sender {
    [self.scrollNumber setNumber:rand() withAnimationType:JDScrollNumAnimationTypeNone animationTime:0.1];
}

- (IBAction)fromZero:(id)sender {
    [self.scrollNumber setNumber:rand() withAnimationType:JDScrollNumAnimationTypeNormal animationTime:0.3];
}

- (IBAction)fromLast:(id)sender {
    [self.scrollNumber setNumber:rand() withAnimationType:JDScrollNumAnimationTypeFromLast animationTime:0.3];
}

- (IBAction)fast:(id)sender {
    [self.scrollNumber setNumber:rand() withAnimationType:JDScrollNumAnimationTypeFast animationTime:0.1];
}

- (IBAction)random:(id)sender {
    [self.scrollNumber setNumber:rand() withAnimationType:JDScrollNumAnimationTypeRand animationTime:3];
}


@end
