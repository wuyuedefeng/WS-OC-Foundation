//
//  UIScreen+DK.h
//  DaniateKit
//
//  Created by Daniate on 14/8/2.
//  Copyright (c) 2014年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (DKRetinaScreen)
/*!
 *  判断屏幕是否为视网膜屏幕
 *
 *  @return 如果屏幕是视网膜屏幕,则返回YES;否则,返回NO.
 */
+ (BOOL)isRetinaScreen;
/*!
 *  判断屏幕是否为4英寸视网膜屏幕
 *
 *  @return 如果屏幕是4英寸视网膜屏幕,则返回YES;否则,返回NO.
 */
+ (BOOL)is4inchesRetinaScreen;
@end
