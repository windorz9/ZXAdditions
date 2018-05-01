//
//  NSString+ZXBase64.m
//  ZXAdditions
//
//  Created by windorz on 2018/5/1.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "NSString+ZXBase64.h"

@implementation NSString (ZXBase64)

// 编码
- (NSString *)zx_base64Encode {
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
    
}


// 解码
- (NSString *)zx_base64Decode {
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
}



@end
