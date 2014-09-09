//
//  NSData+WSCategory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-7-31.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCrypto.h>
#import "NSData+WSCategory.h"

static const char _base64EncodingTable[64] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
static const short _base64DecodingTable[256] = {
	-2, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -2, -1, -1, -2, -2,
	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
	-1, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, 62, -2, -2, -2, 63,
	52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -2, -2, -2, -2, -2, -2,
	-2,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
	15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -2, -2, -2, -2, -2,
	-2, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
	41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -2, -2, -2, -2, -2,
	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2
};
@implementation NSData (Category)
#pragma mark - MD5加密
/**
 *  md5加密－ 将NSData类型的二进制数据进行md5加密
 *
 *  @return 加密后的md5字符串
 */
- (NSString *) ws_md5_encrypt
{
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
	CC_MD5(self.bytes, (unsigned int)self.length, digest);
	NSMutableString *ms = [NSMutableString string];
	for (i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
		[ms appendFormat: @"%02x", (int)(digest[i])];
	}
	return [ms copy];
}
#pragma mark - 哈希算法（Secure Hash Algorithm）
//SHA1有如下特性：不可以从消息摘要中复原信息；两个不同的消息不会产生同样的消息摘要。
/**
 *  哈希算法（Secure Hash Algorithm）－ 将NSData数据哈希加密
 *
 *  @return 哈希字符串
 */
- (NSString *)ws_SHA1
{
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
	uint8_t digest[CC_SHA1_DIGEST_LENGTH];
	CC_SHA1(self.bytes, (unsigned int)self.length, digest);
	for (NSInteger i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
		[output appendFormat:@"%02x", digest[i]];
	}
	return output;
}
/**
 *  将base64编码的data类型 转换成base64编码的字符串类型
 *
 *  @return A Base64 encoded string
 */
- (NSString *)ws_base64EncodedString {
	const uint8_t *input = self.bytes;
	NSInteger length = self.length;
	
	NSMutableData *data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t *output = (uint8_t *)data.mutableBytes;
	
    for (NSInteger i = 0; i < length; i += 3) {
        NSInteger value = 0;
        for (NSInteger j = i; j < (i + 3); j++) {
            value <<= 8;
			
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
		
        NSInteger index = (i / 3) * 4;
        output[index + 0] = _base64EncodingTable[(value >> 18) & 0x3F];
        output[index + 1] = _base64EncodingTable[(value >> 12) & 0x3F];
        output[index + 2] = (i + 1) < length ? _base64EncodingTable[(value >> 6) & 0x3F] : '=';
        output[index + 3] = (i + 2) < length ? _base64EncodingTable[(value >> 0) & 0x3F] : '=';
    }
	
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
}


/**
 * 将base64编码的字符串 转换成 base64加密的data类型
 * 编码：NSASCIIStringEncoding
 *
 * @param base64String A Base64 encoded string
 *
 * @return Data contained in `base64String`
 */
+ (NSData *)ws_dataWithBase64String:(NSString *)base64String {
	const char *string = [base64String cStringUsingEncoding:NSASCIIStringEncoding];
	NSInteger inputLength = base64String.length;
	
	if (string == NULL/* || inputLength % 4 != 0*/) {
		return nil;
	}
	
	while (inputLength > 0 && string[inputLength - 1] == '=') {
		inputLength--;
	}
	
	NSInteger outputLength = inputLength * 3 / 4;
	NSMutableData* data = [NSMutableData dataWithLength:outputLength];
	uint8_t *output = data.mutableBytes;
	
	NSInteger inputPoint = 0;
	NSInteger outputPoint = 0;
	while (inputPoint < inputLength) {
		char i0 = string[inputPoint++];
		char i1 = string[inputPoint++];
		char i2 = inputPoint < inputLength ? string[inputPoint++] : 'A'; /* 'A' will decode to \0 */
		char i3 = inputPoint < inputLength ? string[inputPoint++] : 'A';
		
		output[outputPoint++] = (_base64DecodingTable[i0] << 2) | (_base64DecodingTable[i1] >> 4);
		if (outputPoint < outputLength) {
			output[outputPoint++] = ((_base64DecodingTable[i1] & 0xf) << 4) | (_base64DecodingTable[i2] >> 2);
		}
		if (outputPoint < outputLength) {
			output[outputPoint++] = ((_base64DecodingTable[i2] & 0x3) << 6) | _base64DecodingTable[i3];
		}
	}
	
	return data;
}
#pragma mark -aes加密
/**
 *  aes加密
 *
 *  @return 返回加密后的data数据
 */
- (NSData *)ws_aesEncryptWithKey:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}
#pragma mark -aes解密
/**
 *  aes解密
 *
 *  @return 返回解密后的data数据
 */
- (NSData *)ws_aesDecryptWithKey:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}
@end
