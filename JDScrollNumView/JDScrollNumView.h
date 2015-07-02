//
//  JDScrollDigitView.h
//  JDScrollNumView
//
//  Created by Jay on 15/7/1.
//  Copyright (c) 2015年 ithooks. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JDScrollNumViewDelegate <NSObject>
- (void)animationFinished;
@end

typedef NS_ENUM(NSInteger,JDScrollNumAnimationType){
    JDScrollNumAnimationTypeNone,
    JDScrollNumAnimationTypeNormal,
    JDScrollNumAnimationTypeFromLast,
    JDScrollNumAnimationTypeRand,
    JDScrollNumAnimationTypeFast,
    JDScrollNumAnimationTypeCycleInTurn,
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
    NSMutableArray *_numberViews;   //号码数组
}

@property (nonatomic) NSUInteger numberSize;    //号码位数
@property (nonatomic) CGFloat splitSpaceWidth;  //水平间距
@property (nonatomic) CGFloat topAndBottomPadding; //上下padding
@property (readonly, nonatomic) NSUInteger numberValue;
@property (strong, nonatomic) UIView *backgroundView;       //背景
@property (strong, nonatomic) UIView *digitBackgroundView;  //数字背景
@property (strong, nonatomic) UIFont *digitFont;    //号码字体
@property (readonly, nonatomic) NSArray *numberViews;
@property (strong, nonatomic) UIColor *digitColor;  //号码颜色
@property (nonatomic) NSUInteger randomLength;
@property (nonatomic, weak) id<JDScrollNumViewDelegate> delegate;

- (void)setNumber:(NSUInteger)number withAnimationType:(JDScrollNumAnimationType)type animationTime:(NSTimeInterval)timeSpan;
- (void)setNumber:(NSUInteger)number animationTime:(NSTimeInterval)timeSpan cycle:(NSUInteger)cycle;
- (void)didConfigFinish;
@end
