//
//  NSObject+WSCategory.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-30.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Category)

#pragma mark - 获得documents路径


#pragma mark - 获取模型的值
- (id)transObj_valueForKey:(NSString *)key;
#pragma mark - 设置模型的值
- (void)transObj_setValue:(id)value forKey:(NSString *)key;
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
@end
