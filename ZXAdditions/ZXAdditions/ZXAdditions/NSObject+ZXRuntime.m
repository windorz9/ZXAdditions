//
//  NSObject+ZXRuntime.m
//  ZXAdditions
//
//  Created by windorz on 2018/4/28.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "NSObject+ZXRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (ZXRuntime)

+ (NSArray *)zx_objectsWithArray:(NSArray *)array {
    
    if (array.count == 0) {
        return nil;
    }
    
    // 断言是字典数组
    NSAssert([array[0] isKindOfClass:[NSDictionary class]], @"必须传入字典数组");
    
    // 0. 获取属性数组
    NSArray *list = [self zx_propertiesList];
    
    // 1. 遍历数组
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dic  in array) {
        
        // 2. 创建对象
        id objc = [self new];
        
        // 3.遍历字典
        for (NSString *key in dic) {
            if (![list containsObject:key]) {
                continue;
            }
            [objc setValue:dic[key] forKey:key];
         }
        
        // 4. 将对象添加到数组
        [arrayM addObject:objc];
        
    }
    
    return arrayM.copy;
    

}


#pragma mark - 获取属性变量列表
void *propertiesKey = "zx.propertiesList";

+ (NSArray *)zx_propertiesList {
    
    // 1. 获取关联对象
    NSArray *result = objc_getAssociatedObject(self, propertiesKey);
    
    if (result != nil) {
        return result;
    }
    
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    
    // 遍历所有的属性
    NSMutableArray *arrayM = [NSMutableArray array];
    
    
    for (unsigned int i = 0; i < count; i++) {
        
        objc_property_t pty = list[i];
        
        // 获取 iVar 名称
        const char *cName = property_getName(pty);
        NSString *name = [NSString stringWithUTF8String:cName];
        
        [arrayM addObject:name];
    }
    
    free(list);
    
    // 设置关联对象
    objc_setAssociatedObject(self, propertiesKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return objc_getAssociatedObject(self, propertiesKey);
    

}

#pragma mark - 私有方法, 专门针对字典转模型中的自定义属性 {@"name":@"Dog"},name是属性名，Dog是自定义的模型类，属性名-属性类型
void *propertiesTypeKey = "zx.propertiesTypeKey";

+ (NSArray<NSDictionary *> *)zx_propertiesTypeList {
    
    // 1. 获取关联对象
    NSArray *result = objc_getAssociatedObject(self, propertiesKey);
    
    if (result != nil) {
        return result;
    }
    
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    
    NSMutableArray<NSDictionary *> *arrayM = [NSMutableArray<NSDictionary *> array];
    
    for (unsigned int i = 0; i < count; i++) {
        objc_property_t pty = list[i];
        
        const char *cType = property_getAttributes(pty);
        NSString *typeStr = [NSString stringWithUTF8String:cType];
        
        if ([typeStr containsString:@"\",&"]) {
            NSRange typeRange = [typeStr rangeOfString:@"\",&"];
            NSString *type = [typeStr substringWithRange:NSMakeRange(typeRange.location - 3, 3)];
            
            const char *cName = property_getName(pty);
            NSString *name = [NSString stringWithUTF8String:cName];
            
            NSDictionary *dict = @{name: type};
            
            [arrayM addObject:dict];
        }
    }
    
    free(list);
    
    // 设置关联对象
    objc_setAssociatedObject(self, propertiesKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return objc_getAssociatedObject(self, propertiesKey);

}

#pragma mark - 获取实例变量列表
void *ivarsKey = "zx.ivarsList";

+ (NSArray *)zx_ivarsList {
    
    // 获取关联对象
    NSArray *result = objc_getAssociatedObject(self, ivarsKey);
    
    if (result != nil) {
        return result;
    }
    
    unsigned int count = 0;
    Ivar *list = class_copyIvarList([self class], &count);
    
    // 遍历所有的属性
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = list[i];
        
        // 获取 iVar 的名字
        const char *cName = ivar_getName(ivar);
        NSString *name = [NSString stringWithUTF8String:cName];
        
        [arrayM addObject:name];
        
    }
    
    free(list);
    
    // 设置关联对象
    objc_setAssociatedObject(self, ivarsKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return objc_getAssociatedObject(self, ivarsKey);
 
}

#pragma mark - 获取方法数组
+ (NSArray *)zx_methodList {
    
    unsigned int count = 0;
    Method *list = class_copyMethodList([self class], &count);
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (unsigned int i = 0; i < count; i++) {
        
        Method method = list[i];
        
        SEL selector = method_getName(method);
        NSString *name = NSStringFromSelector(selector);
        
        [arrayM addObject:name];
    }
    
    free(list);
    
    return arrayM.copy;

}

#pragma mark - 获取协议数组
+ (NSArray *)zx_protocolList {
    
    unsigned int count = 0;
    
    __unsafe_unretained Protocol **list = class_copyProtocolList([self class], &count);
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (unsigned int i = 0; i < count; i++) {
        
        Protocol *protocol = list[i];
        
        const char *cName = protocol_getName(protocol);
        NSString *name = [NSString stringWithUTF8String:cName];
        
        [arrayM addObject:name];
        
    }
    
    free(list);
    
    return arrayM.copy;
  
}

#pragma mark - 字典 -> 当前类的对象
+ (instancetype)zx_objectWithDictionary:(NSDictionary *)dictinary {
    
    // 当前类的属性数组
    NSArray *list = [self zx_propertiesList];
    
    NSArray<NSDictionary *> *propertyTypeList = [self zx_propertiesTypeList];
    
    id obj = [self new];
    
    for (NSString *key in dictinary) {
        
        if ([list containsObject:key]) {
            if ([dictinary[key] isKindOfClass:[NSDictionary class]]) { // 属性值为字典
                for (NSDictionary *dict in propertyTypeList) {
                    
                    if ([key isEqualToString:[NSString stringWithFormat:@"%@", dict.allKeys.firstObject]]) {
                        NSString *classType = dict[key];
                        Class class = NSClassFromString(classType);
                        
                        id objChild = [class zx_objectWithDictionary:dictinary[key]];
                        
                        [obj setValue:objChild forKey:key];
                        
                    }
                    
                }
            } else if ([dictinary[key] isKindOfClass:[NSArray<NSDictionary *> class]]) { // 属性值为字典数组.
                
                
            } else {
                
                [obj setValue:dictinary[key] forKey:key];
            }
        }
    }
    return obj;
}


@end
