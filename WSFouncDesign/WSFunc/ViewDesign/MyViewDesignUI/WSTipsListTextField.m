//
//  TipsTextField.m
//  TipTextFieldDemo
//
//  Created by mac on 14-3-19.
//  Copyright (c) 2014年 msp. All rights reserved.
//

#import "WSTipsListTextField.h"
#import "NSString+WSCategory.h"
#import "NSFileManager+WSCategory.h"
#define TIPS_ROW 5
#define TIPS_STORE_NUMBER 20
@interface WSTipsListTextField()
@property (atomic,strong)NSMutableArray *originTipsArray;
@property (atomic,strong)NSMutableArray *currentTipsArray;
@end
@implementation WSTipsListTextField
/*xib*/
- (id)initWithCoder:(NSCoder*)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.currentTipsArray = [NSMutableArray array];
        
        _tipsTable = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + CGRectGetHeight(self.frame)+2, CGRectGetWidth(self.frame), 30*TIPS_ROW)  style:UITableViewStylePlain];
        _tipsTable.delegate = self;
        _tipsTable.rowHeight = 30;
        _tipsTable.dataSource = self;
        _tipsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tipsTable setBackgroundColor:[UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0f]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editBegin) name:UITextFieldTextDidBeginEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChange) name:UITextFieldTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addTips) name:UITextFieldTextDidEndEditingNotification object:nil];
        
    }
    return self;
}


//代码
- (id)initWithFrame:(CGRect)frame token:(NSString *)token
{
    self = [super initWithFrame:frame];
    if (self) {
        self.token = token;
        if(self.originTipsArray == nil)
        {
            self.originTipsArray = [NSMutableArray array];
        }
        self.currentTipsArray = [NSMutableArray array];
        
        _tipsTable = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + CGRectGetHeight(self.frame)+2, CGRectGetWidth(self.frame), 30*TIPS_ROW)  style:UITableViewStylePlain];
        _tipsTable.delegate = self;
        _tipsTable.rowHeight = 30;
        _tipsTable.dataSource = self;
        _tipsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tipsTable setBackgroundColor:[UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0f]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editBegin) name:UITextFieldTextDidBeginEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChange) name:UITextFieldTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addTips) name:UITextFieldTextDidEndEditingNotification object:nil];
        
    }
    return self;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidEndEditingNotification object:nil];
}
#pragma mark - 内部数据初始化
- (NSMutableArray *)getOriginTipsArrayFromLocalPath
{
    NSString *storePath = [self getStorePath];
    if ([[self getStorePath] ws_isNotNilString]) {
        return [NSMutableArray arrayWithContentsOfFile:storePath];
    }
    return nil;
}
- (NSString *)getStorePath
{
    NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    if ([NSFileManager ws_createFolder:@"TipListTextFieldFolder" atPath:cacheDirectory]) {
        cacheDirectory = [cacheDirectory stringByAppendingPathComponent:@"TipListTextFieldFolder"];
        cacheDirectory = [cacheDirectory stringByAppendingPathComponent:[self.token ws_md5_encrypt]];
        return cacheDirectory;
    }
    return nil;
}
#pragma makr - 内部数据操作
- (void)editBegin
{
    if (![self.token ws_isNotNilString]) {
        return ;
    }
    
    self.originTipsArray = [self getOriginTipsArrayFromLocalPath];
    if (self.originTipsArray == nil) {
        self.originTipsArray = [NSMutableArray array];
    }
}
- (void)valueChange
{
    if (![self.token ws_isNotNilString]) {
        return ;
    }
    
    [self.currentTipsArray removeAllObjects];
    NSString * strText = self.text;
    
    for(NSString * strTip in self.originTipsArray)
    {
        if([strTip hasPrefix:strText])
        {
            [self.currentTipsArray addObject:strTip];
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
    if (![self.token ws_isNotNilString]) {
        return ;
    }
    
    NSString * strTips = self.text;
    if( ![self.originTipsArray containsObject:strTips])
    {
        [self.originTipsArray insertObject:strTips atIndex:0];
        if (self.originTipsArray.count > TIPS_STORE_NUMBER) {
            self.originTipsArray = [[self.originTipsArray subarrayWithRange:NSMakeRange(0, TIPS_STORE_NUMBER)] mutableCopy];
        }
        if(![self.originTipsArray writeToFile:[self getStorePath] atomically:YES])
        {
            NSLog(@"write failed");
        }
    }
}





#pragma mark - tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.currentTipsArray count];
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
    
    if(indexPath.row < [self.currentTipsArray count])
    {
        [cell.textLabel setText:[self.currentTipsArray objectAtIndex:indexPath.row]];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self setText:[self.currentTipsArray objectAtIndex:indexPath.row]];
    [_tipsTable setHidden:YES];
}

@end
