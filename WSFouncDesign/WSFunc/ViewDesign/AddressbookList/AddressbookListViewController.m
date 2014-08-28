//
//  AddressbookListViewController.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-25.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//
/**
 *self.manager.addressbookGroupData是一个可变数组 
 数组内存放以ABCD..Z#等以姓名开头首字母分组的数组
 ABCD..Z#对应对数组中存放对联系人字典（字典中的电话号码的value为手机号码数组）
 即 数组1内存放数组2 数组2存放字典
 *
 */
#import "AddressbookListViewController.h"
#import "AddressbookListCell.h"
#define ktitleSection @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"]
#define kColorBlue [UIColor colorWithRed:0 green:0 blue:200/255 alpha:0.8]
@interface AddressbookListViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *_btn;//滑动显示按钮ABCDE。。。
}
@end

@implementation AddressbookListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _manager = [[AddressbookListManager alloc] init];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + 44, self.view.frame.size.width, self.view.frame.size.height - 64 - 44) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //添加搜索条
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 44)];
    [self.view addSubview:searchBar];
    [_tableView setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - tableViewDelegate 
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return ktitleSection;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ktitleSection.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 26) {/////////////////当为“＃”号时
        if ([[[self.manager.addressbookGroupData lastObject][0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] < 'a' || [[[self.manager.addressbookGroupData lastObject][0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] > 'z')
        {
            {
                ////////////////////////////////what are you do at here
            
                
            }
            
            return [[self.manager.addressbookGroupData lastObject] count];
        }
        return 0;
    }
    for (NSArray *arr in self.manager.addressbookGroupData) {
        ///////////////////当为a-z时候
        if ([[arr[0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] == 97 + section)
        {
            {
                ////////////////////////////////what are you do at here
                
                
            }
            return arr.count;
        }
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 26) {
        if ([self.manager.addressbookGroupData lastObject] == nil) {
            return 0;
        }
        if ([[[self.manager.addressbookGroupData lastObject][0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] < 'a' || [[[self.manager.addressbookGroupData lastObject][0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] > 'z') {
            return 25;
        }
        return 0;
    }
    
    for (NSArray *arr in self.manager.addressbookGroupData) {
        if ([[arr[0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] == 97 + section) {
            return 25;
        }
    }
    return 0;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 25)];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-10, 25)];
    [imgView setImage:[UIImage imageNamed:@"colleague_group_sepline.png"]];
    [view addSubview:imgView];
    UIButton *showBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 25, 25)];
    [view addSubview:showBtn];
    view.backgroundColor = [UIColor redColor];
    if (section == 26) {
        if ([[[self.manager.addressbookGroupData lastObject][0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] < 'a' || [[[self.manager.addressbookGroupData lastObject][0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] > 'z') {
            [showBtn setTitle:@"#" forState:UIControlStateNormal];
            //[showBtn setTitleColor:[UIColor colorWithCGColor:] forState:(UIControlState)]
            [showBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [showBtn.titleLabel setTextAlignment:NSTextAlignmentLeft];
            return view;
        }
        return nil;
    }
    for (NSArray *arr in self.manager.addressbookGroupData) {
        if ([[arr[0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] == 97 + section) {
            ;
            [showBtn setTitle:ktitleSection[section] forState:UIControlStateNormal];
            //[showBtn setTitleColor:[UIColor colorWithCGColor:] forState:(UIControlState)]
            [showBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [showBtn.titleLabel setTextAlignment:NSTextAlignmentLeft];
            return view;
        }
    }
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"groupSelectCell";
    AddressbookListCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[AddressbookListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    }
    NSArray *cellArr;
    if (indexPath.section == 26) {
        if ([[[self.manager.addressbookGroupData lastObject][0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] < 'a' || [[[self.manager.addressbookGroupData lastObject][0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] > 'z') {
            cellArr = [self.manager.addressbookGroupData lastObject];
        }
    }
    else
    {
        for (NSArray *arr in self.manager.addressbookGroupData) {
            //char ch = indexPath.section;
            if ([[arr[0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] == 97 + indexPath.section) {
                cellArr = arr;
                break;
            }
        }
    }
    if (cellArr.count == 0 || cellArr == nil) {
        return nil;
    }
    cell.textLabel.text =  cellArr[indexPath.row][kName_Addressbook];
    
    {
        ////////////////////////////////what are you do at here
        
    }
    
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSInteger count = 0;
    for(NSString *character in ktitleSection)
    {
        if([character isEqualToString:title])
        {
            //NSLog(@"%@ -- %ld",character,(long)index);
            if (index == 26) {

                if ([self.manager.addressbookGroupData lastObject]  && ([[[self.manager.addressbookGroupData lastObject][0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] < 'a' || [[[self.manager.addressbookGroupData lastObject][0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] > 'z')) {
                    [self createIndexBtn:title];
                }
            }
            else
            {
                for (NSArray *arr in self.manager.addressbookGroupData) {
                    //char ch = indexPath.section;
                    if ([[arr[0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] == 97 + index) {
                        [self createIndexBtn:title];
                        break;
                    }
                }
            }
            return count;
            
        }
        count ++;
    }
    return 0;
}
#pragma mark -滑动到某个字母显示一个大按钮
-(void)createIndexBtn:(NSString *)title
{
    if (_btn == nil) {
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 210, 50, 50)];
        _btn.backgroundColor = kColorBlue;
        _btn.layer.cornerRadius = 5;
        [_btn setAlpha:0.7];
    }
    [_btn setTitle:title forState:UIControlStateNormal];
    
    [self.view addSubview:_btn];
    
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(removeBtn) object:nil];
    [self performSelector:@selector(removeBtn) withObject:nil afterDelay:0.5];
}
-(void)removeBtn
{
    
    [UIView animateWithDuration:0.5 animations:^{
        _btn.alpha = 0;
    } completion:^(BOOL finished) {
        _btn.alpha = 0.7;
        [_btn removeFromSuperview];
    }];
    
}
#pragma mark - you do please here

@end
