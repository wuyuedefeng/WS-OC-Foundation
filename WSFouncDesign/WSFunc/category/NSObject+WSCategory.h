//
//  NSObject+WSCategory.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-30.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString * const SCObjcTypeChar;
extern NSString * const SCObjcTypeInt;
extern NSString * const SCObjcTypeShort;
extern NSString * const SCObjcTypeInt32;
extern NSString * const SCObjcTypeInt64;

extern NSString * const SCObjcTypeUChar;
extern NSString * const SCObjcTypeUInt;
extern NSString * const SCObjcTypeUShort;
extern NSString * const SCObjcTypeUInt32;
extern NSString * const SCObjcTypeUInt64;

extern NSString * const SCObjcTypeFloat;
extern NSString * const SCObjcTypeDouble;

extern NSString * const SCObjcTypeBool;

extern NSString * const SCObjcTypeCGPoint;
extern NSString * const SCObjcTypeCGSize;
extern NSString * const SCObjcTypeCGRect;

extern NSString * const SCObjcTypeNSNumber;
extern NSString * const SCObjcTypeNSValue;

extern NSString * const SCObjcTypeNSDate;

extern NSString * const SCObjcTypeNSData;
extern NSString * const SCObjcTypeUIImage;

extern NSString * const SCObjcTypeNSString;
@interface NSObject (Category)

#pragma mark - 获得documents路径



/**
 *  获得documents路径
 *
 *  @return documents路径
 */
- (NSString *) ws_documentsPath;
//                       _ooOoo_
//                      o8888888o
//                      88" . "88
//                      (| -_- |)
//                      O\  =  /O
//                   ____/`---'\____
//                 .'  \\|     |//  `.
//                /  \\|||  :  |||//  \
//               /  _||||| -:- |||||-  \
//               |   | \\\  -  /// |   |
//               | \_|  ''\---/''  |   |
//               \  .-\__  `-`  ___/-. /
//               _`. .'  /--.--\  `. . __
//          ."" '<  `.___\_<|>_/___.'  >'"".
//        | |  :  `- \`.;`\ _ /`;.`/ - ` : | |
//         \  \ `-.   \_ __\ /__ _/   .-` /  /
//    ======`-.____`-.___\_____/___.-`____.-'======
//                       `=---='
//      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

//G－C－D
typedef void(^WS__GCDBlock__)(void);
- (void)WS_GCD_back:(WS__GCDBlock__)ws__gcdBlock;
- (void)WS_GCD_main:(WS__GCDBlock__)ws__gcdBlock;

//对象解析位字典
+ (NSDictionary *)ws_codableProperties;
- (NSDictionary *)ws_codableProperties;

+ (NSDictionary *)ws_storableProperties;
- (NSDictionary *)ws_storableProperties;
@end
