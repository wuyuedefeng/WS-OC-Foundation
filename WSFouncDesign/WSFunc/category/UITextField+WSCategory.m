//
//  UITextField+WSCategory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-9-10.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UITextField+WSCategory.h"
#import "NSString+WSCategory.h"
@implementation UITextField (WSCategory)
- (void)setText_Safe:(NSString *)text
{
    if ([text ws_isNotNilString]) {
        [self setText:text];
    }
}
@end
