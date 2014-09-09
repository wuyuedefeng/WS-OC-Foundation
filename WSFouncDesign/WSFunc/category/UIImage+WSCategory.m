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
@end
