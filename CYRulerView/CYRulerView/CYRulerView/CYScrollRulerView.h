//
//  CYScrollRulerView.h
//  CYRulerView
//
//  Created by zdjt on 2018/7/9.
//  Copyright © 2018年 zdjt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYRulerView.h"

@interface CYScrollRulerView : UIView

@property (copy, nonatomic) void(^valueBlock)(NSString *value);

- (void)scrollToValue:(int)value;

@end
