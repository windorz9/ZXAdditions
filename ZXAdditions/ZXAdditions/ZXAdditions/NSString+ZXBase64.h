//
//  NSString+ZXBase64.h
//  ZXAdditions
//
//  Created by windorz on 2018/5/1.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import <Foundation/Foundation.h>

// base64 用于在 http 环境下传递的标识信息. 应用程序当中常常把二级制数据编码为适合放URL包括隐藏表单域, 采用 base64编码不仅比较简单同时具有不可读性. 即编码的数据不会被人肉眼看到. base64常常用于简单加密.
@interface NSString (ZXBase64)


/**
 对当前字符串进行 base64 编码

 @return 返回结果字符串
 */
- (NSString *)zx_base64Encode;


/**
 对当前字符串进行 base64 解码

 @return 返回结果字符串
 */
- (NSString *)zx_base64Decode;

@end
