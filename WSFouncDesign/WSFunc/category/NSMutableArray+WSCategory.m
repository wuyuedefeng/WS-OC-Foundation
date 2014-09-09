//
//  NSMutableArray+WSCategory.m
//  WSFouncDesign
//
//  Created by wangsen on 14-8-7.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "NSMutableArray+WSCategory.h"

@implementation NSMutableArray (Category)
/**
 *  如果 obj＝＝ nil 则不添加
 *
 *  @param obj 需要添加的对象
 */
- (void)addObject_Safe:(id)obj
{
    if (obj != nil) {
		[self addObject:obj];
	}
}

@end
