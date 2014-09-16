//
//  UIDevice+WSCategory.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-29.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

// 屏幕尺寸
#define kWSScreenSize   ([UIScreen mainScreen].bounds.size)
#define kWSScreenWidth  (kWSScreenSize.width)
#define kWSScreenHeight (kWSScreenSize.height)

//----------------------系统----------------------------
//获取系统版本
#define IOS_Version [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

////判断是否 Retina屏、设备是否是4.0寸、是否是iPad
//#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//#define isScreen ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
////#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

//检查系统版本
#define kWSSYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define kWSSYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define kWSSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define kWSSYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define kWSSYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


//----------------------系统----------------------------


//----------------------内存----------------------------

//使用ARC和不使用ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif

#pragma mark - common functions
#define RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

//释放一个对象
#define SAFE_DELETE(P) if(P) { [P release], P = nil; }

#define SAFE_RELEASE(x) [x release];x=nil



//----------------------内存----------------------------
typedef enum
{
    UIDeviceUnknown,
    
    UIDeviceSimulator,
    UIDeviceSimulatoriPhone,
    UIDeviceSimulatoriPad,
    UIDeviceSimulatorAppleTV,
    
    UIDevice1GiPhone,
    UIDevice3GiPhone,
    UIDevice3GSiPhone,
    UIDevice4iPhone,
    UIDevice4SiPhone,
    UIDevice5iPhone,
    
    UIDevice1GiPod,
    UIDevice2GiPod,
    UIDevice3GiPod,
    UIDevice4GiPod,
    
    UIDevice1GiPad,
    UIDevice2GiPad,
    UIDevice3GiPad,
    UIDevice4GiPad,
    
    UIDeviceAppleTV2,
    UIDeviceAppleTV3,
    UIDeviceAppleTV4,
    
    UIDeviceUnknowniPhone,
    UIDeviceUnknowniPod,
    UIDeviceUnknowniPad,
    UIDeviceUnknownAppleTV,
    UIDeviceIFPGA,
    
} UIDevicePlatform;

typedef enum
{
    UIDeviceFamilyiPhone,
    UIDeviceFamilyiPod,
    UIDeviceFamilyiPad,
    UIDeviceFamilyAppleTV,
    UIDeviceFamilyUnknown,
    
} UIDeviceFamily;
@interface UIDevice (Category)
/**
 * Check if the device is running on ipad or not
 * @return YES if device is ipad
 */
+ (BOOL) isPad;
+ (BOOL) isPhone;
+ (BOOL) isPhone5;
#pragma mark - 是否有网络
+ (BOOL) isExistenceNetword;//判断是否有网络
/**
 */
+ (BOOL) isRetinaDisplay;
@end

@interface UIDevice (IdentifierAddition)

/*
 * @method uniqueDeviceIdentifier
 * @description use this method when you need a unique identifier in one app.
 * It generates a hash from the MAC-address in combination with the bundle identifier
 * of your app.
 */

- (NSString *) uniqueDeviceIdentifier;

/*
 * @method uniqueGlobalDeviceIdentifier
 * @description use this method when you need a unique global identifier to track a device
 * with multiple apps. as example a advertising network will use this method to track the device
 * from different apps.
 * It generates a hash from the MAC-address only.
 */

- (NSString *) uniqueGlobalDeviceIdentifier;


//////
#define IFPGA_NAMESTRING                @"iFPGA"

#define IPHONE_1G_NAMESTRING            @"iPhone 1G"
#define IPHONE_3G_NAMESTRING            @"iPhone 3G"
#define IPHONE_3GS_NAMESTRING           @"iPhone 3GS"
#define IPHONE_4_NAMESTRING             @"iPhone 4"
#define IPHONE_4S_NAMESTRING            @"iPhone 4S"
#define IPHONE_5_NAMESTRING             @"iPhone 5"
#define IPHONE_UNKNOWN_NAMESTRING       @"Unknown iPhone"

#define IPOD_1G_NAMESTRING              @"iPod touch 1G"
#define IPOD_2G_NAMESTRING              @"iPod touch 2G"
#define IPOD_3G_NAMESTRING              @"iPod touch 3G"
#define IPOD_4G_NAMESTRING              @"iPod touch 4G"
#define IPOD_UNKNOWN_NAMESTRING         @"Unknown iPod"

#define IPAD_1G_NAMESTRING              @"iPad 1G"
#define IPAD_2G_NAMESTRING              @"iPad 2G"
#define IPAD_3G_NAMESTRING              @"iPad 3G"
#define IPAD_4G_NAMESTRING              @"iPad 4G"
#define IPAD_UNKNOWN_NAMESTRING         @"Unknown iPad"

#define APPLETV_2G_NAMESTRING           @"Apple TV 2G"
#define APPLETV_3G_NAMESTRING           @"Apple TV 3G"
#define APPLETV_4G_NAMESTRING           @"Apple TV 4G"
#define APPLETV_UNKNOWN_NAMESTRING      @"Unknown Apple TV"

#define IOS_FAMILY_UNKNOWN_DEVICE       @"Unknown iOS device"

#define SIMULATOR_NAMESTRING            @"iPhone Simulator"
#define SIMULATOR_IPHONE_NAMESTRING     @"iPhone Simulator"
#define SIMULATOR_IPAD_NAMESTRING       @"iPad Simulator"
#define SIMULATOR_APPLETV_NAMESTRING    @"Apple TV Simulator" // :)

//iPhone 3G 以后各代的CPU型号和频率
#define IPHONE_3G_CPUTYPE               @"ARM11"
#define IPHONE_3G_CPUFREQUENCY          @"412MHz"
#define IPHONE_3GS_CPUTYPE              @"ARM Cortex A8"
#define IPHONE_3GS_CPUFREQUENCY         @"600MHz"
#define IPHONE_4_CPUTYPE                @"Apple A4"
#define IPHONE_4_CPUFREQUENCY           @"1GMHz"
#define IPHONE_4S_CPUTYPE               @"Apple A5 Double Core"
#define IPHONE_4S_CPUFREQUENCY          @"800MHz"

//iPod touch 4G 的CPU型号和频率
#define IPOD_4G_CPUTYPE                 @"Apple A4"
#define IPOD_4G_CPUFREQUENCY            @"800MHz"

#define IOS_CPUTYPE_UNKNOWN             @"Unknown CPU type"
#define IOS_CPUFREQUENCY_UNKNOWN        @"Unknown CPU frequency"



/** 获取设备型号*/
+ (NSString *)deviceVersion;

/** 获取iOS系统的版本号 */
+ (NSString*)systemVersion;

/** 判断当前设备是否ipad */
+ (BOOL)isIpad;

/** 判断当前设备是否iphone */
+ (BOOL)isIphone;

/** 判断当前系统是否有摄像头 */
+ (BOOL)hasCamera;

//获取设备状态，是否插入耳机，如果插入耳机，则返回“YES"
//+ (BOOL)isHeadphone;

//获取用户语言。
+ (NSString *)userPreferLanguages;

//判断是否为5系列。
+ (BOOL)isIphone5OriPod5;




- (NSString *)platformInfo;        //平台信息

- (NSString *)cpuType;             //cpu型号
- (NSString *)cpuFrequency;        //cpu频率
- (NSUInteger)cpuCount;            //cpu核数
- (NSArray *)cpuUsage;                 //cpu利用率

- (NSUInteger)totalMemoryBytes;    //获取手机内存总量,返回的是字节数
- (NSUInteger)freeMemoryBytes;     //获取手机可用内存,返回的是字节数

- (long long)freeDiskSpaceBytes;   //获取手机硬盘空闲空间,返回的是字节数
- (long long)totalDiskSpaceBytes;  //获取手机硬盘总空间,返回的是字节数

- (BOOL)isJailBreak;               //是否越狱

- (BOOL)bluetoothCheck;            //是否支持蓝牙
///////
@end
