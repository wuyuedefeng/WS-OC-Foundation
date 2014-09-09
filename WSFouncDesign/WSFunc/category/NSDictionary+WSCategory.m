//
//  NSDictionary+JSON.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-22.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "NSDictionary+WSCategory.h"

@implementation NSDictionary (Category)
/**
 *  将字典 转化成 json字符串
 *
 *  @return json字符串
 */
- (NSString *)ws_jsonString
{
    NSError *error = nil;
    NSData * data = [ NSJSONSerialization dataWithJSONObject :self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
