//
//  UIScreen+ZXAddition.m
//  ZXAdditions
//
//  Created by windorz on 2018/5/8.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "UIScreen+ZXAddition.h"

@implementation UIScreen (ZXAddition)

+ (CGFloat)zx_screenWidth {
    
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)zx_screenHeight {
    
    return [UIScreen mainScreen].bounds.size.height;
    
}

+ (CGFloat)zx_scale {
    
    return [UIScreen mainScreen].scale;
}

@end
