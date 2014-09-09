//
//  UIButton+WSCategory.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-23.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "UIButton+WSCategory.h"
#import "UIView+WSCategory.h"
@implementation UIButton (Category)
#pragma mark - 图片预览
#pragma mark -预览图片 isZoom:是否允许捏合手势放大缩小
/**
 *  预览图片
 *
 *  @param isZoom 是否允许捏合手势放大缩小
 */
- (void)ws_previewImage_isZoom:(BOOL)isZoom
{
    UIImage *image=self.currentImage;
    [self ws_previewImage:image CanZoom:isZoom];
}
#pragma mark -预览背景图片 isZoom:是否允许捏合手势放大缩小
/**
 *  预览背景图片
 *
 *  @param isZoom 是否允许捏合手势放大缩小
 */
- (void)ws_previewBackgroudImage_isZoom:(BOOL)isZoom
{
    UIImage *bgImage = self.currentBackgroundImage;
    [self ws_previewImage:bgImage CanZoom:isZoom];
}
@end
