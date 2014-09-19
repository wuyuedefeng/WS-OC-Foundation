//
//  UINavigationItem+WSCategory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-9-19.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UINavigationItem+WSCategory.h"

@implementation UINavigationItem (WSCategory)
- (void)ws_lockRightItem:(BOOL)lock
{
    NSArray *rightBarItems = self.rightBarButtonItems;
    if ([rightBarItems count]) {
        [rightBarItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[UIBarButtonItem class]] ||
                [obj isMemberOfClass:[UIBarButtonItem class]])
            {
                UIBarButtonItem *barButtonItem = (UIBarButtonItem *)obj;
                barButtonItem.enabled = !lock;
            }
        }];
    }
}

- (void)ws_lockLeftItem:(BOOL)lock
{
    NSArray *leftBarItems = self.leftBarButtonItems;
    if ([leftBarItems count]) {
        [leftBarItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[UIBarButtonItem class]] ||
                [obj isMemberOfClass:[UIBarButtonItem class]])
            {
                UIBarButtonItem *barButtonItem = (UIBarButtonItem *)obj;
                barButtonItem.enabled = !lock;
            }
        }];
    }
}
@end
