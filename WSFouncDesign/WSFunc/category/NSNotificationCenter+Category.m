//
//  NSNotificationCenter+Category.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-8-7.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "NSNotificationCenter+Category.h"

@implementation NSNotificationCenter (Category)

-(void)ws_postNotificationOnMainThread_Name:(NSString *)notificationName object:(id)obj userInfo:(NSDictionary *)userInfo
{
    if (![NSThread isMainThread]) {
        
		dispatch_async(dispatch_get_main_queue(), ^{
            
			[self postNotificationName:notificationName object:obj userInfo:userInfo];
		});
	}
    
	else {
		[self postNotificationName:notificationName object:obj userInfo:userInfo];
	}
}

@end
