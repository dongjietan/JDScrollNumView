//
//  JDScrollDigitView.h
//  JDScrollNumView
//
//  Created by Jay on 15/7/1.
//  Copyright (c) 2015年 ithooks. All rights reserved.
//

#import "JDScrollNumView.h"

#define kRandomLength        10
#define kDefaultDigitFont   [UIFont systemFontOfSize:14.0]

@implementation JDScrollDigitView

@synthesize backgroundView;
@synthesize label;
@synthesize digit;
@synthesize digitFont;

- (void)setDigitAndCommit:(NSUInteger)aDigit {
    self.label.text = [NSString stringWithFormat:@"%d", aDigit];
    CGRect rect = self.label.frame;
    rect.origin.y = 0;
    rect.size.height = _oneDigitHeight;
    self.label.frame = rect;
    digit = aDigit;
}

- (void)setDigit:(NSUInteger)aDigit from:(NSUInteger)last{
    if (aDigit == last) {
        [self setDigitAndCommit:aDigit];
        return;
    }
    
    NSString *str = [NSString stringWithFormat:@"%d", last];
    int count = 1;
    if (aDigit > last) {
        for (int i = last + 1; i < aDigit + 1; ++i) {
            ++count;
            str = [NSString stringWithFormat:@"%d\n%@", i, str];
        }
    }
    else {
        for (int i = last + 1; i < 10; ++i) {
            ++count;
            str = [NSString stringWithFormat:@"%d\n%@", i, str];
        }
        for (int i = 0; i < aDigit + 1; ++i) {
            ++count;
            str = [NSString stringWithFormat:@"%d\n%@", i, str];
        }
    }
    
    self.label.text = str;
    CGRect rect = self.label.frame;
    rect.size.height = _oneDigitHeight * count;
    rect.origin.y = _oneDigitHeight - rect.size.height;
    self.label.frame = rect;
    digit = aDigit;
}

//循环滚动
- (void)setDigit:(NSUInteger)aDigit from:(NSUInteger)last cycle:(NSUInteger)cycle{
    NSString *str = [NSString stringWithFormat:@"%d", last];
    int count = 1;
    for (int j = 0; j < 2; ++j) {
        for (int i = last + 1; i < 10; ++i) {
            ++count;
            str = [NSString stringWithFormat:@"%d\n%@", i, str];
        }
        for (int i = 0; i < last + 1; ++i) {
            ++count;
            str = [NSString stringWithFormat:@"%d\n%@", i, str];
        }
    }
    if (aDigit > last) {
        for (int i = last + 1; i < aDigit + 1; ++i) {
            ++count;
            str = [NSString stringWithFormat:@"%d\n%@", i, str];
        }
    }
    else {
        for (int i = last + 1; i < 10; ++i) {
            ++count;
            str = [NSString stringWithFormat:@"%d\n%@", i, str];
        }
        for (int i = 0; i < aDigit + 1; ++i) {
            ++count;
            str = [NSString stringWithFormat:@"%d\n%@", i, str];
        }
    }
    
    self.label.text = str;
    CGRect rect = self.label.frame;
    rect.size.height = _oneDigitHeight * count;
    rect.origin.y = _oneDigitHeight - rect.size.height;
    self.label.frame = rect;
    digit = aDigit;
}


- (void)setDigitFromLast:(NSUInteger)aDigit {
    [self setDigit:aDigit from:self.digit];
}

- (void)setDigitFast:(NSUInteger)aDigit{
    self.label.text = [NSString stringWithFormat:@"%d\n%d", aDigit, self.digit];
    CGRect rect = self.label.frame;
    rect.size.height = _oneDigitHeight * 2;
    rect.origin.y = _oneDigitHeight - rect.size.height;
    self.label.frame = rect;
    digit = aDigit;
}

- (void)setRandomScrollDigit:(NSUInteger)aDigit length:(NSUInteger)length{
    NSString *str = [NSString stringWithFormat:@"%d", self.digit];
    for (int i = 1; i < length - 1; ++i) {
        str = [NSString stringWithFormat:@"%d\n%@", rand() % 10, str];
    }
    str = [NSString stringWithFormat:@"%d\n%@", aDigit, str];
    self.label.text = str;
    CGRect rect = self.label.frame;
    rect.size.height = _oneDigitHeight * length;
    rect.origin.y = _oneDigitHeight - rect.size.height;
    self.label.frame = rect;
    digit = aDigit;
}

- (void)commitChange{
    CGRect rect = self.label.frame;
    rect.origin.y = 0;
    self.label.frame = rect;
}

- (void)didConfigFinish{
    if (self.backgroundView == nil) {
        self.backgroundView = [[UIView alloc] init];
        self.backgroundView.backgroundColor = [UIColor grayColor];
    }
    CGRect backrect = {{0, 0}, self.frame.size};
    self.backgroundView.frame = backrect;
    [self addSubview:self.backgroundView];
 
    CGSize size = [@"8" sizeWithAttributes:@{NSFontAttributeName: self.digitFont}];
    
    _oneDigitHeight = size.height;
    
    CGRect rect = {{(self.frame.size.width - size.width) / 2, (self.frame.size.height - size.height) / 2}, size};
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor clearColor];
    view.clipsToBounds = YES;
    rect.origin.x = 0;
    rect.origin.y = 0;
    self.label = [[UILabel alloc] initWithFrame:rect];
    self.label.font = self.digitFont;
    self.label.backgroundColor = [UIColor clearColor];
    self.label.numberOfLines = 0;
    [view addSubview:self.label];
    [self addSubview:view];
    [self setDigitAndCommit:self.digit];
}

@end



@implementation JDScrollNumView
@synthesize numberSize;
@synthesize numberValue;
@synthesize backgroundView;
@synthesize numberViews = _numberViews;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initScrollNumView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initScrollNumView];
    }
    return self;
}

- (void)initScrollNumView {
    self.numberSize = 1;
    numberValue = 0;
    self.splitSpaceWidth = 2.0;
    self.topAndBottomPadding = 2.0;
    self.digitFont = kDefaultDigitFont;
    self.randomLength = kRandomLength;
}

- (void)setNumber:(NSUInteger)number withAnimationType:(JDScrollNumAnimationType)type animationTime:(NSTimeInterval)timeSpan {
    for (int i = 0; i < numberSize; ++i) {
        JDScrollDigitView *digitView = [_numberViews objectAtIndex:i];
        NSUInteger digit = [JDScrollNumView digitFromNum:number withIndex:i];
        if (digit != [self digitIndex:i] || type == JDScrollNumAnimationTypeRand)
            switch (type) {
                case JDScrollNumAnimationTypeNone:
                    [digitView setDigit:digit from:digit];
                    break;
                    
                case JDScrollNumAnimationTypeNormal:
                    [digitView setDigit:digit from:0];
                    break;
                case JDScrollNumAnimationTypeFromLast:
                    [digitView setDigitFromLast:digit];
                    break;
                    
                case JDScrollNumAnimationTypeRand:
                    [digitView setRandomScrollDigit:digit length:self.randomLength];
                    break;
                case JDScrollNumAnimationTypeFast:
                    [digitView setDigitFast:digit];
                default:
                    break;
            }
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:timeSpan];
    
    for (JDScrollDigitView *digitView in _numberViews) {
        [digitView commitChange];
    }
    [UIView commitAnimations];
    numberValue = number;
}

- (void)setNumber:(NSUInteger)number animationTime:(NSTimeInterval)timeSpan cycle:(NSUInteger)cycle{
    for (int i = 0; i < numberSize; ++i) {
        JDScrollDigitView *digitView = [_numberViews objectAtIndex:i];
        NSUInteger digit = [JDScrollNumView digitFromNum:number withIndex:i];
        [digitView setDigit:digit from:0 cycle:cycle];
        
        NSTimeInterval delayTime = 0.5f * (numberSize - i - 1);
        [UIView animateKeyframesWithDuration:timeSpan delay:delayTime options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^(void){
            [digitView commitChange];
        } completion:^(BOOL finished){
            if (i == numberSize - 1) {
                numberValue = number;
            }
        }];
    }
}

+ (NSUInteger)digitFromNum:(NSUInteger)number withIndex:(NSUInteger)index {
    NSUInteger num = number;
    for (int i = 0; i < index; ++i) {
        num /= 10;
    }
    
    return num % 10;
}

- (NSUInteger)digitIndex:(NSUInteger)index {
    return [JDScrollNumView digitFromNum:self.numberValue withIndex:index];
}

- (void)didConfigFinish {
    CGRect backRect = {{0, 0}, self.frame.size};
    self.backgroundView.frame = backRect;
    [self addSubview:self.backgroundView];
    _numberViews = [[NSMutableArray alloc] initWithCapacity:self.numberSize];
    CGFloat allWidth = self.frame.size.width;
    CGFloat digitWidth = (allWidth - (self.numberSize + 1) * self.splitSpaceWidth) / self.numberSize;
    NSData *digitBackgroundViewData = [NSKeyedArchiver archivedDataWithRootObject:self.digitBackgroundView];
    for (int i = 0; i < numberSize; ++i) {
        CGRect rect = {{allWidth - (digitWidth + self.splitSpaceWidth) * (i + 1), self.topAndBottomPadding}, {digitWidth, self.frame.size.height - self.topAndBottomPadding * 2}};
        
        JDScrollDigitView *digitView = [[JDScrollDigitView alloc] initWithFrame:rect];
        digitView.backgroundView = [NSKeyedUnarchiver unarchiveObjectWithData:digitBackgroundViewData];
        digitView.digitFont = self.digitFont;
        [digitView didConfigFinish];
        [digitView setDigitAndCommit:[self digitIndex:i]];
        if (self.digitColor != nil) {
            digitView.label.textColor = self.digitColor;
        }
        [_numberViews addObject:digitView];
        [self addSubview:digitView];
    }
}
@end
