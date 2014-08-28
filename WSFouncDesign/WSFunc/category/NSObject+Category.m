//
//  NSObject+Category.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-30.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (Category)
#pragma mark - 获得documents路径
/**
 *  获得documents路径
 *
 *  @return documents路径
 */
- (NSString *) ws_documentsPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    if (paths && paths.count > 0) {
        return [paths objectAtIndex:0];
    }
    return nil;
}

//G－C－D
- (void)WS_GCD_back:(WS__GCDBlock__)ws__gcdBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (ws__gcdBlock) {
            ws__gcdBlock();
        }
    });
}
- (void)WS_GCD_main:(WS__GCDBlock__)ws__gcdBlock
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (ws__gcdBlock) {
            ws__gcdBlock();
        }
    });
}
@end
