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

static NSString *kLimitTextLengthKey = @"kLimitTextLengthKey";
- (void)ws_limitTextLength:(int)length
{
    objc_setAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey), [NSNumber numberWithInt:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(textFieldTextLengthLimit:) forControlEvents:UIControlEventEditingChanged];
}
- (void)textFieldTextLengthLimit:(id)sender
{
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey));
    int length = [lengthNumber intValue];
    if(self.text.length > length){
        self.text = [self.text substringToIndex:length];
    }
}


@end
