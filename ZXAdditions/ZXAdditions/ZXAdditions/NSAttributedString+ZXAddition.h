//
//  NSAttributedString+ZXAddition.h
//  ZXAdditions
//
//  Created by windorz on 2018/4/28.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (ZXAddition)


/**
 使用图像和文本生成一个上下排列的属性文本

 @param image 图片
 @param imageWH 图片宽高
 @param title 标题文本
 @param fontSize 文本字体大小
 @param titleColor 标题颜色
 @param spacing 图像和标题间距
 @return 属性文本
 */
+ (instancetype)zx_imageTextWithImage:(UIImage *)image
                              imageWH:(CGFloat)imageWH
                                title:(NSString *)title
                             fontSize:(CGFloat)fontSize
                           titleColor:(UIColor *)titleColor
                              spacing:(CGFloat)spacing;


@end
