//
//  UIColor+WSCategory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-7-31.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UIColor+WSCategory.h"

@implementation UIColor (Category)
#pragma mark - hexString eg. #ff0000

+ (UIColor *)ws_colorWithHexString:(NSString *)hexString
{
    return [self ws_colorWithHexString:hexString alpha:1.0];
}

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

+ (UIColor *)ws_convertHexColorToUIColor:(NSInteger)hexColor
{
    return [UIColor colorWithRed:((float) ((hexColor & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((hexColor & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (hexColor & 0xFF))            / 0xFF
                           alpha:1.0];
}
@end
