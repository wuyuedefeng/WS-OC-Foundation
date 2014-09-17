//
//  UIApplication+WSCategory.h
//  WSFouncDesign
//
//  Created by wangsen on 14-8-5.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>
// 状态栏的矩形框，iOS 8及之后的与iOS 8之前的不一样
#define kWSStatusBarFrame ([UIApplication sharedApplication].statusBarFrame)
// 项目发布版本字符串
#define kWSProjectReleaseVersionString ((NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"])

// 获取应用程序主窗口(也就是应用程序的第一个窗口)
#define kWSMainWindow ((UIWindow *)[[[UIApplication sharedApplication] windows] objectAtIndex:0])
#define kWSFirstWindow kWSMainWindow
#define kWSKeyWindow kWSMainWindow
@interface UIApplication (Category)
/*!
 * 打开iOS原生应用程序
 *
 * 地图:
 *		http:maps.apple.com/maps?ll=39.9,116.4&z=12
 *		http:maps.apple.com/maps?saddr=上海火车站&daddr=上海虹桥火车站
 *		http:maps.apple.com/maps?q=上海虹桥火车站
 *
 * 邮箱:
 * mailto:a@gmail.com,b@gmail.com?cc=c@gmail.com,d@gmail.com&bcc=e@gmail.com,f@gmail.com&subject=此处填写主题&body=此处填写内容
 *
 * 消息:
 *		sms:a@gmail.com
 *		sms:1311111111
 *
 * 电话:
 *		tel:1311111111
 *
 *
 *		https:itunes.apple.com/cn/app/wang-yi-xin-wen/id425349261?mt=8&uo=4
 *		https:itunes.apple.com/cn/app/sou-hu-shi-pin/id458587755?mt=8
 *
 * @param url URL(NSString/NSURL)
 */
// xxxxxxxxxxxxx


/*!
 * 打开iOS原生应用程序
 *
 * 地图:
 *		http:maps.apple.com/maps?ll=39.9,116.4&z=12
 *		http:maps.apple.com/maps?saddr=上海火车站&daddr=上海虹桥火车站
 *		http:maps.apple.com/maps?q=上海虹桥火车站
 *
 * 邮箱:
 * mailto:a@gmail.com,b@gmail.com?cc=c@gmail.com,d@gmail.com&bcc=e@gmail.com,f@gmail.com&subject=此处填写主题&body=此处填写内容
 *
 * 消息:
 *		sms:a@gmail.com
 *		sms:1311111111
 *
 * 电话:
 *		tel:1311111111
 *
 *
 *		https:itunes.apple.com/cn/app/wang-yi-xin-wen/id425349261?mt=8&uo=4
 *		https:itunes.apple.com/cn/app/sou-hu-shi-pin/id458587755?mt=8
 *
 *  @param url URL(NSString * or NSURL *)
 *  @param vc  如果不能打开指定的url，将使用vc呈现UIAlertController进行提示
 */
+ (void)openNativeAppWithURL:(id)url withVC:(UIViewController *)vc;
@end
