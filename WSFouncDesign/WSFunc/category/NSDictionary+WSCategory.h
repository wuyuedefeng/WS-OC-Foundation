//
//  NSDictionary+JSON.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-22.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)
#pragma mark -将字典转换成json数据字符串
- (NSString *)jsonString_ws;
@end
