//
//  NSArray+ZXlog.m
//  ZXAdditions
//
//  Created by windorz on 2018/4/28.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "NSArray+ZXlog.h"

@implementation NSArray (ZXlog)

/**
 重写数组的打印方法
 @return 返回编排的字符串
 */
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
    NSMutableString *strM = [NSMutableString stringWithString:@"\n[\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [strM appendFormat:@"\t[%ld] = %@, \n", idx, obj];
        
    }];
    
    [strM appendString:@"]"];
    
    return strM.copy;
    
}

@end


@implementation NSDictionary (ZXlog)

/**
 重写字典的打印方法
 @return 返回结果字符串
 */
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {

    NSMutableString *strM = [NSMutableString stringWithString:@"\n{\n"];

    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {

        [strM appendFormat:@"\t%@ = %@\n", key, obj];

    }];

    [strM appendString:@"\n}"];


    return strM.copy;

}


@end
