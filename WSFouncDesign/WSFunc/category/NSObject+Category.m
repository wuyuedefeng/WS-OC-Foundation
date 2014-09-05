//
//  NSObject+Category.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-30.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "NSObject+Category.h"
#import "WSTransObj.h"
@implementation NSObject (Category)
////get方法
///**
// *  动态创建属性的get方法 Get方法在NSPredicate中用到
// *
// *  @param self 动态创建的 模型对象
// *  @param _cmd 对象的属性
// *
// *  @return get模型属性的值
// */
//id nameGetter(id self, SEL _cmd) {
//    //Class wsclass = [self class];
//    NSString *name = [NSString stringWithFormat:@"%@",(NSStringFromSelector(_cmd))];
//    //Ivar ivar = class_getInstanceVariable([wsclass class], [name UTF8String]);
//    //NSLog(@"==%@",[WSTransObj valueGetterOfModal:self withKey:name]);
//    return [self ws_valueForKey:name];
//}
////set方法
///**
// *  动态创建属性的set方法 方法暂未用到 不知道以后可用到什么场景 暂留
// *
// *  @param self    动态创建的 模型对象
// *  @param _cmd    对象的属性
// *  @param newName 对象的属性 － 新值
// */
//void nameSetter(id self, SEL _cmd, NSString *newName) {
//    NSString *name = [NSString stringWithFormat:@"%@",self];
//    [self ws_setValue:newName forKey:name];
//}
#pragma mark - 获取模型的值
/**
 *  WSTransObj静态方法创建的对象 获取对象属性的方法
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
- (id)transObj_valueForKey:(NSString *)key
{
   return [WSTransObj valueGetterOfModal:self withKey:key];
}
#pragma mark - 设置模型的值
/**
 *  WSTransObj静态方法创建的对象 设置对象属性的值的方法
 *
 *  @param value <#value description#>
 *  @param key   <#key description#>
 */
- (void)transObj_setValue:(id)value forKey:(NSString *)key
{
    return [WSTransObj valueSetterOfModal:self withKey:key withValue:value];
}
//
#pragma mark - 获得documents路径
/**
 *  获得documents路径
 *
 *  @return documents路径
 */
- (NSString *) ws_documentsPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    if (paths && paths.count > 0) {
        return [paths objectAtIndex:0];
    }
    return nil;
}

//G－C－D
- (void)WS_GCD_back:(WS__GCDBlock__)ws__gcdBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (ws__gcdBlock) {
            ws__gcdBlock();
        }
    });
}
- (void)WS_GCD_main:(WS__GCDBlock__)ws__gcdBlock
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (ws__gcdBlock) {
            ws__gcdBlock();
        }
    });
}
@end
