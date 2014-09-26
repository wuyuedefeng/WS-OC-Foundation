//
//  TipsTextField.h
//  TipTextFieldDemo
//
//  Created by mac on 14-3-19.
//  Copyright (c) 2014年 msp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSTipsListTextField : UITextField<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * tipsTable;
@property(nonatomic,copy)NSString *token;

- (void)addTips;
- (id)initWithFrame:(CGRect)frame token:(NSString *)token;

@end
