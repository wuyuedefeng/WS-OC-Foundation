////
////  CheckUpdate.m
////  NUAA 
////
////  Created by wangsen on 12-9-19.
////  Copyright (c) 2013年 wangsen. All rights reserved.
////

#import "CheckUpdate.h"
#import "AFHTTPRequestOperationManager.h"
////此APP id为程序申请时得到。更改相应的id查询App的信息
////#define kAPPID      @"907331580"
#define kAppTipUpdate @"appTipUpdate"
@implementation CheckUpdate
+ (CheckUpdate *)shareInstance
{
    static CheckUpdate *update = nil;
    if (!update)
    {
        update = [[CheckUpdate alloc] init];
    }

    return update;
}

- (void)checkUpdate
{
    static int index = 0;
    if (!index) {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        NSString *storeVersion = [[NSUserDefaults standardUserDefaults] objectForKey:kAppTipUpdate];
        if ([storeVersion isEqualToString:version]) {
            return ;
        }
    }
    index++;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",kAPPID] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"JSON: %@", responseObject);
        
        NSArray *app=[responseObject objectForKey:@"results"];
        NSDictionary *dic=[app lastObject];
        NSString *appStoreVersion=[dic objectForKey:@"version"];
        NSLog(@"%@",appStoreVersion);
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:kAppTipUpdate];
        
        if ([appStoreVersion compare:version] == NSOrderedDescending) {
            NSLog(@"升级");
            UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请升级软件" delegate:self cancelButtonTitle:@"取消"otherButtonTitles:@"确认", nil];
            [alert show];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/app/id%@",kAPPID]]];
    }

}
@end
