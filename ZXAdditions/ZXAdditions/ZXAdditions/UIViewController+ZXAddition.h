//
//  UIViewController+ZXAddition.h
//  ZXAdditions
//
//  Created by windorz on 2018/5/8.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZXAddition)


/**
 在当前视图控制器中添加子控制器，将子控制器的视图添加到 view 中

 @param childController 要添加的子控制器
 @param view 要添加到的视图
 */
- (void)zx_addChildController:(UIViewController *)childController intoView:(UIView *)view;

@end
