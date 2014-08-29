//
//  AddressbookListManager.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-25.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "AddressbookListManager.h"
#import "ChineseToPinyin.h"
@interface AddressbookListManager()
@property(nonatomic,strong,readonly)NSMutableArray *addressbookData;//分组前
@end
@implementation AddressbookListManager
- (id)init
{
    if (self = [super init]) {
       _addressbookData = [NSMutableArray array];
       _addressbookGroupData = [NSMutableArray array];
        [self readAllPeoples];
    }
    return self;
}
#pragma mark - 搜索手机通讯录 读取所有联系人
-(void)readAllPeoples
{
    [self.addressbookData removeAllObjects];
    //取得本地通信录名柄
    CFDictionaryRef dicRef = NULL;
    ABAddressBookRef tmpAddressBook;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
    {
        tmpAddressBook =  ABAddressBookCreateWithOptions(NULL, NULL);
        //获取通讯录权限
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        ABAddressBookRequestAccessWithCompletion(tmpAddressBook, ^(bool granted, CFErrorRef error){dispatch_semaphore_signal(sema);});
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    }
    else
    {
        tmpAddressBook = ABAddressBookCreateWithOptions(dicRef, nil);
    }
    
    //----------------
    //取得本地所有联系人记录
    NSArray* tmpPeoples = (NSArray*)CFBridgingRelease(ABAddressBookCopyArrayOfAllPeople(tmpAddressBook));
    for(id tmpPerson in tmpPeoples)
    {
        //创建一个联系人 字典保存联系人信息的字典
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        
        //获取的联系人单一属性:First name
        NSString* tmpFirstName = (NSString*)CFBridgingRelease(ABRecordCopyValue(( ABRecordRef)CFBridgingRetain(tmpPerson), kABPersonFirstNameProperty));
        
        //获取的联系人单一属性:Last name
        NSString* tmpLastName = (NSString*)CFBridgingRelease(ABRecordCopyValue(( ABRecordRef)CFBridgingRetain(tmpPerson), kABPersonLastNameProperty));
        NSString *name;
        if (tmpLastName != nil && tmpFirstName != nil) {
            name = [tmpLastName stringByAppendingString:tmpFirstName];
        }
        else if (tmpLastName == nil)
        {
            name = tmpFirstName ;
        }else
        {
            name = tmpLastName;
        }
        if (![name ws_isNotNilString]) {
            continue ;
        }
        
        [dic setObject:name forKey:kName_Addressbook];
        [dic setObject:[ChineseToPinyin pinyinFromChiniseString:name] forKey:kNameSpell_Addressbook];
        //获取的联系人单一属性:Generic phone number
        ABMultiValueRef tmpPhones = ABRecordCopyValue((ABRecordRef)CFBridgingRetain(tmpPerson), kABPersonPhoneProperty);
        NSMutableArray *phoneArr = [NSMutableArray array];
        //当电话号码有好几个的时候
        for(NSInteger j = 0; j < ABMultiValueGetCount(tmpPhones); j++)
        {
            NSString* tmpPhoneIndex = (NSString*)CFBridgingRelease(ABMultiValueCopyValueAtIndex(tmpPhones, j));
            NSString *tmpPhoneNum = [self filterPhoneNum:tmpPhoneIndex];
            [phoneArr addObject:tmpPhoneNum];
        }
        [dic setObject:phoneArr forKey:kPhoneNum_Addressbook];
        [self.addressbookData addObject:dic];
        CFRelease(tmpPhones);
    }
    [self.addressbookData sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *obj1PinYin = [obj1 objectForKey:kNameSpell_Addressbook];
        NSString *obj2PinYin = [obj2 objectForKey:kNameSpell_Addressbook];
        return [obj1PinYin compare:obj2PinYin];
    }];
    //释放内存
    CFRelease(tmpAddressBook);
    [self groupAddressbook];
}
#pragma mark  -对电话号码进行处理
- (NSString *)filterPhoneNum:(NSString *)strPhoneNum
{
    NSString *tmpString = @"";
    for (int i = 0; i < strPhoneNum.length; i++) {
        char ch = [strPhoneNum characterAtIndex:i];
        if (ch >= '0' && ch <= '9') {
            tmpString = [tmpString stringByAppendingFormat:@"%c",ch];
        }
    }
    if (tmpString.length > 2) {
        if ([[tmpString substringToIndex:2] isEqualToString:@"86"]) {
            tmpString = [tmpString substringFromIndex:2];
            NSLog(@"%@",tmpString);
        }
    }
    return tmpString;
}
#pragma mark -联系人分组
- (NSArray *)groupAddressbook
{

    NSMutableArray *returnMutableArr = [NSMutableArray array];
    
    NSArray *arr = [self.addressbookData sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1[kNameSpell_Addressbook] compare:obj2[kNameSpell_Addressbook]];
    }];
    if (arr.count == 0) {
        return arr;
    }
    NSMutableArray *lastMutableArr = [NSMutableArray array];
    NSMutableArray *mutableArr = [NSMutableArray array];
    int index;
    //是a－z
    if ([[arr[0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] >= 'a' && [[arr[0][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] <= 'z') {
        [mutableArr addObject:arr[0]];
        index = 0;
    }
    else//不是a-z
    {
        for (int i = 0; i < arr.count; i++) {
            if ([[arr[i][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] < 'a' || [[arr[i][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] > 'z') {
                [lastMutableArr addObject:arr[i]];
            }
            else
            {
                index = i;
                [mutableArr addObject:arr[i]];
                break;
            }
        }
    }
    if(mutableArr.count > 0)
    {
        [returnMutableArr addObject:mutableArr];
    }
    for (int i = index + 1; i < arr.count; i++) {
        if ([[arr[i][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] < 'a' || [[arr[i][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] > 'z') {
            [lastMutableArr addObject:arr[i]];
        }
        else if ([[arr[i][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0] == [[arr[i-1][kNameSpell_Addressbook] lowercaseString] characterAtIndex:0]) {
            [mutableArr addObject:arr[i]];
        }
        else
        {
            mutableArr = [NSMutableArray array];
            [mutableArr addObject:arr[i]];
            [returnMutableArr addObject:mutableArr];
        }
    }
    if (lastMutableArr.count > 0) {
        [returnMutableArr addObject:lastMutableArr];
    }
    [_addressbookGroupData removeAllObjects];
    _addressbookGroupData = returnMutableArr;
    return returnMutableArr;
}
@end
