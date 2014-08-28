//
//  NSNotificationCenter+Category.h
//  WSFouncDesign
//
//  Created by TX-009 on 14-8-7.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (Category)

-(void)ws_postNotificationOnMainThread_Name:(NSString *)notificationName object:(id)obj userInfo:(NSDictionary *)userInfo;

@end

