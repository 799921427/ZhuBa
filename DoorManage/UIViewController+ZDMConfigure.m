//
//  UIViewController+ZDMConfigure.m
//  DoorManage
//
//  Created by 张德茂 on 2018/3/7.
//  Copyright © 2018年 张德茂. All rights reserved.
//

#import "UIViewController+ZDMConfigure.h"

@implementation UIViewController (ZDMConfigure)

-(void)createTitle:(NSString *)title titleImage:(NSString *)imgStr backImage:(NSString *)leftImg rightImgae:(NSString *)rightImg
{
    NSLog(@"**********");
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    //设置NavigationTitleView
    NSArray * nibView = [[NSBundle mainBundle] loadNibNamed:@"TitleView" owner:nil options:nil];
    UIView *titleModel = [nibView objectAtIndex:0];
    self.navigationItem.titleView = titleModel;
    
    //设置左按钮
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0,30,30)];
    UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5,20, 20)];
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    leftImageView.image = [UIImage imageNamed:leftImg];
    [leftBtn addSubview:leftImageView];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    leftBtn.backgroundColor = [UIColor clearColor];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    [leftBtn sizeToFit];
    
    //设置右按钮
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0,30,30)];
    UIImageView *rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
    rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    rightImageView.image = [UIImage imageNamed:rightImg];
    [rightBtn addSubview:rightImageView];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    rightBtn.backgroundColor = [UIColor clearColor];
    [rightBtn addTarget:self action:@selector(right) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    [rightBtn sizeToFit];
}


-(void)createTitle:(NSString *)title titleImage:(NSString *)imgStr leftImage:(NSString *)leftImg rightImgae:(NSString *)rightImg
{
    NSLog(@"**********");
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    //设置NavigationTitleView
    NSArray * nibView = [[NSBundle mainBundle] loadNibNamed:@"TitleView" owner:nil options:nil];
    UIView *titleModel = [nibView objectAtIndex:0];
    
//    UIView * titleModel = [[UIView alloc] initWithFrame:CGRectZero];
//    UIImageView * titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,45,45)];
//    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    [titleLabel setTextColor:[UIColor blackColor]];
//    titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18.0];
//    [titleLabel setText:title];
//    [titleLabel sizeToFit];
//    titleImage.contentMode = UIViewContentModeScaleAspectFit;
//    titleImage.image = [UIImage imageNamed:imgStr];
//    [titleModel addSubview:titleImage];
//    [titleModel addSubview:titleLabel];

    self.navigationItem.titleView = titleModel;
    
    
    //设置左功能键
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0,30,30)];
    UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5,20, 20)];
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    leftImageView.image = [UIImage imageNamed:leftImg];
    [leftBtn addSubview:leftImageView];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    leftBtn.backgroundColor = [UIColor clearColor];
    [leftBtn addTarget:self action:@selector(left) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    [leftBtn sizeToFit];
   
    
    //设置右功能键
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0,30,30)];
    UIImageView *rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
    rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    rightImageView.image = [UIImage imageNamed:rightImg];
    [rightBtn addSubview:rightImageView];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    rightBtn.backgroundColor = [UIColor clearColor];
    [rightBtn addTarget:self action:@selector(right) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    [rightBtn sizeToFit];
    
}

-(void)left
{
    
}
-(void)right
{
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
