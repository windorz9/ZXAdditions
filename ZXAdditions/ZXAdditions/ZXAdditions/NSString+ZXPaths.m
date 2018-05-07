//
//  NSString+ZXPaths.m
//  ZXAdditions
//
//  Created by windorz on 2018/5/7.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "NSString+ZXPaths.h"

@implementation NSString (ZXPaths)

- (instancetype)docDir {
    
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];

}


- (instancetype)cacheDir {
    
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];

}

- (instancetype)temDir {
    
    NSString *dir = NSTemporaryDirectory();
    
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];

}
@end
