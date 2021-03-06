//
//  UIView+WSCategory.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-24.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "UIImageView+WebCache.h"
typedef enum {
	WSUIViewAlignmentUnchanged,
	WSUIViewAlignmentLeftAligned,
	WSUIViewAlignmentRightAligned,
	WSUIViewAlignmentCenter
} WSUIViewAlignment;
@interface UIView (Category)<UIScrollViewDelegate>
#pragma mark - 设置x y width height 。。。
- (void) setX:(CGFloat)x;
- (void) setY:(CGFloat)y;
- (void) setWidth:(CGFloat)width;
- (void) setHeight:(CGFloat)height;
- (void) setOrigin:(CGPoint)origin;
- (void) setSize:(CGSize)size;


- (void) setX_New:(CGFloat)x fromRect:(CGRect)rect;
- (void) setY_New:(CGFloat)y fromRect:(CGRect)rect;
- (void) setWidth_New:(CGFloat)width fromRect:(CGRect)rect;
- (void) setHeight_New:(CGFloat)height fromRect:(CGRect)rect;
- (void) setOrigin_New:(CGPoint)origin fromRect:(CGRect)rect;
- (void) setSize_New:(CGSize)size fromRect:(CGRect)rect;

- (void) setX_New:(CGFloat)x Y_New:(CGFloat)y fromRect:(CGRect)rect;
- (void) setX_New:(CGFloat)x Width_New:(CGFloat)width fromRect:(CGRect)rect;
- (void) setX_New:(CGFloat)x Height_New:(CGFloat)height fromRect:(CGRect)rect;
- (void) setY_New:(CGFloat)y Width_New:(CGFloat)width fromRect:(CGRect)rect;
- (void) setY_New:(CGFloat)y Height_New:(CGFloat)height fromRect:(CGRect)rect;

- (void) setX_New:(CGFloat)x Y_Add:(CGFloat)y fromRect:(CGRect)rect;
- (void) setX_New:(CGFloat)x Width_Add:(CGFloat)width fromRect:(CGRect)rect;
- (void) setX_New:(CGFloat)x Height_Add:(CGFloat)height fromRect:(CGRect)rect;
- (void) setY_New:(CGFloat)y Width_Add:(CGFloat)width fromRect:(CGRect)rect;
- (void) setY_New:(CGFloat)y Height_Add:(CGFloat)height fromRect:(CGRect)rect;


- (void) setX_Add:(CGFloat)addX fromRect:(CGRect)rect;
- (void) setY_Add:(CGFloat)addY fromRect:(CGRect)rect;
- (void) setWidth_Add:(CGFloat)addWidth fromRect:(CGRect)rect;
- (void) setHeight_Add:(CGFloat)addHeight fromRect:(CGRect)rect;
- (void) setOrigin_Add:(CGPoint)addOrigin fromRect:(CGRect)rect;
- (void) setSize_Add:(CGSize)addSize fromRect:(CGRect)rect;

- (void) setX_Add:(CGFloat)addX Y_Add:(CGFloat)addY fromRect:(CGRect)rect;
- (void) setX_Add:(CGFloat)addX Width_Add:(CGFloat)addWidth fromRect:(CGRect)rect;
- (void) setX_Add:(CGFloat)addX Height_Add:(CGFloat)addHeight fromRect:(CGRect)rect;
- (void) setY_Add:(CGFloat)addY Width_Add:(CGFloat)addWidth fromRect:(CGRect)rect;
- (void) setY_Add:(CGFloat)addY Height_Add:(CGFloat)addHeight fromRect:(CGRect)rect;

- (void) setX_Add:(CGFloat)addX Y_New:(CGFloat)newY fromRect:(CGRect)rect;
- (void) setX_Add:(CGFloat)addX Width_New:(CGFloat)newWidth fromRect:(CGRect)rect;
- (void) setX_Add:(CGFloat)addX Height_New:(CGFloat)newHeight fromRect:(CGRect)rect;
- (void) setY_Add:(CGFloat)addY Width_New:(CGFloat)newWidth fromRect:(CGRect)rect;
- (void) setY_Add:(CGFloat)addY Height_New:(CGFloat)newHeight fromRect:(CGRect)rect;

- (CGFloat) x;
- (CGFloat) y;
- (CGFloat) width;
- (CGFloat) height;
- (CGPoint) origin;
- (CGSize)  size;

//===========================================================
#pragma mark -
#pragma mark Position Views
//==//=========================================================
//=ws=//
- (void)positionUnderView_boundsEqual:(UIView *)view padding:(CGFloat)padding;
- (void)positionUnderView_WidthEqual:(UIView *)view height:(CGFloat)height padding:(CGFloat)padding;
// positions current view directly under the given view
- (void)positionUnderView:(UIView *)view;
// positions current view under a given view with a specified y-padding
- (void)positionUnderView:(UIView *)view padding:(CGFloat)padding;

// positions current view directly under the given view and aligns horizontally
- (void)positionUnderView:(UIView *)view alignment:(WSUIViewAlignment)alignment;
// positions current view under a given view with a specified y-padding and aligns horizontally
- (void)positionUnderView:(UIView *)view padding:(CGFloat)padding alignment:(WSUIViewAlignment)alignment;

// adds the subview as a subview of the current view and centers it
- (void)addCenteredSubview:(UIView *)subview;
// moves the current view to the center of it's superview
- (void)moveToCenterOfSuperview;

//===========================================================
#pragma mark -
#pragma mark Rounded Corners
//===========================================================

- (void)setCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

//===========================================================
#pragma mark -
#pragma mark Shadows
//===========================================================

- (void)setShadowOffset:(CGSize)offset radius:(CGFloat)radius opacity:(CGFloat)opacity;

//===========================================================
#pragma mark -
#pragma mark Gradient Background
//===========================================================

- (void)setGradientBackgroundWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor;
//===========================================================
//===========================================================
//===========================================================
//////===========================================================
///获取可响应控件所在的controller
- (UIViewController *)viewController;
#pragma mark - 圆形视图
- (void)ws_becomeCircleView;
#pragma mark - 预览图片 image:需要预览的图片 isZoom:是否允许放大
- (void)ws_previewImage:(UIImage *)image CanZoom:(BOOL)isZoom;
- (void)ws_previewImageUrlStr:(NSString *)urlStr placeholderImage:(UIImage *)placeHolderImage CanZoom:(BOOL)isZoom;
- (void)ws_previewImageUrlStr:(NSString *)urlStr placeholderImage:(UIImage *)placeHolderImage CanZoom:(BOOL)isZoom options:(SDWebImageOptions)options;
- (void)ws_previewImageUrlStr:(NSString *)urlStr placeholderImage:(UIImage *)placeHolderImage CanZoom:(BOOL)isZoom options:(SDWebImageOptions)options HUDMode:(MBProgressHUDMode)mode;
#pragma mark - 传如父窗口类型 获取父窗口实例对象
- (UIView *)ws_superview_withSuperClassType:(Class)aClass;
#pragma mark - 便利子控件
- (NSString *)ws_digView;

typedef void(^Block)(void);
#pragma 加载过程
- (void)ws_loadAnimation:(Block)block;
- (void)ws_loadAnimation_MBProgressHUD:(Block)block;
+ (void)ws_loadAnimation_MBProgressHUD:(Block)block inView:(UIView *)inView;
@end
