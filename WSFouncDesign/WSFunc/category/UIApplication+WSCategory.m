//
//  UIApplication+WSCategory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-8-5.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UIApplication+WSCategory.h"

@implementation UIApplication (Category)

+ (void)openNativeAppWithURL:(id)url withVC:(UIViewController *)vc {
	NSURL *url_ = nil;
	if ([url isKindOfClass:[NSString class]]) {
		url_ = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	} else if ([url isKindOfClass:[NSURL class]]) {
		url_ = url;
	}
	if (url_ != nil) {
		if ([[UIApplication sharedApplication] canOpenURL:url_]) {
			[[UIApplication sharedApplication] openURL:url_];
		} else {
			NSString *msg = [NSString stringWithFormat:@"不能打开url: %@", [url_ absoluteString]];
#ifdef __IPHONE_8_0
			if (kDKIsSysVersionGreaterThanOrEqualTo(@"8.0")) {
				UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
				[alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
					
				}]];
				[vc presentViewController:alert animated:YES completion:^() {
					
				}];
			} else {
#endif
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
				[alert show];
#if !__has_feature(objc_arc)
				[alert autorelease];
#endif
#ifdef __IPHONE_8_0
			}
#endif
		}
	}
}

/**
 *  @brief 检查是否iOS7+
 */
BOOL WSiOS7OrLater(void)
{
    static BOOL iOS7OrLater;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
        CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion]
                                 doubleValue];
        if (systemVersion >= 7.f) {
            iOS7OrLater = YES;
        } else {
            iOS7OrLater = NO;
        }
#else
        iOS7OrLater = NO;
#endif
    });
    WSLog(@"%@%@", @"iOS 7 Or Later : ", iOS7OrLater ? @"YES" : @"NO");
    return iOS7OrLater;
}

/**
 *  @brief 检查是否iOS8+
 */
extern BOOL WSiOS8OrLater(void)
{
    static BOOL iOS8OrLater;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
        CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion]
                                 doubleValue];
        if (systemVersion >= 8.f) {
            iOS8OrLater = YES;
        } else {
            iOS8OrLater = NO;
        }
#else
        iOS8OrLater = NO;
#endif
    });
    WSLog(@"%@%@", @"iOS 8 Or Later : ", iOS8OrLater ? @"YES" : @"NO");
    return iOS8OrLater;
}

@end
