//
//  UINavigationController+WSCategory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-9-19.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UINavigationController+WSCategory.h"

@implementation UINavigationController (WSCategory)
- (BOOL)ws_isOnlyContainRootViewController
{
    if (self.viewControllers.count == 1) {
        return YES;
    }
    return NO;
}

- (UIViewController *)ws_rootViewController
{
    if (self.viewControllers.count > 0) {
        return [self.viewControllers firstObject];
    }
    return nil;
}

- (NSArray *)ws_popToViewControllerWithClass:(Class)viewControllerClass animated:(BOOL)animated
{
    NSInteger viewControllersCount = self.viewControllers.count;
    for (NSInteger i = viewControllersCount - 1; i >= 0; --i) {
        UIViewController *viewController = self.viewControllers[i];
        if ([viewController isKindOfClass:viewControllerClass]) {
            return [self popToViewController:viewController animated:animated];
        }
    }
    return nil;
}

- (NSArray *)ws_popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated
{
    NSInteger viewControllersCount = self.viewControllers.count;
    if (viewControllersCount > level) {
        NSInteger idx = viewControllersCount - level - 1;
        UIViewController *viewController = self.viewControllers[idx];
        return [self popToViewController:viewController animated:animated];
    } else {
        return [self popToRootViewControllerAnimated:animated];
    }
}
@end
