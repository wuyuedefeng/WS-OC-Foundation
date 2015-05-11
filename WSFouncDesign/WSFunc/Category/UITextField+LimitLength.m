//
//  UITextField+LimitLength.m
//  TextLengthLimitDemo
//
//  Created by Su XinDe on 13-4-8.
//  Copyright (c) 2013年 Su XinDe. All rights reserved.
//

#import "UITextField+LimitLength.h"
#import <objc/objc.h>
#import <objc/runtime.h>

static NSString *kLimitTextLengthKey = @"kLimitTextLengthKey";

@implementation UITextField (LimitLength)

- (void)limitTextLength:(int)length
{
    objc_setAssociatedObject(self, (const void *)(kLimitTextLengthKey), [NSNumber numberWithInt:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(textFieldTextLengthLimit:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldTextLengthLimit:(id)sender
{
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (const void *)(kLimitTextLengthKey));
    int length = [lengthNumber intValue];
    if(self.text.length > length){
        self.text = [self.text substringToIndex:length];
    }
}

@end
