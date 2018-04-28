//
//  NSAttributedString+ZXAddition.m
//  ZXAdditions
//
//  Created by windorz on 2018/4/28.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "NSAttributedString+ZXAddition.h"

@implementation NSAttributedString (ZXAddition)

+ (instancetype)zx_imageTextWithImage:(UIImage *)image imageWH:(CGFloat)imageWH title:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor spacing:(CGFloat)spacing {
    
    // 1. 创建文本字典
    NSDictionary *titleDict = @{
                                NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                                NSForegroundColorAttributeName : titleColor
                                };
    
    NSDictionary *spacingDict = @{
                                  NSFontAttributeName : [UIFont systemFontOfSize: spacing]
                                  };
    
    // 2. 创建图片文本
    NSTextAttachment *attchment = [[NSTextAttachment alloc] init];
    attchment.image = image;
    attchment.bounds = CGRectMake(0, 0, imageWH, imageWH);
    NSAttributedString *imageText = [NSAttributedString attributedStringWithAttachment:attchment];
    
    
    // 3. 换行文本
    NSAttributedString *spaceText = [[NSAttributedString alloc] initWithString:@"\n\n" attributes:spacingDict];
    
    
    // 4. title 文本
    NSAttributedString *titleText = [[NSAttributedString alloc] initWithString:title attributes:titleDict];
    
    
    // 5. 合并文字
    NSMutableAttributedString *attM = [[NSMutableAttributedString alloc] initWithAttributedString:imageText];
    
    [attM appendAttributedString:spaceText];
    [attM appendAttributedString:titleText];
    
    return attM.copy;

}

@end
