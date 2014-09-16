//
//  UITextField+WSCategory.h
//  WSFouncDesign
//
//  Created by TX-009 on 14-9-10.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (WSCategory)

- (void)setText_Safe:(NSString *)text;
- (void)ws_limitTextLength:(int)length;
@end
