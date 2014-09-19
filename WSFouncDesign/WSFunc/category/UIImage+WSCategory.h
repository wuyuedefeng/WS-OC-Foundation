//
//  UIImage+WSCategory.h
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
/**
 *  通过颜色转换成image
 *
 *  @param color     待生成图片的颜色
 *  @param imageSize 待生成图片大小
 *
 *  @return 生成后的图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color size:(CGSize)imageSize;

//-----------------------------------------
/**
 *  抓取屏幕。
 *  @param  scale:屏幕放大倍数，1为原尺寸。
 *  return  屏幕后的Image。
 */
+ (UIImage *)grabScreenWithScale:(CGFloat)scale;

/**
 *  抓取UIView及其子类。
 *  @param  view: UIView及其子类。
 *  @param  scale:屏幕放大倍数，1为原尺寸。
 *  return  抓取图片后的Image。
 */
+ (UIImage *)grabImageWithView:(UIView *)view scale:(CGFloat)scale;

/**
 *  合并两个Image。
 *  @param  image1、image2: 两张图片。
 *  @param  frame1、frame2:两张图片放置的位置。
 *  @param  size:返回图片的尺寸。
 *  return  合并后的两个图片的Image。
 */
+ (UIImage *)mergeWithImage1:(UIImage *)image1 image2:(UIImage *)image2 frame1:(CGRect)frame1 frame2:(CGRect)frame2 size:(CGSize)size;

/**
 *  把一个Image盖在另一个Image上面。
 *  @param  image: 底图。
 *  @param  mask:盖在上面的图。
 *  return  Image。
 */
+ (UIImage *)maskImage:(UIImage *)image withMask:(UIImage *)mask;

/**
 *  把一个Image尺寸缩放到另一个尺寸。
 *  @param  view: UIView及其子类。
 *  @param  scale:屏幕放大倍数，1为原尺寸。
 *  return  尺寸更改后的Image。
 */
+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size;

/**
 *  改变一个Image的色彩。
 *  @param  image: 被改变的Image。
 *  @param  color: 要改变的目标色彩。
 *  return  色彩更改后的Image。
 */
+(UIImage *)colorizeImage:(UIImage *)image withColor:(UIColor *)color;

/**
 *  等比压缩图片到指定的height
 *
 *  @param height 指定的height
 *
 *  @return 压缩后的图片
 */
- (UIImage *)imageScaledToHeight:(CGFloat)height;

/**
 *  等比压缩图片到指定的width
 *
 *  @param width 指定的width
 *
 *  @return 压缩后的图片
 */
- (UIImage *)imageScaledToWidth:(CGFloat)width;

/**
 *  居中裁剪图片
 *
 *  @param size size
 *
 *  @return 裁剪后的图片
 */
- (UIImage *)cutImageFromCenter:(CGSize)size;
//按frame裁减图片
+ (UIImage *)captureView:(UIView *)view frame:(CGRect)frame;


- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

@end
