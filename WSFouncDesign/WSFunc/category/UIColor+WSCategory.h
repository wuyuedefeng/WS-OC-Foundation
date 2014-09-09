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
+ (UIColor *)ws_colorWithHexString:(NSString *)hexString;
+ (UIColor *)ws_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
@end
