//
//  UIImage+WSCategory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-8-5.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UIImage+WSCategory.h"
#import "UIDevice+WSCategory.h"
@implementation UIImage (DKResizableImage)
- (UIImage *)resizableImage {
	return [self resizableImageWithResizingMode:UIImageResizingModeTile];
}

- (UIImage *)resizableImageWithResizingMode:(UIImageResizingMode)resizingMode {
	CGSize s = self.size;
	CGFloat w = s.width;
	CGFloat h = s.height;
	// 使用中心位置的那个点，进行平铺或拉伸
	CGFloat lr = (w - 1.0f) / 2.0f;// left and right
	CGFloat tb = (h - 1.0f) / 2.0f;// top and bottom
#ifdef __IPHONE_6_0
	if ([self respondsToSelector:@selector(resizableImageWithCapInsets:resizingMode:)]) {
		return [self resizableImageWithCapInsets:UIEdgeInsetsMake(tb, lr, tb, lr) resizingMode:resizingMode];
	} else {
#endif
#ifdef __IPHONE_5_0
		if ([self respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
			return [self resizableImageWithCapInsets:UIEdgeInsetsMake(tb, lr, tb, lr)];
		} else {
#endif
			return [self stretchableImageWithLeftCapWidth:lr topCapHeight:tb];
#ifdef __IPHONE_5_0
		}
#endif
#ifdef __IPHONE_6_0
	}
#endif
}
@end

@implementation UIImage (Category)
- (UIImage *)compressImageToSpecifiedCGSize:(CGSize)destImgSize {
	return [self compressImageToSpecifiedCGSize:destImgSize withMode:UIImageDKCompressModeAspectFit];
}
- (UIImage *)compressImageToSpecifiedCGSize:(CGSize)destImgSize withMode:(UIImageDKCompressMode)compressMode {
	// 图片原始尺寸
	CGSize sourceImgSize = self.size;
	CGFloat sourceImgWidth = sourceImgSize.width;
	CGFloat sourceImgHeight = sourceImgSize.height;
	// 最终图片尺寸
	CGFloat destImgWidth = destImgSize.width;
	CGFloat destImgHeight = destImgSize.height;
	
	if (sourceImgWidth <= destImgWidth && sourceImgHeight <= destImgHeight) {
		return self;
	}
	
	CGFloat sourceRatio = sourceImgWidth / sourceImgHeight;
	CGFloat destRatio = destImgWidth / destImgHeight;
	
	CGFloat scaledRatio = 0;
	CGFloat scaledImgWidth = destImgWidth;
	CGFloat scaledImgHeight = destImgHeight;
	
	CGRect rect = CGRectZero;
	switch (compressMode) {
		case UIImageDKCompressModeAspectFill:
		{
			if (sourceRatio > destRatio) {
				scaledRatio = sourceImgHeight / destImgHeight;
				scaledImgWidth = sourceImgWidth / scaledRatio;
				rect.origin.x = (destImgWidth - scaledImgWidth) / 2.0f;// 非正值
			} else {
				scaledRatio = sourceImgWidth / destImgWidth;
				scaledImgHeight = sourceImgHeight / scaledRatio;
				rect.origin.y = (destImgHeight - scaledImgHeight) / 2.0f;// 非正值
			}
			break;
		}
		case UIImageDKCompressModeAspectFit:
		{
			if (sourceRatio > destRatio) {
				scaledRatio = sourceImgWidth / destImgWidth;
				scaledImgHeight = sourceImgHeight / scaledRatio;
				rect.origin.y = (destImgHeight - scaledImgHeight) / 2.0f;// 非负值
			} else {
				scaledRatio = sourceImgHeight / destImgHeight;
				scaledImgWidth = sourceImgWidth / scaledRatio;
				rect.origin.x = (destImgWidth - scaledImgWidth) / 2.0f;// 非负值
			}
			break;
		}
		default:
		{
			break;
		}
	}
#ifdef __IPHONE_4_0
	if (kWSSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"4.0")) {
		UIGraphicsBeginImageContextWithOptions(destImgSize, NO, 0);
	} else {
#endif
		UIGraphicsBeginImageContext(destImgSize);
#ifdef __IPHONE_4_0
	}
#endif
	rect.size = CGSizeMake(scaledImgWidth, scaledImgHeight);
	[self drawInRect:rect];
	
	// 最终图片
	UIImage *destImg = UIGraphicsGetImageFromCurrentImageContext();
	NSAssert(destImg != nil, @"图片缩放失败, 最终图片为空!");
	UIGraphicsEndImageContext();
	return destImg;
}

- (UIImage *)compressImageToSpecifiedKB:(CGFloat)specifiedKB {
	return [self compressImageToSpecifiedKB:specifiedKB withMode:UIImageDKCompressModeAspectFit];
}

- (UIImage *)compressImageToSpecifiedKB:(CGFloat)specifiedKB withMode:(UIImageDKCompressMode)compressMode {
	NSAssert(specifiedKB > 0, @"指定的大小必须大于0");
	CGImageRef imgRef = self.CGImage;
	size_t width = CGImageGetWidth(imgRef);
	size_t height = CGImageGetHeight(imgRef);
	size_t bitsPerPixel = CGImageGetBitsPerPixel(imgRef);
	size_t bits = bitsPerPixel * width * height;
	size_t kbs = bits / 8 / 1024;// 原图片解压后所占用的内存(KB)
	if (specifiedKB >= kbs) {
		return self;
	}
	CGFloat scale = sqrtf((CGFloat)kbs / specifiedKB);
	CGSize size = self.size;
	return [self compressImageToSpecifiedCGSize:CGSizeMake(size.width / scale, size.height / scale) withMode:compressMode];
}

+ (UIImage*)createImageWithColor:(UIColor*)color size:(CGSize)imageSize
{
    CGRect rect=CGRectMake(0.0f, 0.0f, imageSize.width, imageSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/**
 *  /////
 */
CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180/M_PI;};

+ (UIImage *)grabScreenWithScale:(CGFloat)scale
{
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    //    UIGraphicsBeginImageContext(screenWindow.frame.size);
    UIGraphicsBeginImageContextWithOptions(screenWindow.frame.size, YES, scale);
    [screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)grabImageWithView:(UIView *)view scale:(CGFloat)scale
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    return image;
}

+ (UIImage *)captureView:(UIView *)view frame:(CGRect)frame
{
    UIGraphicsBeginImageContext(view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRef ref = CGImageCreateWithImageInRect(img.CGImage, frame);
    UIImage *i = [UIImage imageWithCGImage:ref];
    CGImageRelease(ref);
    return i;
}

+ (UIImage *)mergeWithImage1:(UIImage*)image1 image2:(UIImage *)image2 frame1:(CGRect)frame1 frame2:(CGRect)frame2 size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [image1 drawInRect:frame1 blendMode:kCGBlendModeLuminosity alpha:1.0];
    [image2 drawInRect:frame2 blendMode:kCGBlendModeLuminosity alpha:0.2];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)mask{
    CGImageRef imgRef = [image CGImage];
    CGImageRef maskRef = [mask CGImage];
    CGImageRef actualMask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                              CGImageGetHeight(maskRef),
                                              CGImageGetBitsPerComponent(maskRef),
                                              CGImageGetBitsPerPixel(maskRef),
                                              CGImageGetBytesPerRow(maskRef),
                                              CGImageGetDataProvider(maskRef), NULL, true);
    CGImageRef masked = CGImageCreateWithMask(imgRef, actualMask);
    UIImage *resultImg = [UIImage imageWithCGImage:masked];
    CGImageRelease(actualMask);
    CGImageRelease(masked);
    
    return resultImg;
}

+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

+(UIImage *)colorizeImage:(UIImage *)image withColor:(UIColor *)color
{
    UIGraphicsBeginImageContext(image.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGContextSaveGState(ctx);
    CGContextClipToMask(ctx, area, image.CGImage);
    [color set];
    CGContextFillRect(ctx, area);
    CGContextRestoreGState(ctx);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextDrawImage(ctx, area, image.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


-(UIImage *)imageAtRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage* subImage = [UIImage imageWithCGImage: imageRef];
    CGImageRelease(imageRef);
    
    return subImage;
}

- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize
{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor;
        else
            scaleFactor = heightFactor;
        
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    // this is actually the interesting part:
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(newImage == nil) NSLog(@"could not scale image");
    
    return newImage ;
}

- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize
{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor < heightFactor)
            scaleFactor = widthFactor;
        else
            scaleFactor = heightFactor;
        
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        
        if (widthFactor < heightFactor) {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        } else if (widthFactor > heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    
    // this is actually the interesting part:
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(newImage == nil) NSLog(@"could not scale image");
    
    return newImage ;
}
- (UIImage *)imageByScalingToSize:(CGSize)targetSize
{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    
    //   CGSize imageSize = sourceImage.size;
    //   CGFloat width = imageSize.width;
    //   CGFloat height = imageSize.height;
    
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    
    //   CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    // this is actually the interesting part:
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(newImage == nil) NSLog(@"could not scale image");
    
    
    return newImage ;
}

- (UIImage *)imageRotatedByRadians:(CGFloat)radians
{
    return [self imageRotatedByDegrees:RadiansToDegrees(radians)];
}

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees
{
    // calculate the size of the rotated view's containing box for our drawing space
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
    CGAffineTransform t = CGAffineTransformMakeRotation(DegreesToRadians(degrees));
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    
    // Create the bitmap context
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    // Move the origin to the middle of the image so we will rotate and scale around the center.
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    
    //   // Rotate the image context
    CGContextRotateCTM(bitmap, DegreesToRadians(degrees));
    
    // Now, draw the rotated/scaled image into the context
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}
@end
