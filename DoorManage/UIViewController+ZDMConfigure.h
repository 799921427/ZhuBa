//
//  UIViewController+ZDMConfigure.h
//  DoorManage
//
//  Created by 张德茂 on 2018/3/7.
//  Copyright © 2018年 张德茂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZDMConfigure)
-(void)createTitle:(NSString *)title titleImage:(NSString *)imgStr leftImage:(NSString *)leftImg rightImgae:(NSString *)rightImg;
-(void)createTitle:(NSString *)title titleImage:(NSString *)imgStr backImage:(NSString *)leftImg rightImgae:(NSString *)rightImg;
@end
