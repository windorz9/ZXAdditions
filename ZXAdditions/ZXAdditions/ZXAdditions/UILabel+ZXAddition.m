//
//  UILabel+ZXAddition.m
//  ZXAdditions
//
//  Created by windorz on 2018/5/8.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "UILabel+ZXAddition.h"

@implementation UILabel (ZXAddition)

+ (instancetype)zx_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)textColor {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = textColor;
    
    return label;
}

@end
