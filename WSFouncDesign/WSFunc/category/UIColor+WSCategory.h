//
//  UIColor+WSCategory.h
//  WSFouncDesign
//
//  Created by TX-009 on 14-7-31.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)
#pragma mark - hexString eg. #ff0000
/**
 *  传入eg. #ff0000 转化成颜色
 *
 *  @param hexString eg. #ff0000
 *
 *  @return color类型的数据
 */
+ (UIColor *)ws_colorWithHexString:(NSString *)hexString;
/**
 *  传入eg. #ff0000 转化成颜色
 *
 *  @param hexString eg. #ff0000
 *  @param alpha     透明度
 *
 *  @return color类型的数据
 */
+ (UIColor *)ws_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
/**
 *  根据十六进制颜色值返回UIColor。
 *  @param  hexColor:十六进制颜色值。
 *  return  UIColor。
 */
+ (UIColor *)ws_convertHexColorToUIColor:(NSInteger)hexColor;
@end
