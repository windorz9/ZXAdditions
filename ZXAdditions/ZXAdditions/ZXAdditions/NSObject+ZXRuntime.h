//
//  NSObject+ZXRuntime.h
//  ZXAdditions
//
//  Created by windorz on 2018/4/28.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZXRuntime)


/**
 使用一个字典数组创建当前类对象的数组

 @param array 字典数组
 @return 当前类对象的数组
 */
+ (NSArray *)zx_objectsWithArray:(NSArray<NSDictionary *> *)array;


/**
  返回当前类的属性数组

 @return 属性数组
 */
+ (NSArray *)zx_propertiesList;


/**
 返回当前类的成员变量数组

 @return 成员变量数组
 */
+ (NSArray *)zx_ivarsList;


/**
 返回当前类的方法列表

 @return 方法列表
 */
+ (NSArray *)zx_methodList;


/**
 返回当前类的协议数组

 @return 协议数组
 */
+ (NSArray *)zx_protocolList;


/**
 使用字典数组创建当前类的对象

 @param dictinary 字典
 @return 当前类对象
 */
+ (instancetype)zx_objectWithDictionary:(NSDictionary *)dictinary;



@end
