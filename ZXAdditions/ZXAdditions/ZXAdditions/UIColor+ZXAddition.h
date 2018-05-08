//
//  UIColor+ZXAddition.h
//  ZXAdditions
//
//  Created by windorz on 2018/5/8.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZXAddition)
/**
 16进制数字创建颜色, 例如 0xFF0000 创建红色

 @param hex 16进制 无符号 32 位整形.
 
 @return 返回一个颜色
 */
+ (instancetype)zx_colorWithHex:(uint32_t)hex;


/**
 生成一个随机颜色

 @return 随机颜色
 */
+ (instancetype)zx_randomColor;


/**
 使用 RGB 数值创建颜色

 @param red red
 @param green green
 @param blue blue
 @return 一个颜色
 */
+ (instancetype)zx_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;

@end
