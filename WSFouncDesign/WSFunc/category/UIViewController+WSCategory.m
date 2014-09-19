//
//  UIViewController+WSCategory.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-28.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "UIViewController+WSCategory.h"
@implementation UIViewController (Category)

//alertView弹出提示
- (void)messageBox:(NSString *)msg
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    });
}
#pragma mark - 导航栏
/**
 *  设置导航栏的背景颜色(全局)
 *
 *  @param color 导航栏背景颜色
 */
- (void)ws_SetNavigationBarBackColor:(UIColor *)color
{
    [[UINavigationBar appearance] setBarTintColor:color];
}
#pragma mark -设置导航栏左侧按钮
/**
 *  设置导航栏左侧按钮
 *
 *  @param image  按钮图片
 *  @param target 目标
 *  @param action 方法
 */
- (void)ws_SetLeftBarButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    [self ws_SetLeftBarButtonWithImage:image highImage:nil target:target action:action];
}
/**
 *  设置导航栏左侧按钮
 *
 *  @param image     按钮图片
 *  @param highImage 按钮高亮图片
 *  @param target    目标
 *  @param action    方法
 */
- (void)ws_SetLeftBarButtonWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    self.navigationItem.hidesBackButton = YES;
    
    UIButton *leftButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 29, 25)];
    [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [leftButton setImage:image forState:UIControlStateNormal];
    [leftButton setImage:highImage forState:UIControlStateHighlighted];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem=buttonItem;
    
}
/**
 *  设置导航栏左边按钮的字体颜色（全局）
 *
 *  @param color 字体颜色
 */
- (void)ws_SetLeftBarButtonTextColor:(UIColor *)color
{
    //返回按钮颜色
    [[UINavigationBar appearance]setTintColor:[UIColor greenColor]];
}
#pragma mark -设置导航栏右侧按钮
/**
 *  设置导航栏右侧按钮
 *
 *  @param image  按钮图片
 *  @param target 目标
 *  @param action 方法
 */
- (void)ws_SetRightBarButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    [self ws_SetRightBarButtonWithImage:image highImage:nil target:target action:action];
}
/**
 *  设置导航栏右侧按钮
 *
 *  @param image     按钮图片
 *  @param highImage 按钮高亮图片
 *  @param target    目标
 *  @param action    方法
 */
- (void)ws_SetRightBarButtonWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    
    UIButton *rightButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 29, 25)];
    [rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [rightButton setImage:image forState:UIControlStateNormal];
    [rightButton setImage:highImage forState:UIControlStateHighlighted];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=buttonItem;
}
#pragma mark -设置标题
/**
 *  设置导航栏标题的 颜色 和 字体
 *
 *  @param color 标题颜色
 *  @param font  标题字体
 */
- (void)ws_SetTitleText:(NSString *)title Color:(UIColor *)color font:(UIFont *)font
{
    self.title = title;
#if __IPHONE_OS_VERSION_MAX_ALLOWED == __IPHONE_7_0 || __IPHONE_OS_VERSION_MAX_ALLOWED == __IPHONE_5_0
    //设置标题颜色
    NSDictionary * dict=[NSDictionary dictionaryWithObjectsAndKeys:color,UITextAttributeTextColor,font,UITextAttributeFont, nil];
#else
    //设置标题颜色
    NSDictionary * dict=[NSDictionary dictionaryWithObjectsAndKeys:color,NSForegroundColorAttributeName,font,NSFontAttributeName, nil];
#endif
    self.navigationController.navigationBar.titleTextAttributes = dict;
}
/**
 *  设置导航栏标题的 view
 *
 *  @param tiltleView 标题颜色
 */
- (void)ws_SetTitleView:(UIView *)tiltleView
{
    [self.navigationItem setTitleView:tiltleView];
}
/**
 *  设置导航栏push到另一个导航栏的返回按钮
 *
 *  @param image     按钮图片
 *  @param target    目标
 *  @param action    方法
 */
- (void)ws_SetBackButtonWithWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    [self ws_SetBackButtonWithWithImage:image highImage:nil target:target action:action];
}
/**
 *  设置导航栏push到另一个导航栏的返回按钮
 *
 *  @param image     按钮图片
 *  @param highImage 按钮高亮图片
 *  @param target    目标
 *  @param action    方法
 */
- (void)ws_SetBackButtonWithWithImage:(UIImage *)image highImage:(UIImage *)highImage  target:(id)target action:(SEL)action
{
    
    UIButton *backButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 28)];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:highImage forState:UIControlStateHighlighted];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.backBarButtonItem=buttonItem;
}

#pragma mark - TabBarsa
- (void)ws_setTabBarButtonClickColor:(UIColor *)color
{
    [[self.tabBarController tabBar]setTintColor:[UIColor redColor]];
}

- (void)ws_loadAnimation_MBProgressHUD:(Block)block
{
    [self ws_loadAnimation_MBProgressHUD:block finishDid:nil];
}
- (void)ws_loadAnimation_MBProgressHUD:(Block)block finishDid:(Block)finishBlock
{
    static MBProgressHUD *HUD;
    if (!HUD) {
        //初始化进度框，置于当前的View当中
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        //如果设置此属性则当前的view置于后台
        //HUD.dimBackground = YES;
        [HUD setMode:MBProgressHUDModeIndeterminate];
    }
    
    //设置对话框文字
    //HUD.labelText = @"加载中";
    
    //显示对话框
    [HUD showAnimated:YES whileExecutingBlock:^{
        //对话框显示时需要执行的操作
        block();
    } completionBlock:^{
        //操作执行完后取消对话框
        if (finishBlock) {
            finishBlock();
        }
        [HUD removeFromSuperview];
        HUD = nil;
    }];

}

@end
