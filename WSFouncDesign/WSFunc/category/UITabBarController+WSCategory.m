//
//  UITabBarController+WSCategory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-8-21.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UITabBarController+WSCategory.h"

@implementation UITabBarController (Category)
#pragma mark - TabBarsa
- (void)ws_setTabBarButton_selectedColor:(UIColor *)color
{
    [[self tabBar]setTintColor:[UIColor redColor]];
}
@end
