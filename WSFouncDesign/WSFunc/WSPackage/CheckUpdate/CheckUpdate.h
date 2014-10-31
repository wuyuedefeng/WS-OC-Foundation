//
//  CheckUpdate.h
//  NUAA
//
//  Created by wangsen on 13-9-19.
//  Copyright (c) 2013年 wangsen. All rights reserved.
//

/**
 *  用于检查app是否有更新。
 */


#import <Foundation/Foundation.h>

@interface CheckUpdate : NSObject <UIAlertViewDelegate>

+ (CheckUpdate *)shareInstance;
- (void)checkUpdate;

@end
