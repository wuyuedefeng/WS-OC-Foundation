//
//  NSData+Category.h
//  WSFouncDesign
//
//  Created by TX-009 on 14-7-31.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Category)
#pragma mark - MD5加密
- (NSString *) ws_md5_encrypt;
#pragma mark - 哈希算法（Secure Hash Algorithm）
- (NSString *)ws_SHA1;

#pragma mark - base64编码
- (NSString *) ws_base64EncodedString;
+ (NSData *) ws_dataWithBase64String: (NSString *)base64String;

#pragma mark -aes加密
- (NSData *)ws_aesEncryptWithKey:(NSString *)key;
#pragma mark -aes解密
- (NSData *)ws_aesDecryptWithKey:(NSString *)key;
@end
