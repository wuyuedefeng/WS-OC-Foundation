//
//  WSApp.h
//  WSFouncDesign
//
//  Created by TX-009 on 14-7-29.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *需要StoreKit.framework
 *MessageUI.framework
 *
 */
@interface WSApp : NSObject

+ (void) reviewApp: (NSString *)appID;
+ (void) updateApp: (NSString *)appID;

@end
