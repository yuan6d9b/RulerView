//
//  CYScrollRulerView.m
//  CYRulerView
//
//  Created by zdjt on 2018/7/9.
//  Copyright © 2018年 zdjt. All rights reserved.
//

#import "CYScrollRulerView.h"

@interface CYScrollRulerView () <UIScrollViewDelegate>

@property (weak, nonatomic) UIScrollView *scrollView;

@end

#define SeparatorWidth 1.f // 指针宽度

@implementation CYScrollRulerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupChildViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupChildViews];
    }
    return self;
}

- (void)setupChildViews
{
    // 1.创建滚动
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    self.scrollView = scrollView;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    [self addSubview:scrollView];
    
    // 2.创建刻度
    // MaxValue/10000(10000为每个大刻度数值) 一共有多少个大刻度 每个大刻度有10个小刻度,每个小刻度长度Margin
    CGFloat contentWidth = self.bounds.size.width + MaxValue / MaxInterval * Margin * 10;
    CGFloat contentHeight = self.bounds.size.height;
    CYRulerView *fulerView = [[CYRulerView alloc] initWithFrame:CGRectMake(0, 0, contentWidth, contentHeight)];
    scrollView.contentSize = CGSizeMake(contentWidth, contentHeight);
    [scrollView addSubview:fulerView];
    
    // 3.创建中间指针
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.size.width * 0.5f - SeparatorWidth * 0.5, 0.f, SeparatorWidth, contentHeight - BottomLineHeight)];
    separator.backgroundColor = [UIColor redColor];
    [self addSubview:separator];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self calcValue:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate) return;
    [self calcValue:scrollView];
}


/**
 计算刻度停靠的位置

 @param scrollView 滚动视图
 */
- (void)calcValue:(UIScrollView *)scrollView
{
    int num = round(scrollView.contentOffset.x / Margin);
    [scrollView setContentOffset:CGPointMake(num * Margin, 0) animated:YES];
    NSString *value = [NSString stringWithFormat:@"%d", num * MinInterval];
    if (self.valueBlock) self.valueBlock(value);
}


/**
 刻度停靠在某个数值

 @param value 需要停靠位置的数值
 */
- (void)scrollToValue:(int)value
{
    [self.scrollView setContentOffset:CGPointMake(value / MinInterval * Margin, 0) animated:YES];
    if (self.valueBlock) self.valueBlock([NSString stringWithFormat:@"%d", value]);
}

@end
