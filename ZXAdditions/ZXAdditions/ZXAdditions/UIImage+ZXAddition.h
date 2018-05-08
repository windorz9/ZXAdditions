//
//  UIImage+ZXAddition.h
//  ZXAdditions
//
//  Created by windorz on 2018/5/8.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZXAddition)

/**
 给图片加上圆角和边框

 @param borderW 边框宽度
 @param circleColor 边框颜色
 @param image image
 @return 返回一张图片
 */
+ (UIImage *)zx_imageWithCircleBorderWidth:(CGFloat)borderW circleColor:(UIColor *)circleColor image:(UIImage *)image;


/**
 创建可拉伸图片 例如聊天当中的 气泡

 @param imageName 图片名称
 @return 返回一张图片
 */
+ (UIImage *)zx_resizeImage:(NSString *)imageName;


/**
 图片转成 base64  (URL)

 @param image image
 @return 返回结果字符串
 */
+ (NSString *)zx_imageToDataURL:(UIImage *)image;

/**
 base64 (URL) 转图片

 @param imageSrc 图片字符串
 @return 返回一张图片
 */
+ (UIImage *)zx_DataURLTOImage:(NSString *)imageSrc;


/**
 将图片转为 data

 @param image 源图片
 @return 图片
 */
+ (NSData *)zx_imageToData:(UIImage *)image;

/**
 判断图片是否含有透明层

 @param image 图片
 @return 是否含有透明层
 */
+ (BOOL)zx_imageHasAlpha:(UIImage *)image;


/**
 根据图片, 生成图片对应的类型和名称, 用于保存图片的时候重命名

 @param image 目标 image
 @return 图片名称
 */
+ (NSString *)zx_creatImageTypeAndName:(UIImage *)image;


/**
 裁剪生成一张圆形图片

 @param image image
 @param inset 参数
 @return 返回圆形图片
 */
+ (UIImage *)zx_circleImage:(UIImage *)image WithParam:(CGFloat)inset;



/**
 将图片压缩到指定的 cgsize 大小 并按比例进行缩放

 @param sourceImage 目标图片
 @param size 目标 size
 @return newImage
 */
+ (UIImage *)zx_imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;


/**
 把图片缩放到指定的大小

 @param image 源图片
 @param size 目标大小
 @return 图片
 */
+ (UIImage *)zx_imageScaleToSize:(UIImage *)image size:(CGSize)size;

@end
