//
//  UIButton+WSCategory.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-23.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIButton (Category)
#pragma mark - 预览图片 isZoom:是否允许捏合手势放大缩小
- (void)ws_previewImage_isZoom:(BOOL)isZoom;
#pragma mark - 预览背景图片 isZoom:是否允许捏合手势放大缩小
- (void)ws_previewBackgroudImage_isZoom:(BOOL)isZoom;
#pragma mark -点击事件
//clcik事件直接封装成block
-(void)ws_clickEvent:(UIControlEvents)aEvent withClickBlick:(VoidBlock)buttonClickEvent;
@end
