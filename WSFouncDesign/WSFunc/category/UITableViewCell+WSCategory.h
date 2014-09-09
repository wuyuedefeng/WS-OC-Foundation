//
//  UITableViewCell+WSCategory.h
//  WSFouncDesign
//
//  Created by TX-009 on 14-7-29.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Category)

@property (nonatomic, weak, readonly) UITableView * ws_tableView;
@property (nonatomic, weak, readonly) NSIndexPath * ws_indexPath;

@end
