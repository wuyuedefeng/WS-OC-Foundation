//
//  UINavigationController+WSCategory.h
//  WSFouncDesign
//
//  Created by TX-009 on 14-9-19.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (WSCategory)
- (BOOL)ws_isOnlyContainRootViewController;
- (UIViewController *)ws_rootViewController;

- (NSArray *)ws_popToViewControllerWithClass:(Class)viewControllerClass animated:(BOOL)animated;
- (NSArray *)ws_popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated;
@end
