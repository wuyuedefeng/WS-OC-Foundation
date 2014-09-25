//
//  TipsTextField.m
//  TipTextFieldDemo
//
//  Created by mac on 14-3-19.
//  Copyright (c) 2014年 msp. All rights reserved.
//

#import "WSPopTipsTextField.h"
#import "NSString+WSCategory.h"
#define TIPS_ROW 5
#define TIPS_STORE_NUMBER 20

@implementation WSPopTipsTextField

/*xib*/
- (id)initWithCoder:(NSCoder*)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
            originTipsArray = [NSMutableArray arrayWithContentsOfFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"TipsFile"]];
            if(originTipsArray == nil)
            {
                originTipsArray = [NSMutableArray array];
            }
            currentTipsArray = [NSMutableArray array];
            
            _tipsTable = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + CGRectGetHeight(self.frame)+2, CGRectGetWidth(self.frame), 30*TIPS_ROW)  style:UITableViewStylePlain];
            _tipsTable.delegate = self;
            _tipsTable.rowHeight = 30;
            _tipsTable.dataSource = self;
            _tipsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
            [_tipsTable setBackgroundColor:[UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0f]];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChange) name:UITextFieldTextDidChangeNotification object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addTips) name:UITextFieldTextDidEndEditingNotification object:nil];

    }
    return self;
}


//代码
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        originTipsArray = [NSMutableArray arrayWithContentsOfFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"TipsFile"]];
        if(originTipsArray == nil)
        {
            originTipsArray = [NSMutableArray array];
        }
        currentTipsArray = [NSMutableArray array];
        
        _tipsTable = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + CGRectGetHeight(self.frame)+2, CGRectGetWidth(self.frame), 30*TIPS_ROW)  style:UITableViewStylePlain];
        _tipsTable.delegate = self;
        _tipsTable.rowHeight = 30;
        _tipsTable.dataSource = self;
        _tipsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tipsTable setBackgroundColor:[UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0f]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChange) name:UITextFieldTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addTips) name:UITextFieldTextDidEndEditingNotification object:nil];
        
    }
    return self;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidEndEditingNotification object:nil];
}

- (void)valueChange
{
    NSLog(@"text->%@",self.text);
    [currentTipsArray removeAllObjects];
    NSString * strText = self.text;
    
    for(NSString * strTip in originTipsArray)
    {
        if([strTip hasPrefix:strText])
        {
            [currentTipsArray addObject:strTip];
        }
    }
    
    
    if([_tipsTable superview] == nil)
    {
        [[self superview] addSubview:_tipsTable];
    }
    else
    {
        [_tipsTable setHidden:NO];
    }
    
    [_tipsTable reloadData];

}

//添加提示
- (void)addTips
{
    NSString * strTips = self.text;
    
    if([strTips ws_isNotNilString] && ![originTipsArray containsObject:strTips])
    {
        [originTipsArray insertObject:strTips atIndex:0];
        NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]);
        if (originTipsArray.count > TIPS_STORE_NUMBER) {
            originTipsArray = [[originTipsArray subarrayWithRange:NSMakeRange(0, TIPS_STORE_NUMBER)] mutableCopy];
        }
        if(![originTipsArray writeToFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"TipsFile"] atomically:YES])
        {
            NSLog(@"write failed");
        }
    }
}





#pragma mark - tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [currentTipsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    if(indexPath.row < [currentTipsArray count])
    {
        [cell.textLabel setText:[currentTipsArray objectAtIndex:indexPath.row]];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self setText:[currentTipsArray objectAtIndex:indexPath.row]];
    [_tipsTable setHidden:YES];
}

@end
