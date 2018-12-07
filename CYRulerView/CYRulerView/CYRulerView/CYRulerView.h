//
//  CYRulerView.h
//  CYRulerView
//
//  Created by zdjt on 2018/7/9.
//  Copyright © 2018年 zdjt. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BottomLineHeight 1.f // 横轴高度

#define ScaleWidth 1.f // 刻度宽度

#define LongLineHeight 10.f // 长刻度高度

#define Margin 8.f // 刻度间隔

#define MinInterval 1000 // 每个小刻度值

#define MaxInterval (10 * MinInterval) // 大刻度值(由10个小刻度构成)

#define MaxValue 100000 // 显示的最大值

@interface CYRulerView : UIView

@end
