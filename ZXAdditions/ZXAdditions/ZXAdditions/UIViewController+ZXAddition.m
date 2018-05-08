//
//  UIViewController+ZXAddition.m
//  ZXAdditions
//
//  Created by windorz on 2018/5/8.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "UIViewController+ZXAddition.h"

@implementation UIViewController (ZXAddition)

- (void)zx_addChildController:(UIViewController *)childController intoView:(UIView *)view {
    
    [self addChildViewController:childController];
    
    [view addSubview:childController.view];
    
    [childController didMoveToParentViewController:self];
    
}

@end
