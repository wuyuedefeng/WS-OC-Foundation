//
//  UIAlertView+WSCategory.h
//  WSFouncDesign
//
//  Created by TX-009 on 14-9-17.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>
/*using
 Usage
 
 [[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Do you want to delete this item?"
 cancelButtonTitle:@"Cancel" otherButtonTitle:@"Delete"]
 showUsingBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
 if (buttonIndex == 1) {
 // delete
 }
 }];
 
 
 [[[UIAlertView alloc] initWithTitle:@"Alert" message:@"What do you want?"
 cancelButtonTitle:@"Cancel"
 otherButtonTitles:@[@"Mark as unread", @"Archive", @"Delete"]]
 showUsingBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
 if (buttonIndex == 1) {
 // mark as unread
 } else if (buttonIndex == 2) {
 // archive
 } else if (buttonIndex == 3) {
 // delete
 }
 }];
 
 
 [[[UIAlertView alloc] initWithMessage:@"Timer done"
 cancelButtonTitle:@"Okay"]
 showUsingBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
 // stop timer sound
 }];
 */
typedef void (^UIAlertViewBlock) (UIAlertView *alertView);
typedef void (^UIAlertViewCompletionBlock) (UIAlertView *alertView, NSInteger buttonIndex);
@interface UIAlertView (WSCategory)
+ (instancetype)ws_alertViewWithTitle:(NSString *)title
                              message:(NSString *)message
                                style:(UIAlertViewStyle)style
                    cancelButtonTitle:(NSString *)cancelButtonTitle
                    otherButtonTitles:(NSArray *)otherButtonTitles
                             tapBlock:(UIAlertViewCompletionBlock)tapBlock;

+ (instancetype)ws_alertViewWithTitle:(NSString *)title
                              message:(NSString *)message
                    cancelButtonTitle:(NSString *)cancelButtonTitle
                    otherButtonTitles:(NSArray *)otherButtonTitles
                             tapBlock:(UIAlertViewCompletionBlock)tapBlock;

+ (instancetype)ws_alertViewWithTitle:(NSString *)title
                              message:(NSString *)message
                    cancelButtonTitle:(NSString *)cancelButtonTitle
                    otherButtonTitle:(NSString *)otherButton
                             tapBlock:(UIAlertViewCompletionBlock)tapBlock;

@property (copy, nonatomic) UIAlertViewCompletionBlock tapBlock;
@property (copy, nonatomic) UIAlertViewCompletionBlock willDismissBlock;
@property (copy, nonatomic) UIAlertViewCompletionBlock didDismissBlock;

@property (copy, nonatomic) UIAlertViewBlock willPresentBlock;
@property (copy, nonatomic) UIAlertViewBlock didPresentBlock;
@property (copy, nonatomic) UIAlertViewBlock cancelBlock;

@property (copy, nonatomic) BOOL(^shouldEnableFirstOtherButtonBlock)(UIAlertView *alertView);
@end
