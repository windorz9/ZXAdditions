//
//  UIView+ZXAddition.m
//  ZXAdditions
//
//  Created by windorz on 2018/5/8.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "UIView+ZXAddition.h"

@implementation UIView (ZXAddition)

- (UIImage *)zx_screenShotImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
 
}

@end
