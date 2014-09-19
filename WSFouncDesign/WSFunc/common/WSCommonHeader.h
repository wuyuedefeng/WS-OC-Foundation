//
//  CommonHeader.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-16.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//
#ifndef WSFouncDesign_CommonHead_h
#define WSFouncDesign_CommonHead_h

/**
 *定义常用宏
 *NSLog
 *release模式通常会定义 __OPTIMIZE__，当然debug模式不会
 **/
#ifndef __OPTIMIZE__

# define NSLog(...) NSLog(__VA_ARGS__)
# define WSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
# define WSLogA(fmt, ...) { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show];}
# define WSLogS(fmt, ...) { dispatch_async(dispatch_get_main_queue(), ^{ UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; });}

#else

# define NSLog(...) {}
# define WSLog(...) {}
# define WSLogA(...) {}
# define WSLogS(...) {}
#endif
/**
 *  userDefault单利
 */
#define WS_USER_DEFAULT [NSUserDefaults standardUserDefaults]


//G－C－D
#define kGCDBackground(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define kGCDMain(block)       dispatch_async(dispatch_get_main_queue(),block)

//简单的以AlertView显示提示信息
#define wsAlertView(title, msg) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil]; \
[alert show];

//Block
typedef void(^VoidBlock)();
typedef BOOL(^BoolBlock)();
typedef int (^IntBlock) ();
typedef id  (^IDBlock)  ();

typedef void(^VoidBlock_int)(int);
typedef BOOL(^BoolBlock_int)(int);
typedef int (^IntBlock_int) (int);
typedef id  (^IDBlock_int)  (int);

typedef void(^VoidBlock_string)(NSString*);
typedef BOOL(^BoolBlock_string)(NSString*);
typedef int (^IntBlock_string) (NSString*);
typedef id  (^IDBlock_string)  (NSString*);

typedef void(^VoidBlock_id)(id);
typedef BOOL(^BoolBlock_id)(id);
typedef int (^IntBlock_id) (id);
typedef id  (^IDBlock_id)  (id);
//应用尺寸(不包括状态栏,通话时状态栏高度不是20，所以需要知道具体尺寸)
#define kContent_Height   ([UIScreen mainScreen].applicationFrame.size.height)
#define kContent_Width    ([UIScreen mainScreen].applicationFrame.size.width)
#define kContent_Frame    (CGRectMake(0, 0 ,kContent_Width,kContent_Height))
#define kContent_CenterX  kContent_Width/2
#define kContent_CenterY  kContent_Height/2
/*
 类似九宫格的九个点
 
 p1 --- p2 --- p3
 |      |      |
 p4 --- p5 --- p6
 |      |      |
 p7 --- p8 --- p9
 
 */
#define kWSP1 CGPointMake(0                 ,0)
#define kWSP2 CGPointMake(kContent_Width/2  ,0)
#define kWSP3 CGPointMake(kContent_Width    ,0)
#define kWSP4 CGPointMake(0                 ,kContent_Height/2)
#define kWSP5 CGPointMake(kContent_Width/2  ,kContent_Height/2)
#define kWSP6 CGPointMake(kContent_Width    ,kContent_Height/2)
#define kWSP7 CGPointMake(0                 ,kContent_Height)
#define kWSP8 CGPointMake(kContent_Width/2  ,kContent_Height)
#define kWSP9 CGPointMake(kContent_Width    ,kContent_Height)

//*********************************************










#pragma mark - 头文件
#pragma mark - 封装的视图头文件（View）
/////---------1------------------------------------
/**
 *所有视图头文件
 **/
#import "CommonViewHead.h"
#import "WSApp.h"

/////=================0==============================
#pragma mark - ws_category
#pragma mark -NSObject分类
/**
 *正则匹配 判断用户名，邮箱，手机号码，是否合法
 *NSString+Category 对NSString进行分类
 **/
#import "NSObject+WSCategory.h"

/////=================1==============================
#pragma mark - ws_category
#pragma mark -NSString字符串分类
/**
 *正则匹配 判断用户名，邮箱，手机号码，是否合法等等等等
 *NSString+Category 对NSString进行分类
 **/
#import "NSString+WSCategory.h"

/////==================2=============================
#pragma mark -NSDictionary字典分类
/**
 *NSDictionary+Category
 **/
#import "NSDictionary+WSCategory.h"
#import "NSMutableDictionary+WSCategory.h"

/////=================3==============================
#pragma mark -NSArray数组分类
/**
 *NNSArray+Category
 **/
#import "NSArray+WSCategory.h"
#import "NSMutableArray+WSCategory.h"

/////================4===============================
#pragma mark -NSData 二进制分类
/**
 *NSData+WSCategory.h
 **/
#import "NSData+WSCategory.h"

/////=================5==============================
#pragma mark -NSDate日期分类
/**
 *NSDate+WSCategory.h
 **/
#import "NSDate+WSCategory.h"

/////=================5==============================
#import "NSURL+WSCategory.h"
/////=================5==============================

#pragma mark -UIView分类
/**
 *UIView+Category
 **/
#import "UIView+WSCategory.h"
#import "UIView+Animation.h"
/////=================6==============================
#pragma mark -UIButton分类
/**
 *UIButton+Category
 **/
#import "UIButton+WSCategory.h"

/////=================7==============================
#import "UITextField+WSCategory.h"
/////=================7==============================
#pragma mark -UIViewController分类
/**
 *UIView+Category
 **/
#import "UIViewController+WSCategory.h"

#import "UINavigationController+WSCategory.h"
#import "UINavigationItem+WSCategory.h"

/////==================8=============================
#pragma mark -UITableViewCell分类
/**
 *UITableViewCell+WSCategory.h
 **/
#import "UITableViewCell+WSCategory.h"

/////==================9=============================
#pragma mark -UIDevice分类
/**
 *UIDevice+WSCategory.h
 **/
#import "UIDevice+WSCategory.h"
/////===============================================
#import "NSFileManager+WSCategory.h"
#import "UIColor+WSCategory.h"
#import "UIImage+WSCategory.h"
#import "UITabBarController+WSCategory.h"
#import "UIApplication+WSCategory.h"
#import "NSNotificationCenter+WSCategory.h"
/////===============================================
#import "WSKeyboardManager.h"
#import "WSKeyBoardAccessory.h"
/////===============================================
/////===============================================
/////===============================================
/////===============================================
#pragma mark - founc封装
#pragma mark -模型转数组  数组转模型
/**
 *字典数组转模型数组
 *WSTransObj
 *
 **/
#import "WSTransObj.h"//模型转数组  数组转模型
/////===============================================

#pragma mark -录音功能
/**
 *录音功能等
 *WSAudioRecordManager
 *框架支持：AVFoundation CoreAudio
 **/
#import "WSAudioRecordManager.h"
/////===============================================







#endif






