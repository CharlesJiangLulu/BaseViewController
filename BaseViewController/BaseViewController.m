//
//  BaseViewController.m
//
//  Created by quwanma_pb on 16/9/1.
//  Copyright © 2016年 quwanma. All rights reserved.
//

#define MainScreenHeight [UIScreen mainScreen].bounds.size.height
#define MainScreenWidth [UIScreen mainScreen].bounds.size.width
#define titleColor [UIColor blackColor]
#define bgColor [UIColor whiteColor]
#define kLineColor [UIColor lightGrayColor]

//判断是否是ios7系统
#define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.f
#define IOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.f
#define IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.f)

#import "BaseViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _isShowing=YES;
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    _isShowing=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= bgColor;
    //字定义导航条
    [self creatNav];
    
}

- (void)creatNav {
    _isShowing=YES;
    self.navigationController.navigationBar.hidden=YES;
    //导航条
    _titleView=[[UIView alloc]init];
    _titleView.backgroundColor = [UIColor redColor];
    _titleView.frame=CGRectMake(0, 0,MainScreenWidth , 44);
    _titleView.backgroundColor=[UIColor colorWithWhite:0.965 alpha:1.000];
    [self.view addSubview:_titleView];
    
    // 导航条底部图片
    UIImageView *imgbV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, 64)];
    imgbV.image = [UIImage imageNamed:@"nav_bg"];
    imgbV.userInteractionEnabled = YES;
    [_titleView addSubview:imgbV];
    
    //导航条底部的线
    _lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 43, MainScreenWidth, 1)];
    _lineView.backgroundColor=kLineColor;
    [_titleView addSubview:_lineView];
    
    //导航条title
    _titleLable=[[UILabel alloc]init];
    [_titleLable setTextColor:titleColor];
    [_titleLable setBackgroundColor:[UIColor clearColor]];
    [_titleLable setTextAlignment:NSTextAlignmentCenter];
    [_titleLable setFont:[UIFont boldSystemFontOfSize:17]];
    _titleLable.frame=CGRectMake(50, 10, MainScreenWidth-100, 33);
    [_titleView addSubview:_titleLable];
    _titleLable.font = [UIFont systemFontOfSize:20];
   
    //导航条左侧按钮
    _leftButton=[[UIButton alloc] init];
    _leftButton.frame=CGRectMake(0, 11, 44, 44);
    [_leftButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    CGFloat leftW= 150;
    if (self.navigationController.viewControllers.count>1) {
        UIImage *theImage=[UIImage imageNamed:@"back"];
        theImage=[theImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_leftButton setImage:theImage forState:UIControlStateNormal];
        [_leftButton setTintColor:[UIColor whiteColor]];
        [_leftButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (self.leftText) {
            [_leftButton setTitle:self.leftText forState:UIControlStateNormal];
            leftW=[self widthByString:self.leftText font:[UIFont systemFontOfSize:18] height:28]+28;
        }else{
            [_leftButton setImage:[UIImage imageNamed:@"back"] forState:(UIControlStateNormal)];
            leftW = 60;
        }
    }
    
    [_titleView addSubview:_leftButton];
    
    //导航条右侧按钮
    _rightButton =[[UIButton alloc]init];
    [_rightButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    _rightButton.frame=CGRectMake(MainScreenWidth-52, 11, 44, 44);
    _rightButton.titleLabel.font=[UIFont systemFontOfSize:17];
    _rightButton.userInteractionEnabled = YES;
//    [_rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_titleView addSubview:_rightButton];
    
    // Do any additional setup after loading the view.
    
    if (IOS7) {
        _titleView.frame=CGRectMake(0, 0, MainScreenWidth, 64);
        _titleLable.frame=CGRectMake(50, 28, MainScreenWidth-100, 28);
        _leftButton.frame=CGRectMake(8, 28, leftW, 28);
        _rightButton.frame=CGRectMake(MainScreenWidth-78, 28, 70, 28);
        _lineView.frame=CGRectMake(0, 63, MainScreenWidth, 1);
    }

}


/**
 *  根据内容和字体大小和宽度返回高度
 */
-(CGFloat)heightByString:(NSString*)text font:(UIFont*)font width:(CGFloat)width{
    NSDictionary *textfont = @{NSFontAttributeName:font};
    CGFloat textHeight=[text boundingRectWithSize:CGSizeMake( width,CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:textfont context:nil].size.height;
    return textHeight;
}

/**
 *  根据内容和字体大小和高度返回宽度
 */
-(CGFloat)widthByString:(NSString*)text font:(UIFont*)font height:(CGFloat)height{
    NSDictionary *textfont = @{NSFontAttributeName:font};
    CGFloat textWidth=[text boundingRectWithSize:CGSizeMake( CGFLOAT_MAX,height) options:NSStringDrawingUsesLineFragmentOrigin attributes:textfont context:nil].size.width;
    return textWidth;
}
-(void)leftButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightButtonClick:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if (self.navigationController) {
        [self.navigationController presentViewController:viewControllerToPresent animated:flag completion:completion];
    }
    else {
        [super presentViewController:viewControllerToPresent animated:flag completion:completion];
    }
}

- (void)showLoading {
}

- (void)showLoadingWithOverlay {
}

- (void)endLoading {
}

- (void)closeKeyboard {
    [self.view endEditing:YES];
}




@end
