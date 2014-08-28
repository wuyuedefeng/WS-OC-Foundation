//
//  AddressbookListManager.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-25.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//
/**
 *需要AddressBook.framework框架
 */
#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#define kName_Addressbook @"name"//姓名
#define kNameSpell_Addressbook @"pinyin"//拼音
#define kPhoneNum_Addressbook @"phones"//手机号数组
@interface AddressbookListManager : NSObject

@property(nonatomic,strong,readonly)NSMutableArray *addressbookGroupData;//分组后
#pragma mark - 搜索手机通讯录
-(void)readAllPeoples;

@end
