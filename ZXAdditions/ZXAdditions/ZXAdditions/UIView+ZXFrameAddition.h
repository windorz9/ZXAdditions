//
//  UIView+ZXFrameAddition.h
//  ZXAdditions
//
//  Created by windorz on 2018/5/8.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZXFrameAddition)

// frame 快捷获取属性
@property (nonatomic, assign) CGPoint zx_origin;
@property (nonatomic, assign) CGSize zx_size;

// position 快捷获取属性
@property (nonatomic, assign) CGFloat zx_centerX;
@property (nonatomic, assign) CGFloat zx_centerY;

@property (nonatomic, assign) CGFloat zx_top;
@property (nonatomic, assign) CGFloat zx_bottom;
@property (nonatomic, assign) CGFloat zx_left;
@property (nonatomic, assign) CGFloat zx_right;

// bounds 快捷获取属性
@property (nonatomic, assign) CGFloat zx_width;
@property (nonatomic, assign) CGFloat zx_height;

@end
