//
//  UITextView+WSCategory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-9-10.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UITextView+WSCategory.h"

@implementation UITextView (WSCategory)
- (void)setText_Safe:(NSString *)text
{
    if ([text ws_isNotNilString]) {
        [self setText:text];
    }
}
@end
