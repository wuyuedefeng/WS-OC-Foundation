//
//  WSTransObj.h
//  test_predicate
//
//  Created by wangsen on 14-7-15.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface WSTransObjManager : NSObject


#pragma mark - 获取与设置值
#pragma mark -获取值
+ (NSString *)valueGetterOfModal:(id)modal withKey:(NSString *)key;
#pragma mark -设置值
+ (void)valueSetterOfModal:(id)modal withKey:(NSString *)key withValue:(NSString *)value;

#pragma mark - 模型转换
#pragma mark -字典数组转模型数组
+ (NSArray *)modalArray_from_dictionaryArr:(NSArray *)dictonaryArr;
#pragma mark -模型数组转字典数组
+ (NSArray *)dictionaryArray_from_modalArray:(NSArray *)modolArray;

@end
