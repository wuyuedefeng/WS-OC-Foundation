//
//  WSKeyboardManager.m
//  WSFouncDesign
//
//  Created by Daniate on 14/8/2.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "WSKeyboardManager.h"

//// 屏幕尺寸
//#define kDKScreenSize   ([UIScreen mainScreen].bounds.size)
//#define kDKScreenWidth  (kScreenSize.width)
//#define kDKScreenHeight (kScreenSize.height)

@interface WSKeyboardManager ()
@property (nonatomic, assign) CGSize originContentSize;
@property (nonatomic, assign) UIEdgeInsets originContentInset;
@property (nonatomic, assign) UIEdgeInsets originScrollIndicatorInsets;
- (void)handleKeyboardDidShow:(NSNotification *)notification;
- (void)handleKeyboardWillChangeFrame:(NSNotification *)notification;
- (void)handleKeyboardDidChangeFrame:(NSNotification *)notification;
- (void)handleKeyboardDidHide:(NSNotification *)notification;
- (void)scrollToAppropriatePosition:(NSNotification *)notification;
@end

@implementation WSKeyboardManager

@synthesize currentScrollView = _currentScrollView;
@synthesize activeTextField = _activeTextField;
@synthesize originContentSize = _originContentSize;
@synthesize originContentInset = _originContentInset;
@synthesize originScrollIndicatorInsets = _originScrollIndicatorInsets;

kWSStrictSingletonForClass(WSKeyboardManager)

- (void)setCurrentScrollView:(UIScrollView *)currentScrollView {
	if (_currentScrollView != currentScrollView) {
		_currentScrollView = currentScrollView;
		_originContentSize = currentScrollView.contentSize;
		_originContentInset = currentScrollView.contentInset;
		_originScrollIndicatorInsets = currentScrollView.scrollIndicatorInsets;
	}
}

- (void)registerKeyboardNotifications {
	NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
	[notificationCenter addObserver:self selector:@selector(handleKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[notificationCenter addObserver:self selector:@selector(handleKeyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
#ifdef __IPHONE_5_0
	if ([[[UIDevice currentDevice] systemVersion] compare:(@"5.0")] != NSOrderedAscending) {
		[notificationCenter addObserver:self selector:@selector(handleKeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
		[notificationCenter addObserver:self selector:@selector(handleKeyboardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
	}
#endif
	[notificationCenter addObserver:self selector:@selector(handleKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
	[notificationCenter addObserver:self selector:@selector(handleKeyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)removeKeyboardNotifications {
	NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
	[notificationCenter removeObserver:self name:UIKeyboardWillShowNotification object:nil];
	[notificationCenter removeObserver:self name:UIKeyboardDidShowNotification object:nil];
#ifdef __IPHONE_5_0
	if ([[[UIDevice currentDevice] systemVersion] compare:(@"5.0")] != NSOrderedAscending) {
		[notificationCenter removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
		[notificationCenter removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
	}
#endif
	[notificationCenter removeObserver:self name:UIKeyboardWillHideNotification object:nil];
	[notificationCenter removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

- (void)handleKeyboardWillShow:(NSNotification *)notification {
	[self scrollToAppropriatePosition:notification];
}

- (void)handleKeyboardDidShow:(NSNotification *)notification {
	[self scrollToAppropriatePosition:notification];
}

- (void)handleKeyboardWillChangeFrame:(NSNotification *)notification {
	// 什么都不做
}

- (void)handleKeyboardDidChangeFrame:(NSNotification *)notification {
	[self scrollToAppropriatePosition:notification];
}

- (void)handleKeyboardWillHide:(NSNotification *)notification {
	[self scrollToAppropriatePosition:notification];
}

- (void)handleKeyboardDidHide:(NSNotification *)notification {
	[self.currentScrollView setContentSize:self.originContentSize];
	[self.currentScrollView setContentInset:self.originContentInset];
	[self.currentScrollView setScrollIndicatorInsets:self.originScrollIndicatorInsets];
}

- (void)scrollToAppropriatePosition:(NSNotification *)notification {
	NSDictionary *userInfo = [notification userInfo];
	NSValue *keyboardFrameValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
	CGRect keyboardFrame = [keyboardFrameValue CGRectValue];
	CGPoint leftBottomPoint = [self.currentScrollView convertPoint:CGPointMake(0, CGRectGetMaxY(self.currentScrollView.bounds)) toView:nil];
	UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, CGRectGetHeight(keyboardFrame)-(CGRectGetMaxY([[UIApplication sharedApplication] keyWindow].bounds)-leftBottomPoint.y), 0);
	[self.currentScrollView setContentInset:contentInsets];
	[self.currentScrollView setScrollIndicatorInsets:contentInsets];
	CGRect scrollViewRect = CGRectZero;
	if (self.currentScrollView.superview) {
		scrollViewRect = [self.currentScrollView convertRect:self.currentScrollView.bounds toView:self.currentScrollView.superview];
	} else {
		scrollViewRect = [self.currentScrollView convertRect:self.currentScrollView.bounds toView:nil];
	}
	scrollViewRect.size.height -= contentInsets.bottom;
	if (self.activeTextField) {
		CGPoint p1 = [self.activeTextField convertPoint:CGPointMake(0, CGRectGetHeight(self.activeTextField.bounds)) toView:self.currentScrollView];
		if (CGRectContainsPoint(scrollViewRect, p1) == NO) {
			// 加上 30 是为了解决iOS 5.0以下版本键盘遮挡到中文的问题
			CGFloat delta = 30.0f;
			CGPoint scrollPoint = CGPointMake(0, p1.y - CGRectGetHeight(scrollViewRect) + delta);
			[self.currentScrollView setContentOffset:scrollPoint animated:YES];
			[self.currentScrollView setContentSize:CGSizeMake(self.originContentSize.width, self.originContentSize.height+delta)];
		}
	}
}

@end
