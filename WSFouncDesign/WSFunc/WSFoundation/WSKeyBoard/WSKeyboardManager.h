//
//  DKKeyboardManager.h
//  WSFouncDesign
//
//  Created by Daniate on 14/8/2.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import <UIKit/UIKit.h>
// 严格单例
#if __has_feature(objc_arc)
#define kWSStrictSingletonForClass(__CLASS_NAME__) \
static __CLASS_NAME__ *shared##__CLASS_NAME__ = nil;\
+ (__CLASS_NAME__ *)shared##__CLASS_NAME__ {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
shared##__CLASS_NAME__ = [[super allocWithZone:NULL] init];\
});\
return shared##__CLASS_NAME__;\
}\
+ (id)allocWithZone:(NSZone *)zone {\
return [__CLASS_NAME__ shared##__CLASS_NAME__];\
}\
- (id)copyWithZone:(NSZone *)zone {\
return self;\
}
#else
#define kWSStrictSingletonForClass(__CLASS_NAME__) \
static __CLASS_NAME__ *shared##__CLASS_NAME__ = nil;\
+ (__CLASS_NAME__ *)shared##__CLASS_NAME__ {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
shared##__CLASS_NAME__ = [[super allocWithZone:NULL] init];\
});\
return shared##__CLASS_NAME__;\
}\
+ (id)allocWithZone:(NSZone *)zone {\
return [__CLASS_NAME__ shared##__CLASS_NAME__];\
}\
- (id)copyWithZone:(NSZone *)zone {\
return self;\
}\
- (id)retain {\
return self;\
}\
- (NSUInteger)retainCount {\
return NSUIntegerMax;\
}\
- (oneway void)release {\
}\
- (id)autorelease {\
return self;\
}
#endif
@interface WSKeyboardManager : NSObject

@property (nonatomic, weak) UIScrollView *currentScrollView;
@property (nonatomic, weak) UIView *activeTextField;

+ (WSKeyboardManager *)sharedWSKeyboardManager;
- (void)registerKeyboardNotifications;
- (void)removeKeyboardNotifications;

@end
