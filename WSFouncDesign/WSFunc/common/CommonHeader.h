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
#import "NSObject+Category.h"

/////=================1==============================
#pragma mark - ws_category
#pragma mark -NSString字符串分类
/**
 *正则匹配 判断用户名，邮箱，手机号码，是否合法等等等等
 *NSString+Category 对NSString进行分类
 **/
#import "NSString+Category.h"

/////==================2=============================
#pragma mark -NSDictionary字典分类
/**
 *NSDictionary+Category
 **/
#import "NSDictionary+Category.h"

/////=================3==============================
#pragma mark -NSArray数组分类
/**
 *NNSArray+Category
 **/
#import "NSArray+Category.h"

/////================4===============================
#pragma mark -NSData 二进制分类
/**
 *NSData+Category.h
 **/
#import "NSData+Category.h"

/////=================5==============================
#pragma mark -NSDate日期分类
/**
 *NSDate+Category.h
 **/
#import "NSDate+Category.h"

/////=================5==============================
#pragma mark -UIView分类
/**
 *UIView+Category
 **/
#import "UIView+Category.h"

/////=================6==============================
#pragma mark -UIButton分类
/**
 *UIButton+Category
 **/
#import "UIButton+Category.h"

/////=================7==============================
#pragma mark -UIViewController分类
/**
 *UIView+Category
 **/
#import "UIViewController+Category.h"

/////==================8=============================
#pragma mark -UITableViewCell分类
/**
 *UITableViewCell+Category.h
 **/
#import "UITableViewCell+Category.h"

/////==================9=============================
#pragma mark -UIDevice分类
/**
 *UIDevice+Category.h
 **/
#import "UIDevice+Category.h"
/////===============================================
/////===============================================
/////===============================================
/////===============================================
/////===============================================
/////===============================================
#pragma mark - founc封装
#pragma mark -模型转数组  数组转模型
/**
 *字典数组转模型数组
 *WSTransObjManager
 *
 **/
#import "WSTransObjManager.h"//模型转数组  数组转模型
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






