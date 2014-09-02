//
//  UIView+Category.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-24.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "UIView+Category.h"
static CGRect oldRect;
static MBProgressHUD *HUD;
@implementation UIView (Category)
#pragma mark - 设置x y width height 。。。
/**
 *  设置视图的 x
 *
 *  @param x 新的frame的 x 的值
 */
- (void) setX:(CGFloat)x
{
    self.frame = rectSetX(self.frame, x);
}
/**
 *  设置视图的 y
 *
 *  @param y 新的frame的 y 的值
 */
- (void) setY:(CGFloat)y
{
    self.frame = rectSetY(self.frame, y);
}
/**
 *  设置视图的 width
 *
 *  @param width 新的frame的 width 的值
 */
- (void) setWidth:(CGFloat)width
{
    self.frame = rectSetWidth(self.frame, width);
}
/**
 *  设置视图的 height
 *
 *  @param height 新的frame的 height 的值
 */
- (void) setHeight:(CGFloat)height
{
    self.frame = rectSetHeight(self.frame, height);
}
/**
 *  设置视图的 origin
 *
 *  @param origin 新的frame的 origin 的值
 */
- (void) setOrigin:(CGPoint)origin
{
    self.frame = rectSetOrigin(self.frame, origin);
}
/**
 *  设置视图的 size
 *
 *  @param size 新的frame的 size 的值
 */
- (void) setSize:(CGSize)size
{
    self.frame = rectSetSize(self.frame, size);
}
//私有 x
CGRect rectSetX(CGRect rect, CGFloat x) {
	return CGRectMake(x, rect.origin.y, rect.size.width, rect.size.height);
}
//y
CGRect rectSetY(CGRect rect, CGFloat y) {
	return CGRectMake(rect.origin.x, y, rect.size.width, rect.size.height);
}
//width
CGRect rectSetWidth(CGRect rect, CGFloat width) {
	return CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height);
}
//height
CGRect rectSetHeight(CGRect rect, CGFloat height) {
	return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
}
//origin
CGRect rectSetOrigin(CGRect rect, CGPoint origin) {
	return CGRectMake(origin.x, origin.y, rect.size.width, rect.size.height);
}
//size
CGRect rectSetSize(CGRect rect, CGSize size) {
	return CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height);
}

/////////////

/**
 *  传入一个frame和对这个frame需要替换的x值，作为自己的frame
 *
 *  @param x    传入的需要替换frame的origin的x的值
 *  @param rect 传的的frame
 */
- (void) setX_New:(CGFloat)x fromRect:(CGRect)rect
{
    self.frame = CGRectMake(x, rect.origin.y, rect.size.width, rect.size.height);
}
- (void) setY_New:(CGFloat)y fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, y, rect.size.width, rect.size.height);
}
- (void) setWidth_New:(CGFloat)width fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height);
}
- (void) setHeight_New:(CGFloat)height fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
}
- (void) setOrigin_New:(CGPoint)origin fromRect:(CGRect)rect
{
    self.frame = CGRectMake(origin.x, origin.y, rect.size.width, rect.size.height);
}
- (void) setSize_New:(CGSize)size fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height);
}

- (void) setX_New:(CGFloat)x Y_New:(CGFloat)y fromRect:(CGRect)rect
{
    self.frame = CGRectMake(x, y, rect.size.width, rect.size.height);
}
- (void) setX_New:(CGFloat)x Width_New:(CGFloat)width fromRect:(CGRect)rect
{
    self.frame = CGRectMake(x, rect.origin.y, width, rect.size.height);
}
- (void) setX_New:(CGFloat)x Height_New:(CGFloat)height fromRect:(CGRect)rect
{
    self.frame = CGRectMake(x, rect.origin.y, rect.size.width, height);
}
- (void) setY_New:(CGFloat)y Width_New:(CGFloat)width fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, y, width, rect.size.height);
}
- (void) setY_New:(CGFloat)y Height_New:(CGFloat)height fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, y, rect.size.width, height);
}


- (void) setX_New:(CGFloat)x Y_Add:(CGFloat)y fromRect:(CGRect)rect
{
    self.frame = CGRectMake(x, rect.origin.y + y, rect.size.width, rect.size.height);
}
- (void) setX_New:(CGFloat)x Width_Add:(CGFloat)width fromRect:(CGRect)rect
{
    self.frame = CGRectMake(x, rect.origin.y, rect.size.width + width, rect.size.height);
}
- (void) setX_New:(CGFloat)x Height_Add:(CGFloat)height fromRect:(CGRect)rect
{
    self.frame = CGRectMake(x, rect.origin.y, rect.size.width, rect.size.height + height);
}
- (void) setY_New:(CGFloat)y Width_Add:(CGFloat)width fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, y, rect.size.width + width, rect.size.height);
}
- (void) setY_New:(CGFloat)y Height_Add:(CGFloat)height fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, y, rect.size.width,rect.size.height + height);
}
/////////////

/**
 *  传入一个frame和对这个frame需要基础上 加x 值，作为自己的frame
 *
 *  @param addX 需要添加的x的值
 *  @param rect 传入的frame
 */
- (void) setX_Add:(CGFloat)addX fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x + addX, rect.origin.y, rect.size.width, rect.size.height);
}
- (void) setY_Add:(CGFloat)addY fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, rect.origin.y + addY, rect.size.width, rect.size.height);
}
- (void) setWidth_Add:(CGFloat)addWidth fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width + addWidth, rect.size.height);
}
- (void) setHeight_Add:(CGFloat)addHeight fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height + addHeight);
}
- (void) setOrigin_Add:(CGPoint)addOrigin fromRect:(CGRect)rect
{
    self.frame = CGRectMake(addOrigin.x + rect.origin.x, addOrigin.y + rect.origin.y, rect.size.width, rect.size.height);
}
- (void) setSize_Add:(CGSize)addSize fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, rect.origin.y, addSize.width + rect.size.width, addSize.height + rect.size.height);
}
//-----
- (void) setX_Add:(CGFloat)addX Y_Add:(CGFloat)addY fromRect:(CGRect)rect;
{
   self.frame = CGRectMake(rect.origin.x + addX, rect.origin.y + addY, rect.size.width, rect.size.height);
}
- (void) setX_Add:(CGFloat)addX Width_Add:(CGFloat)addWidth fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x + addX, rect.origin.y, rect.size.width + addWidth, rect.size.height);
}
- (void) setX_Add:(CGFloat)addX Height_Add:(CGFloat)addHeight fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x + addX, rect.origin.y, rect.size.width, rect.size.height + addHeight);
}
- (void) setY_Add:(CGFloat)addY Width_Add:(CGFloat)addWidth fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, rect.origin.y + addY, rect.size.width + addWidth, rect.size.height);
}
- (void) setY_Add:(CGFloat)addY Height_Add:(CGFloat)addHeight fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, rect.origin.y + addY, rect.size.width, rect.size.height + addHeight);
}
//-----
- (void) setX_Add:(CGFloat)addX Y_New:(CGFloat)newY fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x + addX, newY, rect.size.width, rect.size.height);
}
- (void) setX_Add:(CGFloat)addX Width_New:(CGFloat)newWidth fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x + addX, rect.origin.y, newWidth, rect.size.height);
}
- (void) setX_Add:(CGFloat)addX Height_New:(CGFloat)newHeight fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x + addX, rect.origin.y, rect.size.width, newHeight);
}
- (void) setY_Add:(CGFloat)addY Width_New:(CGFloat)newWidth fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, rect.origin.y + addY, newWidth, rect.size.height);
}
- (void) setY_Add:(CGFloat)addY Height_New:(CGFloat)newHeight fromRect:(CGRect)rect
{
    self.frame = CGRectMake(rect.origin.x, rect.origin.y + addY, rect.size.width, newHeight);
}
/////////////
/**
 *  获得 frame的 x 的值
 *
 *  @return 获得 frame的 x 的值
 */
- (CGFloat) x
{
    return self.frame.origin.x;
}
/**
 *  获得 frame的 y 的值
 *
 *  @return 获得 frame的 y 的值
 */
- (CGFloat) y
{
    return self.frame.origin.y;
}
/**
 *  获得 frame的 width 的值
 *
 *  @return 获得 frame的 width 的值
 */
- (CGFloat) width
{
    return self.frame.size.width;
}
/**
 *  获得 frame的 height 的值
 *
 *  @return 获得 frame的 height 的值
 */
- (CGFloat) height
{
    return self.frame.size.height;
}
/**
 *  获得 frame的 origin 的值
 *
 *  @return 获得 frame的 origin 的值
 */
- (CGPoint) origin
{
    return self.frame.origin;
}
/**
 *  获得 frame的 size 的值
 *
 *  @return 获得 frame的 size 的值
 */
- (CGSize)  size
{
    return self.frame.size;
}
#pragma mark - 圆形视图
/**
 *  将视图 转换 成 圆形
 */
- (void)ws_becomeCircleView
{
    [self.layer setCornerRadius:[self height]/2.0];
    [self.layer setMasksToBounds:YES];
}
#pragma mark -预览图片 image:需要预览的图片 isZoom:是否允许放大
/**
 *  预览图片 从本view跳出
 *
 *  @param image  要预览的图片
 *  @param isZoom 是否支持手势缩放
 */
- (void)ws_previewImage:(UIImage *)image CanZoom:(BOOL)isZoom
{
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    oldRect=[self convertRect:self.bounds toView:window];
    backgroundView.backgroundColor=[UIColor blackColor];
    backgroundView.alpha=0;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldRect];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image=image;
    imageView.tag=1;
    
    UIScrollView *scrollView;
    if (isZoom) {
        //参考：http://www.cnblogs.com/qiqibo/p/3496223.html
        scrollView = [[UIScrollView alloc] initWithFrame:backgroundView.bounds];
        scrollView.delegate = self;
        scrollView.tag = 2;
        [scrollView addSubview:imageView];
        scrollView.contentSize = image.size;
        
        [scrollView addSubview:imageView];
        [backgroundView addSubview:scrollView];
    }
    else
    {
        [backgroundView addSubview:imageView];
    }
    [window addSubview:backgroundView];
    //添加手势
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideWSImage:)];
    [backgroundView addGestureRecognizer: tap];
    //执行动画
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        backgroundView.alpha=1;
    } completion:^(BOOL finished) {
        
        if (isZoom) {
            CGRect scrollViewFrame = scrollView.frame;
            CGFloat scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width;
            CGFloat scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height;
            CGFloat minScale = MIN(scaleWidth, scaleHeight);
            scrollView.minimumZoomScale = minScale;
            scrollView.contentSize = imageView.size;
            
            // 5
            scrollView.maximumZoomScale = 2.0f;
            //scrollView.zoomScale = minScale;
            // 6
            //[self centerScrollViewContentsWithScrollView:scrollView andImageView:imageView];
        }
        
        
    }];
}
/**
 *  根据图片url预览图片
 *   SDWebImageView
 *  @param urlStr 图片地址自付出
 *  @param isZoom 是否允许手势缩放与放大
 */
- (void)ws_previewImageUrlStr:(NSString *)urlStr placeholderImage:(UIImage *)placeHolderImage CanZoom:(BOOL)isZoom
{
//    [self ws_previewImageUrlStr:urlStr placeholderImage:placeHolderImage CanZoom:isZoom options:SDWebImageProgressiveDownload HUDMode:MBProgressHUDModeIndeterminate];
    [self ws_previewImageUrlStr:urlStr placeholderImage:placeHolderImage CanZoom:isZoom options:SDWebImageDelayPlaceholder];
}
- (void)ws_previewImageUrlStr:(NSString *)urlStr placeholderImage:(UIImage *)placeHolderImage CanZoom:(BOOL)isZoom options:(SDWebImageOptions)options
{
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [window addSubview:backgroundView];
    oldRect=[self convertRect:self.bounds toView:window];
    backgroundView.backgroundColor=[UIColor blackColor];
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:window.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    UIScrollView *scrollView;
    if (isZoom) {
        //参考：http://www.cnblogs.com/qiqibo/p/3496223.html
        scrollView = [[UIScrollView alloc] initWithFrame:backgroundView.bounds];
        scrollView.delegate = self;
        scrollView.tag = 2;
        [scrollView addSubview:imageView];
        imageView.image = placeHolderImage;
        
        [scrollView addSubview:imageView];
        [backgroundView addSubview:scrollView];
    }
    else
    {
        [backgroundView addSubview:imageView];
    }
   
    if ([urlStr ws_isNotNilString]) {
        __block UIActivityIndicatorView *activityIndicator;
        __weak UIImageView *weakImageView = imageView;
        __weak UIImage *weakImage = placeHolderImage;
        __weak UIScrollView *weakScrollView = scrollView;
        [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:placeHolderImage options:options progress:^(NSInteger receivedSize, NSInteger expectedSize)
        {
              if (!activityIndicator) {
                  [weakImageView addSubview:activityIndicator = [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge]];
                  activityIndicator.center = weakImageView.center;
                  [activityIndicator startAnimating];
              }
            
        }
        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
        {
            [activityIndicator removeFromSuperview];
            activityIndicator = nil;
            
            if (image == nil) {
                image = weakImage;
            }
            if (image == nil) {
                return ;
            }
            weakImageView.tag=1;
            
            if (isZoom) {
                scrollView.contentSize = image.size;
            }
            
            //添加手势
            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideWSImage:)];
            [backgroundView addGestureRecognizer: tap];
            //执行动画
            [UIView animateWithDuration:0.3 animations:^{
                weakImageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
                backgroundView.alpha=1;
            } completion:^(BOOL finished) {
                
                if (isZoom) {
                    CGRect scrollViewFrame = weakScrollView.frame;
                    CGFloat scaleWidth = scrollViewFrame.size.width / weakScrollView.contentSize.width;
                    CGFloat scaleHeight = scrollViewFrame.size.height / weakScrollView.contentSize.height;
                    CGFloat minScale = MIN(scaleWidth, scaleHeight);
                    weakScrollView.minimumZoomScale = minScale;
                    weakScrollView.contentSize = imageView.size;
                    
                    // 5
                    weakScrollView.maximumZoomScale = image.size.width/kWSScreenWidth>image.size.height/kWSScreenHeight?image.size.width/kWSScreenWidth:image.size.height/kWSScreenHeight;
                    if (weakScrollView.maximumZoomScale < 2) {
                        weakScrollView.maximumZoomScale = 2;
                    }
                    //scrollView.zoomScale = minScale;
                    // 6
                    //[self centerScrollViewContentsWithScrollView:scrollView andImageView:imageView];
                }
                
                
            }];
            
            
        }];
        
    }
    
}
- (void)ws_previewImageUrlStr:(NSString *)urlStr placeholderImage:(UIImage *)placeHolderImage CanZoom:(BOOL)isZoom options:(SDWebImageOptions)options HUDMode:(MBProgressHUDMode)mode
{
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [window addSubview:backgroundView];
    oldRect=[self convertRect:self.bounds toView:window];
    backgroundView.backgroundColor=[UIColor blackColor];
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:window.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    UIScrollView *scrollView;
    if (isZoom) {
        //参考：http://www.cnblogs.com/qiqibo/p/3496223.html
        scrollView = [[UIScrollView alloc] initWithFrame:backgroundView.bounds];
        scrollView.delegate = self;
        scrollView.tag = 2;
        [scrollView addSubview:imageView];
        imageView.image = placeHolderImage;
        
        [scrollView addSubview:imageView];
        [backgroundView addSubview:scrollView];
    }
    else
    {
        [backgroundView addSubview:imageView];
    }
    
    if ([urlStr ws_isNotNilString]) {
        __weak UIImageView *weakImageView = imageView;
        __weak UIImage *weakImage = placeHolderImage;
        __weak UIScrollView *weakScrollView = scrollView;
        [HUD removeFromSuperview];
        HUD = nil;
        [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:placeHolderImage options:options progress:^(NSInteger receivedSize, NSInteger expectedSize)
         {
             static BOOL isProgress;
             if (!HUD) {
                 isProgress = NO;
                 HUD = [[MBProgressHUD alloc] initWithView:weakImageView];
                 [weakImageView addSubview:HUD];
                 
                 [HUD setMode:mode];
                 if (mode == MBProgressHUDModeDeterminate || mode == MBProgressHUDModeDeterminateHorizontalBar || mode == MBProgressHUDModeAnnularDeterminate) {
                     isProgress = YES;
                     HUD.progress = receivedSize/expectedSize;
                 }
                 [HUD show:YES];
             }
             if (isProgress) {
                 HUD.progress = receivedSize/1.0/expectedSize;
             }
             
             
         }completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
         {
             [HUD removeFromSuperview];
             HUD = nil;
             
             
             if (image == nil) {
                 image = weakImage;
             }
             if (image == nil) {
                 return ;
             }
             weakImageView.tag=1;
             
             if (isZoom) {
                 scrollView.contentSize = image.size;
             }
             
             //添加手势
             UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideWSImage:)];
             [backgroundView addGestureRecognizer: tap];
             //执行动画
             [UIView animateWithDuration:0.3 animations:^{
                 weakImageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
                 backgroundView.alpha=1;
             } completion:^(BOOL finished) {
                 
                 if (isZoom) {
//                     CGRect scrollViewFrame = weakScrollView.frame;
//                     CGFloat scaleWidth = scrollViewFrame.size.width / weakScrollView.contentSize.width;
//                     CGFloat scaleHeight = scrollViewFrame.size.height / weakScrollView.contentSize.height;
//                     CGFloat minScale = MIN(scaleWidth, scaleHeight);
                     weakScrollView.minimumZoomScale = 1;
                     weakScrollView.contentSize = imageView.size;
                     
                     // 5
                     weakScrollView.maximumZoomScale = image.size.width/kWSScreenWidth>image.size.height/kWSScreenHeight?image.size.width/kWSScreenWidth:image.size.height/kWSScreenHeight;
                     if (weakScrollView.maximumZoomScale < 2) {
                         weakScrollView.maximumZoomScale = 2;
                     }

                     
                     //scrollView.zoomScale = minScale;
                     // 6
                     //[self centerScrollViewContentsWithScrollView:scrollView andImageView:imageView];
                 }
                 
                 
             }];
             
             
         }];
        
    }
    
}
- (void)centerScrollViewContentsWithScrollView:(UIScrollView *)scrollView andImageView:(UIImageView *)imageView {
    CGSize boundsSize = scrollView.bounds.size;
    CGRect contentsFrame = imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    imageView.frame = contentsFrame;
}
- (void)hideWSImage:(UITapGestureRecognizer*)tap
{
    UIView *backgroundView=tap.view;
    
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:1];
    UIScrollView *scrollView = (UIScrollView *)[backgroundView viewWithTag:2];
    scrollView.contentOffset = CGPointZero;
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=oldRect;
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}
#pragma mark -scrollViewDelegate
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // Return the view that you want to zoom
    UIImageView *imageView = (UIImageView *)[scrollView viewWithTag:1];
    return imageView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    // The scroll view has zoomed, so you need to re-center the contents
    UIImageView *imageView = (UIImageView *)[scrollView viewWithTag:1];
    [self centerScrollViewContentsWithScrollView:scrollView andImageView:imageView];
}
#pragma mark - 传如父窗口类型 获取父窗口实例对象
/////////////

/**
 *  获取父类（包括超父类）对象
 *
 *  @param aClass 父类类型
 *
 *  @return 父类对象 找不到返回nil
 */
- (UIView *)ws_superview_withSuperClassType:(Class)aClass
{
	if (self.superview) {
		if ([self.superview isKindOfClass:aClass]) {
			return self.superview;
		} else {
			return [self.superview ws_superview_withSuperClassType:aClass];
		}
	} else {
		return nil;
	}
}

- (NSString *)ws_digView
{
    if ([self isKindOfClass:[UITableViewCell class]]) return @"";
    // 1. 初始化
    NSMutableString *xml = [NSMutableString string];
    
    // 2. 标签开头
    [xml appendFormat:@"<%@ frame=\"%@\"", self.class, NSStringFromCGRect(self.frame)];
    if (!CGPointEqualToPoint(self.bounds.origin, CGPointZero)) {
        [xml appendFormat:@" bounds=\"%@\"", NSStringFromCGRect(self.bounds)];
    }
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scroll = (UIScrollView *)self;
        if (!UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, scroll.contentInset)) {
            [xml appendFormat:@" contentInset=\"%@\"", NSStringFromUIEdgeInsets(scroll.contentInset)];
        }
    }
    
    // 3. 判断是否要结束
    if (self.subviews.count == 0) {
        [xml appendString:@" />"];
        return xml;
    } else {
        [xml appendString:@">"];
    }
    
    // 4. 遍历所有的子控件
    for (UIView *child in self.subviews) {
        NSString *childXml = [child ws_digView];
        [xml appendString:childXml];
    }
    
    // 5. 标签结尾
    [xml appendFormat:@"</%@>", self.class];
    WSLogS(@"%@",xml);
    return xml;
}

- (void)ws_loadAnimation:(Block)block
{
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    if (activityIndicator) {
        [self addSubview:activityIndicator];
        activityIndicator.center = self.center;
        [activityIndicator startAnimating];
        __block UIActivityIndicatorView *weakActivityIndicatorView = activityIndicator;
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
            [weakActivityIndicatorView removeFromSuperview];
            weakActivityIndicatorView = nil;
        });
    }
}
- (void)ws_loadAnimation_MBProgressHUD:(Block)block
{
    [UIView ws_loadAnimation_MBProgressHUD:block inView:self];
}
+ (void)ws_loadAnimation_MBProgressHUD:(Block)block inView:(UIView *)inView
{
    //初始化进度框，置于当前的View当中
    HUD = [[MBProgressHUD alloc] initWithView:inView];
    [inView addSubview:HUD];
    
    //如果设置此属性则当前的view置于后台
    //HUD.dimBackground = YES;
    [HUD setMode:MBProgressHUDModeIndeterminate];
    //设置对话框文字
    HUD.labelText = @"Loading";
    
    //显示对话框
    [HUD showAnimated:YES whileExecutingBlock:^{
        //对话框显示时需要执行的操作
        block();
    } completionBlock:^{
        //操作执行完后取消对话框
        [HUD removeFromSuperview];
        HUD = nil;
    }];

}

- (void)test1
{
    
}
@end
