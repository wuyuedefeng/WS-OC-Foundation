//
//  AddressbookListViewController.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-25.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressbookListManager.h"
@interface AddressbookListViewController : UIViewController

@property(nonatomic,strong,readonly)UITableView *tableView;
@property(nonatomic,strong,readonly)AddressbookListManager *manager;
@end
