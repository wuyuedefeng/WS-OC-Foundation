//
//  YHCustomTabbar.h
//  CustomTabbar
//
//  Created by Jiang on 14-5-28.
//  Copyright (c) 2014年 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
@interface WSCustomTabbar : UITabBarController{
    NSMutableArray *buttons;
    int currentSelectedIndex;
    UIImageView *slideBg;
    
    NSMutableArray *_images;
    NSMutableArray *_selectedImages;
}

@property (nonatomic,assign) int currentSelectedIndex;
@property (nonatomic,retain) NSMutableArray *buttons;

- (void)hideRealTabBar;
- (void)customTabBar;
- (void)selectedTab:(UIButton *)button;


@end
