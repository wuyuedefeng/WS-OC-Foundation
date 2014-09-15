//
//  DKKeyboardManager.h
//  WSFouncDesign
//
//  Created by Daniate on 14/8/2.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSKeyboardManager : NSObject

@property (nonatomic, weak) UIScrollView *currentScrollView;
@property (nonatomic, weak) UIView *activeTextField;

+ (WSKeyboardManager *)sharedWSKeyboardManager;
- (void)registerKeyboardNotifications;
- (void)removeKeyboardNotifications;

@end
