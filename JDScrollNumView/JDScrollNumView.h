//
//  JDScrollDigitView.h
//  JDScrollNumView
//
//  Created by Jay on 15/7/1.
//  Copyright (c) 2015年 ithooks. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,JDScrollNumAnimationType){
    JDScrollNumAnimationTypeNone,
    JDScrollNumAnimationTypeNormal,
    JDScrollNumAnimationTypeFromLast,
    JDScrollNumAnimationTypeRand,
    JDScrollNumAnimationTypeFast
};

@interface JDScrollDigitView : UIView {
    CGFloat _oneDigitHeight;
}

@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) UILabel *label;
@property (readonly, nonatomic) NSUInteger digit;
@property (strong, nonatomic) UIFont *digitFont;

- (void)setDigitAndCommit:(NSUInteger)aDigit;
- (void)setDigitFromLast:(NSUInteger)aDigit;
- (void)setDigit:(NSUInteger)aDigit from:(NSUInteger)last;
- (void)setDigitFast:(NSUInteger)aDigit;
- (void)setRandomScrollDigit:(NSUInteger)aDigit length:(NSUInteger)length;

- (void)commitChange;

- (void)didConfigFinish;

@end

@interface JDScrollNumView : UIView {
    NSMutableArray *_numberViews;
}

@property (nonatomic) NSUInteger numberSize;
@property (nonatomic) CGFloat splitSpaceWidth;
@property (nonatomic) CGFloat topAndBottomPadding;
@property (readonly, nonatomic) NSUInteger numberValue;
@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) UIView *digitBackgroundView;
@property (strong, nonatomic) UIFont *digitFont;
@property (readonly, nonatomic) NSArray *numberViews;
@property (strong, nonatomic) UIColor *digitColor;
@property (nonatomic) NSUInteger randomLength;
- (void)setNumber:(NSUInteger)number withAnimationType:(JDScrollNumAnimationType)type animationTime:(NSTimeInterval)timeSpan;

- (void)didConfigFinish;
@end
