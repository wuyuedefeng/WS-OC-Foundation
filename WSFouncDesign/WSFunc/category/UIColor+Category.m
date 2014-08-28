//
//  UIColor+Category.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-7-31.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)
#pragma mark - hexString eg. #ff0000
/**
 *  传入eg. #ff0000 转化成颜色
 *
 *  @param hexString eg. #ff0000
 *
 *  @return color类型的数据
 */
+ (UIColor *)ws_colorWithHexString:(NSString *)hexString
{
    return [self ws_colorWithHexString:hexString alpha:1.0];
}
/**
 *  传入eg. #ff0000 转化成颜色
 *
 *  @param hexString eg. #ff0000
 *  @param alpha     透明度
 *
 *  @return color类型的数据
 */
+ (UIColor *)ws_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
	if ([hexString hasPrefix:@"0x"] || [hexString hasPrefix:@"0X"]) {
        hexString = [hexString substringFromIndex:2];
	} else if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString substringFromIndex:1];
    }
    
    unsigned int value = 0;
    BOOL flag = [[NSScanner scannerWithString:hexString] scanHexInt:&value];
    if(NO == flag)
        return [UIColor clearColor];
    float r, g, b, a;
    a = alpha;
    b = value & 0x0000FF;
    value = value >> 8;
    g = value & 0x0000FF;
    value = value >> 8;
    r = value;
    
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
}
@end
