//
//  NSMutableDictionary+WSCategory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-8-7.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "NSMutableDictionary+WSCategory.h"

@implementation NSMutableDictionary (Category)

/**
 *  添加字典的obj和key  如果obj＝＝nil ｜｜ key＝＝ nil 添加不成功
 *
 *  @param obj 需要设置的值
 *  @param key 字典的key
 */
- (void)ws_setObject_safe:(id)obj forKey_safe:(id)key
{
    if (obj != nil & key != nil) {
		[self setObject:obj forKey:key];
	}
}
@end
