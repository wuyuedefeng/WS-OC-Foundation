//
//  TipsTextField.h
//  TipTextFieldDemo
//
//  Created by mac on 14-3-19.
//  Copyright (c) 2014年 msp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSPopTipsTextField : UITextField<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * originTipsArray;
    NSMutableArray * currentTipsArray;
}
@property(nonatomic,strong)UITableView * tipsTable;
- (void)addTips;

@end
