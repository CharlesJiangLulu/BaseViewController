//
//  ViewController2.m
//  BaseViewController
//
//  Created by quwanma_pb on 16/9/1.
//  Copyright © 2016年 quwanma. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏导航条
    [_titleView setHidden:YES];
    //自定义控件
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 200, 44)];
    label.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 22+10);
    label.text=@"第三页";
    label.textAlignment  = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
}






@end
