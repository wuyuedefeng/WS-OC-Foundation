//
//  NSDate+WSCategory.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-28.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)
/**
 *  输出：2014-07-28 16:46:54
 *
 *  @return 2014-07-28 16:46:54
 */
+ (NSString *)ws_current_DateTime;
/**
 *  输出：2014-07-28
 *
 *  @return 2014-07-28
 */
+ (NSString *)ws_current_Date;


/**
 *  将日期转化为字符串。
 *  @param  format:转化格式，形如@"yyyy年MM月dd日hh时mm分ss秒"。
 *  return  返回转化后的字符串。
 */
- (NSString *)ws_convertDateToStringWithFormat:(NSString *)format;

/**
 *  将字符串转化为日期。
 *  @param  string:给定的字符串日期。
 *  @param  format:转化格式，形如@"yyyy年MM月dd日hh时mm分ss秒"。日期格式要和string格式一致，否则会为空。
 *  return  返回转化后的日期。
 */
- (NSDate *)ws_convertStringToDate:(NSString *)string format:(NSString *)format;
@end
