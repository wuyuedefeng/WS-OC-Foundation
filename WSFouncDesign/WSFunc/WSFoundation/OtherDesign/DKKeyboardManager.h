//
//  DKKeyboardManager.h
//  DaniateKit
//
//  Created by Daniate on 14/8/2.
//  Copyright (c) 2014年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKKeyboardManager : NSObject

@property (nonatomic, assign) UIScrollView *currentScrollView;
@property (nonatomic, assign) UITextField *activeTextField;

+ (DKKeyboardManager *)sharedDKKeyboardManager;
- (void)registerKeyboardNotifications;
- (void)removeKeyboardNotifications;

@end
