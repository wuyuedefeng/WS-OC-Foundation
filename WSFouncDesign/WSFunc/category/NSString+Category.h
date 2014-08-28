//
//  NSString+Category.h
//  Category_Nsobject
//
//  Created by wangsen on 13-12-31.
//  Copyright (c) 2013年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (Category)
-(BOOL) ws_isNotNilString;
-(BOOL) ws_isNilString;
@end
/***
 *  ///////////////
 */
@interface NSString (Category)
#pragma mark - 邮件格式是否合法
-(BOOL) ws_isValidate_Email;
#pragma mark -手机号码格式是否合法
-(BOOL) ws_isValidate_Mobile;
#pragma mark -用户名格式是否合法
-(BOOL) ws_isValidate_User;
#pragma mark -是否全为数字
-(BOOL) ws_isValidate_NumberStr;
#pragma mark -是否全为英文
- (BOOL)ws_isValidate_EnglishWords;
#pragma mark -是否全为字母和数字
- (BOOL)ws_isValidate_EnglishWordsAndNumStr;
#pragma mark -是否全为中文
- (BOOL)ws_isValidate_ChineseWords;


#pragma mark - 判断字符串是否不为空(' ',nil,null)
-(BOOL) ws_isNotNilString;
-(BOOL) ws_isNilString;

#pragma mark - 获取字符串尺寸
- (CGSize)ws_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
- (CGSize)ws_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize addSize:(CGSize)addSize;
#pragma mark - 字符串转换成JSON数据
- (id)ws_jsonObject;

#pragma mark - MD5加密
- (NSString *) ws_md5_encrypt;
#pragma mark - 哈希算法（Secure Hash Algorithm）
//SHA1有如下特性：不可以从消息摘要中复原信息；两个不同的消息不会产生同样的消息摘要。
- (NSString *)ws_SHA1;
#pragma mark - base64加密
- (NSString *)ws_base64_encodeUTF8;
#pragma mark -base64解密
- (NSString *)ws_base64_decodeUTF8;
- (NSData *) ws_base64DataWithBase64String;

@end
