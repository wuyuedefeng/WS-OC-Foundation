//
//  UIImage+Category.h
//  WSFouncDesign
//
//  Created by TX-009 on 14-8-5.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIImage (DKResizableImage)
- (UIImage *)resizableImage;// 使用UIImageResizingModeTile
- (UIImage *)resizableImageWithResizingMode:(UIImageResizingMode)resizingMode;
@end
typedef NS_ENUM(NSInteger, UIImageDKCompressMode) {
	UIImageDKCompressModeFill = UIViewContentModeScaleToFill,
	UIImageDKCompressModeAspectFit = UIViewContentModeScaleAspectFit,
	UIImageDKCompressModeAspectFill = UIViewContentModeScaleAspectFill,
};
@interface UIImage (Category)
/**
 *  将图片压缩到指定的尺寸，使用的UIImageViewCompressMode为UIImageViewCompressModeAspectFit
 *
 *  @param destImgSize 图片最终的size(图片的size属性，最终会等于destImgSize)
 *
 *  @return 压缩后的图片
 */
- (UIImage *)compressImageToSpecifiedCGSize:(CGSize)destImgSize;
/**
 *  使用指定的UIImageViewCompressMode，将图片压缩到指定的尺寸
 *
 *  @param destImgSize  图片最终的size(图片的size属性，最终会等于destImgSize)
 *  @param compressMode [fill]/[aspect fit]/[aspect fill]
 *
 *  @return 压缩后的图片
 */
- (UIImage *)compressImageToSpecifiedCGSize:(CGSize)destImgSize withMode:(UIImageDKCompressMode)compressMode;
/**
 *  将图片压缩至指定的内存占用值，以千字节计算，使用的UIImageViewCompressMode为UIImageCompressModeAspectFit
 *
 *  @param specifiedKB 指定的内存占用值，以千字节计算
 *
 *  @return 压缩后的图片
 */
- (UIImage *)compressImageToSpecifiedKB:(CGFloat)specifiedKB;
/**
 *  将图片压缩至指定的内存占用值，以千字节计算
 *
 *  @param specifiedKB 指定的内存占用值，以千字节计算
 *  @param compressMode [fill]/[aspect fit]/[aspect fill]
 *
 *  @return 压缩后的图片
 */
- (UIImage *)compressImageToSpecifiedKB:(CGFloat)specifiedKB withMode:(UIImageDKCompressMode)compressMode;
@end
