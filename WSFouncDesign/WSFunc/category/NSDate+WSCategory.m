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
    return [date ws_convertDateToStringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
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
    return [date ws_convertDateToStringWithFormat:@"yyyy-MM-dd"];
}

- (NSString *)ws_convertDateToStringWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *dateStr = [dateFormatter stringFromDate:self];
    return dateStr;
}

- (NSDate *)ws_convertStringToDate:(NSString *)string format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}
@end
