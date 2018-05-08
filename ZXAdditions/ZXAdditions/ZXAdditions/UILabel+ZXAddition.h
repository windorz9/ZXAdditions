//
//  UILabel+ZXAddition.h
//  ZXAdditions
//
//  Created by windorz on 2018/5/8.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZXAddition)


/**
 创建一个标签 label

 @param text 文本
 @param fontSize 字体大小
 @param textColor 字体颜色
 @return 返回一个 label
 */
+ (instancetype)zx_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)textColor;

@end
