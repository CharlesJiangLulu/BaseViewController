//
//  BaseViewController.h
//
//  Created by k on 16/6/6.
//  Copyright © 2016年 k. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PBButton.h"

@interface BaseViewController : UIViewController
{
    /** 导航内容*/
    UILabel * _titleLable;
    /**导航左边按钮*/
    UIButton * _rightButton;
    /** 导航右边返回按钮*/
    UIButton * _leftButton;
    /** 导航背景*/
    UIView * _titleView;
    /** 导航最下面线条*/
    UIView *_lineView;
}
/**
 *  如果返回按钮想要加文字，就在这里填写
 */
@property (nonatomic,copy)NSString * leftText;
-(void)leftButtonClick:(id)sender;
-(void)rightButtonClick:(id)sender;

@property (assign, nonatomic) BOOL isShowing;//当前视图是否在显示，小小一个isShowing，你可以拿来判断是否在当前视图来取消或者结束线程
//开始加载
- (void)showLoading;
//加载超时
- (void)showLoadingWithOverlay;
//结束加载
- (void)endLoading;
//收回键盘
- (void)closeKeyboard;



@end
