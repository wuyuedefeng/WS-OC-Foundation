//
//  UITableViewCell+WSCategory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-7-29.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "UITableViewCell+WSCategory.h"
#import "UIView+WSCategory.h"
@implementation UITableViewCell (Category)
@dynamic ws_tableView;
@dynamic ws_indexPath;
/**
 *  获取该cell所属的tableView
 *
 *  @return tableView对象
 */
- (UITableView *)ws_tableView
{
    return (UITableView *)[self ws_superview_withSuperClassType:[UITableView class]];
}
/**
 *  cell 所在tableView的IndexPath
 *
 *  @return 返回indexpath
 */
- (NSIndexPath *)ws_ndexPath
{
	return [self.ws_tableView indexPathForCell:self];
}
@end
