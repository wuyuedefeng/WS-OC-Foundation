//
//  WSApp.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-7-29.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "WSApp.h"

@implementation WSApp

+ (void)reviewApp:(NSString*)appID {
    NSString *str = [NSString stringWithFormat:
                     @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",
                     appID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

+ (void)updateApp:(NSString *)appID {
    NSString *str = [NSString stringWithFormat:
                     @"https://itunes.apple.com/app/id%@",
                     appID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

@end
