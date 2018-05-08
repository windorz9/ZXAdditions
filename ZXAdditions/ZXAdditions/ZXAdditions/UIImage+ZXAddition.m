//
//  UIImage+ZXAddition.m
//  ZXAdditions
//
//  Created by windorz on 2018/5/8.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "UIImage+ZXAddition.h"

@implementation UIImage (ZXAddition)

+ (UIImage *)zx_imageWithCircleBorderWidth:(CGFloat)borderW circleColor:(UIColor *)circleColor image:(UIImage *)image {
    
    // 圆边框宽度
    CGFloat borderWH = borderW;
    
    CGFloat ctxWH = image.size.width + 2 * borderW;
    
    // 重新设置 rect
    CGRect ctxRect = CGRectMake(0, 0, ctxWH, ctxWH);

    // 1. 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(ctxRect.size, NO, 0);
    
    // 2. 画外界边框
    UIBezierPath *bigCirclePath = [UIBezierPath bezierPathWithOvalInRect:ctxRect];
    
    // 设置圆环颜色
    [circleColor set];
    
    [bigCirclePath fill];
    
    // 3. 设置裁剪区域
    CGRect clipRect = CGRectMake(borderWH, borderWH, image.size.width, image.size.height);
    UIBezierPath *clipPaths = [UIBezierPath bezierPathWithOvalInRect:clipRect];
    [clipPaths addClip];
    
    // 4. 画图片
    [image drawAtPoint:CGPointMake(borderWH, borderWH)];
    
    // 5. 从上下文当中获取图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6. 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}

+ (UIImage *)zx_resizeImage:(NSString *)imageName {
    
    UIImage *bgImage = [UIImage imageNamed:imageName];
    
    // 将一个像素点作为可拉伸区域的填充部分
    bgImage = [bgImage stretchableImageWithLeftCapWidth:bgImage.size.width / 2 topCapHeight:bgImage.size.height / 2];
    
    return bgImage;
    
}

+ (NSString *)zx_imageToDataURL:(UIImage *)image {
    
    NSData *imageData = nil;
    
    if ([UIImage zx_imageHasAlpha:image]) {
        // 判断是否含有透明层 如果有就转化成 png
        imageData = UIImagePNGRepresentation(image);
        
    } else {
        // 如果没有就直接转成 jpeg 带一个压缩系数
        imageData = UIImageJPEGRepresentation(image, 0.4f);
        
    }
    
    return [imageData base64EncodedStringWithOptions:0];
    
}

+ (UIImage *)zx_DataURLTOImage:(NSString *)imageSrc {
    
    NSURL *urlStr = [NSURL URLWithString:imageSrc];
    
    
    NSData *imageData = [NSData dataWithContentsOfURL:urlStr];
    
    UIImage *image = [UIImage imageWithData:imageData];
  
    return image;
}

+ (NSData *)zx_imageToData:(UIImage *)image {
    
    NSData *imageData = nil;
    
    if ([UIImage zx_imageHasAlpha:image]) {
        imageData = UIImagePNGRepresentation(image);
    } else {
        imageData = UIImageJPEGRepresentation(image, 0.1f);
    }
    
    return imageData;
    
}


+ (BOOL)zx_imageHasAlpha:(UIImage *)image {
    
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);

}

+ (NSString *)zx_creatImageTypeAndName:(UIImage *)image {
    
    NSString *mimeType = nil;
    // 可以在调用方法时使用当前的系统时间作为文件名
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置时间格式
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    
    if ([UIImage zx_imageHasAlpha:image]) {
        mimeType = [NSString stringWithFormat:@"%@.png", str];
    } else {
        mimeType = [NSString stringWithFormat:@"%@.jpg", str];
    }
    
    return mimeType;
  
}

+ (UIImage *)zx_circleImage:(UIImage *)image WithParam:(CGFloat)inset {
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(image.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2);
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f, image.size.height - inset * 2.0f);
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextClip(context);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

+ (UIImage *)zx_imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size {

    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    
    CGFloat scaleFactor = 0.0;
    CGFloat scaleWidth = targetWidth;
    CGFloat scaleHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if (CGSizeEqualToSize(imageSize, size) == NO) {
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        
        if (widthFactor > heightFactor) {
            scaleFactor = widthFactor;
        } else {
            
            scaleFactor = heightFactor;
        }
        scaleWidth = width * scaleFactor;
        scaleHeight = height * scaleFactor;
        
        if (widthFactor > heightFactor) {
            
            thumbnailPoint.y = (targetHeight - scaleHeight) * 0.5;
        } else if (widthFactor < heightFactor) {
            
            thumbnailPoint.x = (targetWidth - scaleWidth) * 0.5;
        }
        
    }
    
    UIGraphicsBeginImageContext(size);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaleWidth;
    thumbnailRect.size.height = scaleHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if (newImage == nil) {
        NSLog(@"scale Image failure");
        return nil;
    }
    
    UIGraphicsEndImageContext();
    return newImage;

}

+ (UIImage *)zx_imageScaleToSize:(UIImage *)image size:(CGSize)size {
    
    UIGraphicsBeginImageContext(size);
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;

}


@end
