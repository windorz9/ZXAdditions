//
//  UIScreen+ZXAddition.h
//  ZXAdditions
//
//  Created by windorz on 2018/5/8.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (ZXAddition)

// 获取屏幕宽度
+ (CGFloat)zx_screenWidth;

// 获取屏幕高度
+ (CGFloat)zx_screenHeight;

// 获取屏幕分辨率
+ (CGFloat)zx_scale;

@end
