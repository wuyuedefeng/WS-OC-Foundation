//
//  SCTableViewController.h
//  SCFramework
//
//  Created by Angzn on 3/10/14.
//  Copyright (c) 2014 Richer VC. All rights reserved.
//
//#import "SCTableView.h"

#import "SCTableView.h"
@interface SCTableViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate,
SCTableViewPullDelegate
>

@property (nonatomic, strong) SCTableView *tableView;

+ (UITableViewStyle)tableViewStyle;

- (id)initWithStyle:(UITableViewStyle)style;

@end
