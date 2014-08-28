//
//  UIScreen+DK.m
//  DaniateKit
//
//  Created by Daniate on 14/8/2.
//  Copyright (c) 2014年 Daniate. All rights reserved.
//

#import "UIScreen+DK.h"

@implementation UIScreen (DKRetinaScreen)
+ (BOOL)isRetinaScreen {
#ifdef __IPHONE_4_0
	if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
		return ([[UIScreen mainScreen] scale] > 1.0f);
	}
#endif
#ifdef __IPHONE_3_2
	if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
		CGSize mainScreenSizeInPixels = [[[UIScreen mainScreen] currentMode] size];
		/*
		 Retina iPad 模拟器像素宽度为1536.0f，但真机像素宽度为2048.0f。
		 Retina iPhone/iPod Touch 模拟器/真机像素宽度为640.0f，
		 但为了防止出现类似iPad那样的情况，也检测960.0f和1136.0f。
		 */
		return CGSizeEqualToSize(mainScreenSizeInPixels, CGSizeMake(640.0f, 960.0f)) || CGSizeEqualToSize(mainScreenSizeInPixels, CGSizeMake(960.0f, 640.0f)) || CGSizeEqualToSize(mainScreenSizeInPixels, CGSizeMake(640.0f, 1136.0f)) || CGSizeEqualToSize(mainScreenSizeInPixels, CGSizeMake(1136.0f, 640.0f)) || CGSizeEqualToSize(mainScreenSizeInPixels, CGSizeMake(1536.0f, 2048.0f)) || CGSizeEqualToSize(mainScreenSizeInPixels, CGSizeMake(2048.0f, 1536.0f));
	}
#endif
	return NO;
}

+ (BOOL)is4inchesRetinaScreen {
	CGSize mainScreenSizeInPoints = [UIScreen mainScreen].bounds.size;
	return CGSizeEqualToSize(mainScreenSizeInPoints, CGSizeMake(320.0f, 568.0f)) || CGSizeEqualToSize(mainScreenSizeInPoints, CGSizeMake(568.0f, 320.0f));
}
@end
