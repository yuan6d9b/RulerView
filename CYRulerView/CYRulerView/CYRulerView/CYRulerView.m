//
//  CYRulerView.m
//  CYRulerView
//
//  Created by zdjt on 2018/7/9.
//  Copyright © 2018年 zdjt. All rights reserved.
//

#import "CYRulerView.h"

@interface CYRulerView ()

@end

@implementation CYRulerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawBottomLine];
        [self drawScale];
        [self drawValue];
    }
    return self;
}


/**
 绘制x轴
 */
- (void)drawBottomLine
{
    UIBezierPath *line = [UIBezierPath bezierPath];
    [line moveToPoint:CGPointMake(0, self.bounds.size.height - BottomLineHeight * 0.5f)];
    [line addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height - BottomLineHeight * 0.5f)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.path = line.CGPath;
    layer.lineWidth = BottomLineHeight;
    [self.layer addSublayer:layer];
}

/**
 绘制x轴刻度
 */
- (void)drawScale
{
    for (int i = 0; i < (MaxValue / MinInterval + 1) ; i++) {
        UIBezierPath *line = [UIBezierPath bezierPath];
        [line moveToPoint:CGPointMake(i * Margin + CGRectGetWidth([UIScreen mainScreen].bounds) * 0.5f, self.bounds.size.height - BottomLineHeight)];
        if (i % 10 == 0) {
            [line addLineToPoint:CGPointMake(i * Margin + CGRectGetWidth([UIScreen mainScreen].bounds) * 0.5f, self.bounds.size.height - BottomLineHeight - LongLineHeight)];
        }else {
            [line addLineToPoint:CGPointMake(i * Margin + CGRectGetWidth([UIScreen mainScreen].bounds) * 0.5f, self.bounds.size.height - BottomLineHeight - LongLineHeight * 0.5f)];
        }
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.strokeColor = [UIColor blackColor].CGColor;
        layer.path = line.CGPath;
        layer.lineWidth = ScaleWidth;
        [self.layer addSublayer:layer];
    }
}

#define Space 5.f // 数值到刻度线的距离
#define ValueLabelWidth 60.f // 数值到刻度线的距离
#define ValueLabelHeight 20.f // 数值到刻度线的距离

/**
 绘制x轴刻度值
 */
- (void)drawValue
{
    for (int i = 0; i < (MaxValue / MinInterval + 1); i++) {
        if (i % 10 == 0) {
            UILabel *valueLabel = [[UILabel alloc] init];
            valueLabel.frame = CGRectMake(i * Margin + CGRectGetWidth([UIScreen mainScreen].bounds) * 0.5f - ValueLabelWidth * 0.5f , self.bounds.size.height - BottomLineHeight - LongLineHeight - Space - ValueLabelHeight , ValueLabelWidth, ValueLabelHeight);
            valueLabel.text = [NSString stringWithFormat:@"%d", i * MinInterval];
            valueLabel.textAlignment = NSTextAlignmentCenter;
            valueLabel.font = [UIFont systemFontOfSize:12.f];
            valueLabel.textColor = [UIColor blackColor];
            [self addSubview:valueLabel];
        }
    }
}

@end
