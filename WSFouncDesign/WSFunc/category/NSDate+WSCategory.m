//
//  NSDate+WSCategory.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-28.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "NSDate+WSCategory.h"

@implementation NSDate (Category)

/**
 *  返回中国时间 格式：yyyy-MM-dd HH:mm:ss
 *
 *  @return 时间字符串
 */
+ (NSString *)ws_current_DateTime
{
    //用[NSDate date]可以获取系统当前时间
    NSDate *date = [NSDate date];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //输出格式为：2010-10-27 10:22:13
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    return currentDateStr;
}
/**
 *  返回中国时间 格式：yyyy-MM-dd
 *
 *  @return 时间字符串
 */
+ (NSString *)ws_current_Date
{
    //用[NSDate date]可以获取系统当前时间
    NSDate *date = [NSDate date];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //输出格式为：2010-10-27 10:22:13
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    return currentDateStr;
}
@end
