//
//  NSString+ZXPaths.h
//  ZXAdditions
//
//  Created by windorz on 2018/5/7.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZXPaths)


/**
 生成文档目录全路径
 */
- (instancetype)docDir;

/**
 生成缓存目录全路径
 */
- (instancetype)cacheDir;

/**
 生成临时目录全路径
 */
- (instancetype)temDir;

@end
