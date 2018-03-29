//
//  CALayer+UIColor.m
//  DoorManage
//
//  Created by 张德茂 on 2018/3/3.
//  Copyright © 2018年 张德茂. All rights reserved.
//

#import "CALayer+UIColor.h"
#import "UIKit/UIKit.h"


@implementation CALayer (UIColor)

-(void)setBorderColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

@end
