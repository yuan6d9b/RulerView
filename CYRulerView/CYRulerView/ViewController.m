//
//  ViewController.m
//  CYRulerView
//
//  Created by zdjt on 2018/7/18.
//  Copyright © 2018年 zdjt. All rights reserved.
//

#import "ViewController.h"
#import "CYScrollRulerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.创建
    CYScrollRulerView *view = [[CYScrollRulerView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50.f)];
    // 2.有刻度值的处理
    view.valueBlock = ^(NSString *value) {
        NSLog(@"-----%@", value);
    };
    // 3.设置初始停靠的位置(optional),必须加到block后,否则取不到值
    [view scrollToValue:15000];
    // 4.加到父视图
    [self.view addSubview:view];
}


@end
