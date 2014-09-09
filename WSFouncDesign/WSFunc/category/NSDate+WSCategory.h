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
@end
