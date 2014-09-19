//
//  NSAttributedString+WSCategory.h
//  WSFouncDesign
//
//  Created by TX-009 on 14-9-19.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSAttributedString (WSCategory)
+ (NSAttributedString *)ws_attributedStringWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color kerning:(BOOL)kerning;
@end
