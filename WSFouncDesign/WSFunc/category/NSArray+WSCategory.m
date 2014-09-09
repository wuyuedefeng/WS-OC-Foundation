//
//  NSArray+JSON.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-22.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "NSArray+WSCategory.h"

@implementation NSArray (Category)
/**
 *  将 数组 转换成 json字符串
 *
 *  @return json字符串
 */
- (NSString *)ws_jsonString {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error){
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
@end
