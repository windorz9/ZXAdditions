//
//  UIView+ZXFrameAddition.m
//  ZXAdditions
//
//  Created by windorz on 2018/5/8.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "UIView+ZXFrameAddition.h"

@implementation UIView (ZXFrameAddition)

#pragma mark Frame 属性
- (CGPoint)zx_origin {
    
    return self.frame.origin;
}

- (void)setZx_origin:(CGPoint)origin {
    
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;

}

- (CGSize)zx_size {
    
    return self.frame.size;
}

- (void)setZx_size:(CGSize)size {
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;

}

#pragma mark position 属性
- (CGFloat)zx_centerX {
    
    return self.center.x;
}

- (void)setZx_centerX:(CGFloat)centerX {
    
    self.center = CGPointMake(centerX, self.center.y);

}

- (CGFloat)zx_centerY {
    
    return self.center.y;
}

- (void)setZx_centerY:(CGFloat)centerY {
    
    self.center = CGPointMake(self.center.x, centerY);

}

#pragma mark 坐标属性

- (CGFloat)zx_top {
    
    return self.frame.origin.y;
}

- (void)setZx_top:(CGFloat)y {
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;

}

- (CGFloat)zx_bottom {
    
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setZx_bottom:(CGFloat)bottom {
    
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;

}

- (CGFloat)zx_left {
    
    return self.frame.origin.x;
    
}

- (void)setZx_left:(CGFloat)x {
    
    CGRect frame = self.frame;
    frame.origin.x = x;
    
    self.frame = frame;
    
}

- (CGFloat)zx_right {
    
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setZx_right:(CGFloat)right {
    
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
    
    
}

- (CGFloat)zx_width {
    
    return self.frame.size.width;

}

- (void)setZx_width:(CGFloat)width {
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    
}



- (CGFloat)zx_height {
    
    return self.frame.size.height;
    
}

- (void)setZx_height:(CGFloat)height {
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
    
}

@end
