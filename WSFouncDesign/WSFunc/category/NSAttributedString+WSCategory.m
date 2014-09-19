//
//  NSAttributedString+WSCategory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-9-19.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "NSAttributedString+WSCategory.h"

@implementation NSAttributedString (WSCategory)
+ (NSAttributedString *)ws_attributedStringWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color kerning:(BOOL)kerning {
    
	NSDictionary *attributes;
    
	if (kerning) {
		attributes = @{NSFontAttributeName : font, NSForegroundColorAttributeName : color, NSKernAttributeName : [NSNull null]};
	}
	else {
		attributes = @{NSFontAttributeName : font, NSForegroundColorAttributeName : color};
	}
    
	return [[self alloc] initWithString:text attributes:attributes];
}
@end
