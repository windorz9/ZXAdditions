//
//  UIButton+ZXAddition.m
//  ZXAdditions
//
//  Created by windorz on 2018/5/7.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "UIButton+ZXAddition.h"

@implementation UIButton (ZXAddition)

+ (instancetype)zx_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor {
    
    UIButton *button = [[UIButton alloc] init];
    
//    button.highlighted = NO;
//    button.showsTouchWhenHighlighted = YES;
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectedColor forState:UIControlStateHighlighted];
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [button sizeToFit];
    
    return button;
    
}


+ (instancetype)zx_textButtonWithImageTitle:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor backgroundImageName:(NSString *)bgImageName {
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectedColor forState:UIControlStateHighlighted];
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [button sizeToFit];
    
    return button;

}


+ (instancetype)zx_imageButtonWithImage:(NSString *)imageName backgroundImageName:(NSString *)bgImageName {
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    
    [button sizeToFit];
    
    return button;

}

+ (instancetype)zx_titleButton:(NSString *)title fonsSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highLightColor:(UIColor *)highLightColor {
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    button.highlighted = NO;
    button.showsTouchWhenHighlighted = NO;
    
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:highLightColor forState:UIControlStateHighlighted];
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [button sizeToFit];
    
    return button;

}

@end
