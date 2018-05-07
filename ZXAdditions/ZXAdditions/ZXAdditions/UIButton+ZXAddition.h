//
//  UIButton+ZXAddition.h
//  ZXAdditions
//
//  Created by windorz on 2018/5/7.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZXAddition)

/**
 创建文本按钮

 @param title 文本
 @param fontSize 字体大小
 @param normalColor 默认颜色
 @param selectedColor 选中颜色
 @return button
 */
+ (instancetype)zx_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;


/**
 创建一个带图片的文本按钮

 @param title 文本
 @param fontSize 字体大小
 @param normalColor 默认颜色
 @param selectedColor 选中颜色
 @param bgImageName 背景图片名称
 @return button
 */
+ (instancetype)zx_textButtonWithImageTitle:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor backgroundImageName:(NSString *)bgImageName;



/**
 创建一个图片按钮

 @param imageName 上层图片
 @param bgImageName 背景图片
 @return button
 */
+ (instancetype)zx_imageButtonWithImage:(NSString *)imageName backgroundImageName:(NSString *)bgImageName;




/**
 创建高亮按钮

 @param title 文本
 @param fontSize 字体大小
 @param normalColor 默认颜色
 @param highLightColor 高亮颜色
 @return button
 */
+ (instancetype)zx_titleButton:(NSString *)title fonsSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highLightColor:(UIColor *)highLightColor;

@end
