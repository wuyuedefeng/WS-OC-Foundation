//
//  UIApplication+Category.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-8-5.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UIApplication+Category.h"

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
@end
