//
//  WSTransObj.m
//  test_predicate
//
//  Created by wangsen on 14-7-15.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//

#import "WSTransObj.h"
//用于 创建的数据模型属性的Get和Set方法 Get方法在NSPredicate中用到 set方法暂未用到 不知道以后可用到什么场景 暂留
//get方法
/**
 *  动态创建属性的get方法 Get方法在NSPredicate中用到
 *
 *  @param self 动态创建的 模型对象
 *  @param _cmd 对象的属性
 *
 *  @return get模型属性的值
 */
id nameGetter(id self, SEL _cmd) {
    //Class wsclass = [self class];
    NSString *name = [NSString stringWithFormat:@"%@",(NSStringFromSelector(_cmd))];
    //Ivar ivar = class_getInstanceVariable([wsclass class], [name UTF8String]);
    //NSLog(@"==%@",[WSTransObj valueGetterOfModal:self withKey:name]);
    return [WSTransObj valueGetterOfModal:self withKey:name];
}
//set方法
/**
 *  动态创建属性的set方法 方法暂未用到 不知道以后可用到什么场景 暂留
 *
 *  @param self    动态创建的 模型对象
 *  @param _cmd    对象的属性
 *  @param newName 对象的属性 － 新值
 */
void nameSetter(id self, SEL _cmd, NSString *newName) {
    NSString *name = [NSString stringWithFormat:@"%@",self];
    [WSTransObj valueSetterOfModal:self withKey:name withValue:newName];
}
@implementation WSTransObj
#pragma mark - 获取模型的值
+ (id)valueGetterOfModal:(id)modal withKey:(NSString *)key
{
    Ivar ivar = class_getInstanceVariable([modal class], [key UTF8String]);
    return object_getIvar(modal, ivar);
}
#pragma mark - 设置模型的值
+ (void)valueSetterOfModal:(id)modal withKey:(NSString *)key withValue:(NSString *)value
{
    Ivar ivar = class_getInstanceVariable([modal class], [key UTF8String]);
    id oldValue = object_getIvar(modal, ivar);
    if (oldValue != value)
    {
        object_setIvar(modal, ivar, [value copy]);
    }
}
#pragma mark - 字典数组转模型数组
+ (NSArray *)modalArray_from_dictionaryArr:(NSArray *)dictionaryArr
{
    if (![dictionaryArr isKindOfClass:[NSArray class]]) {
        NSLog(@"传递参数不是数组");
        return nil;
    }
    if (dictionaryArr.count == 0) {
        return nil;
    }
    Class wsclass = [WSTransObj createWSObjectClassWithOneDic:dictionaryArr[0]];
    return [WSTransObj modalArrWithDictionarys:dictionaryArr andModalClass:wsclass];
}
+ (id)modal_from_dictionary:(NSDictionary *)dic
{
    if (dic) {
        NSArray *arrDic = [NSArray arrayWithObjects:dic, nil];
        return  [WSTransObj modalArray_from_dictionaryArr:arrDic][0];
    }
    return nil;
}
#pragma mark -私有调用方法
#pragma mark -create class WSObject
+ (Class)createWSObjectClassWithOneDic:(NSDictionary *)oneDic
{
    //[WSTransObj createClass];
    //创建WSTransModol类
    //const char * className = "WSTransModal";
    const char * className = [[[[NSDate ws_current_DateTime] ws_md5_encrypt] stringByAppendingString:@"_WSCLASS"] UTF8String];
    Class wsclass = objc_getClass(className);
    if (!wsclass)
    {
        Class superClass = [NSObject class];
        wsclass = objc_allocateClassPair(superClass, className, 0);
    }
    
    NSArray *allKeys = [oneDic allKeys];
    NSArray *allValues = [oneDic allValues];
    
     NSUInteger count = allKeys.count;
    for (int i = 0; i < count; i++) {
        NSString *classType = NSStringFromClass([allValues[i] class]);
        wsclass = [WSTransObj setClassIvar:classType andIvarName:allKeys[i] andIvarValue:allValues[i] withClass:wsclass];
    }
    //4注册到运行时环境
    objc_registerClassPair(wsclass);
    return wsclass;
}
#pragma mark -对类设置属性
+ (Class)setClassIvar:(NSString *)ivarType andIvarName:(NSString *)ivarName andIvarValue:(NSString *)iVarValue withClass:(Class)wsclass
{
//    if ([ivarType isEqualToString:@"__NSCFConstantString"]) {
//        class_addIvar(wsclass, [ivarName UTF8String], sizeof(NSString *), 0, "NSString");
//    }
//    else if([ivarType isEqualToString:@"__NSCFNumber"])
//    {
//        class_addIvar(wsclass, [ivarName UTF8String], sizeof(NSNumber *), 0, "NSNumber");
//    }
//    else if([ivarType isEqualToString:@"__NSArrayI"])
//    {
//        class_addIvar(wsclass, [ivarName UTF8String], sizeof(NSArray *), 0, "NSArray");
//    }
//    else if([ivarType isEqualToString:@"__NSArrayM"])
//    {
//        class_addIvar(wsclass, [ivarName UTF8String], sizeof(NSMutableArray *), 0, "NSMutableArray");
//    }
//    else if([ivarType isEqualToString:@"__NSDictionaryI"])
//    {
//        class_addIvar(wsclass, [ivarName UTF8String], sizeof(NSDictionary *), 0, "NSDictionary");
//    }
//    else if([ivarType isEqualToString:@"__NSDictionaryM"])
//    {
//        class_addIvar(wsclass, [ivarName UTF8String], sizeof(NSMutableDictionary *), 0, "NSMutableDictionary");
//    }
    Class ivarTypeClass = NSClassFromString(ivarType);
    class_addIvar(wsclass, [ivarName UTF8String], sizeof([ivarTypeClass class]), 0, [ivarType UTF8String]);
    
//        objc_property_attribute_t type = { "T", "@\"NSString\"" };
//        objc_property_attribute_t ownership = { "C", "" }; // C = copy
//        objc_property_attribute_t attrs[] = { type, ownership };
//        class_addProperty([wsclass class], [ivarName UTF8String], attrs, 3);
    
    
    class_addMethod([wsclass class], NSSelectorFromString(ivarName), (IMP)nameGetter, "@@:");
    NSString *setName = [NSString stringWithFormat:@"set%@:",[ivarName capitalizedString]];
    class_addMethod([wsclass class], NSSelectorFromString(setName), (IMP)nameSetter, "v@:@");
    
    return wsclass;
}
#pragma mark -模型转换成字典具体实现
+ (NSArray *)modalArrWithDictionarys:(NSArray *)dicArr andModalClass:(Class)wsclass
{
    
    NSMutableArray *mutableArr = [NSMutableArray array];
    NSArray *allKeys = [dicArr[0] allKeys];
    NSUInteger countArr = [dicArr count];
    NSUInteger countKey = [allKeys count];
    for (int i = 0; i<countArr; i++) {
        NSArray *allValues = [dicArr[i] allValues];
        id instance = [[wsclass alloc] init];
        
        for (int j = 0; j<countKey; j++) {
            //[instance setValue:allValues[j] forKey:allKeys[j]];
            //Ivar ivar = class_getInstanceVariable([wsclass class], [allKeys[j] UTF8String]);
            //object_setIvar(instance, ivar, allValues[j]);
            [WSTransObj valueSetterOfModal:instance withKey:allKeys[j] withValue:allValues[j]];
        }
        NSLog(@"%@",instance);
        [mutableArr addObject:instance];
    }
    
    return mutableArr;
}
#pragma mark - 模型数组转字典数组
+ (NSArray *)dictionaryArray_from_modalArray:(NSArray *)modalArray
{
    if (![modalArray isKindOfClass:[NSArray class]]) {
        NSLog(@"传递参数不是数组");
    }
    if (modalArray.count == 0) {
        return nil;
    }
    //获取创建字典所需要的key key获取到都是字符串类型（NSString）
    NSArray *allKeys = [WSTransObj typeNamesOfModal:modalArray[0]];
    
    NSMutableArray *mutableArr = [NSMutableArray array];//待返回数组
    for (id modal in modalArray) {
        NSArray *allValues = [WSTransObj valuesOfModal:modal andModalKeys:allKeys];
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjects:allValues forKeys:allKeys];
        [mutableArr addObject:dic];
    }
    return mutableArr;
}
+ (id)dictionary_from_modal:(id)modol
{
    if (modol) {
        NSArray *modalArr = [NSArray arrayWithObjects:modol, nil];
        return [WSTransObj dictionaryArray_from_modalArray:modalArr][0];
    }
    return nil;
}
#pragma mark -获取模型所有属性名称
+ (NSArray *)typeNamesOfModal:(id)modal
{
    NSMutableArray *mutableArr = [NSMutableArray array];
    unsigned int count = 0;
    // 获得modal类中的所有成员变量
    //NSLog(@"==%@",NSStringFromClass([modal class]));
    Ivar *ivars = class_copyIvarList([modal class], &count);
    // 遍历所有的成员变量
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        //NSLog(@"＝%@",[NSString stringWithFormat:@"%s",ivar_getName(ivar)]);
        [mutableArr addObject:[NSString stringWithFormat:@"%s",ivar_getName(ivar)]];
    }
    
    BOOL hasSuperIvar = YES;
    Class superClass = [modal class];
    while (hasSuperIvar) {
        superClass = [superClass superclass];
        if ([superClass class] == [NSObject class]) {
            hasSuperIvar = NO;
            break;
        }
        ivars = class_copyIvarList([superClass class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            //NSLog(@"＝%@",[NSString stringWithFormat:@"%s",ivar_getName(ivar)]);
            [mutableArr addObject:[NSString stringWithFormat:@"%s",ivar_getName(ivar)]];
        }
    }
    return mutableArr;
}
#pragma mark -获取模型所有属性的值
+ (NSArray *)valuesOfModal:(id)modal andModalKeys:(NSArray *)allKeys
{
    NSMutableArray *mutableArr = [NSMutableArray array];
    
    for (NSString *key in allKeys) {
        id obj = [WSTransObj valueGetterOfModal:modal withKey:key];
        if ([WSTransObj isBaseObject:obj]) {
            [mutableArr addObject:[WSTransObj valueGetterOfModal:modal withKey:key]];
        }
        else
        {
            [mutableArr addObject:[WSTransObj dictionary_from_modal:obj]];
        }
        
//        [mutableArr addObject:[WSTransObj valueGetterOfModal:modal withKey:key]];
    }
    
    return mutableArr;
}

+ (BOOL)isBaseObject:(id)obj
{
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    if ([obj isKindOfClass:[NSArray class]]) {
        return YES;
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return YES;
    }
    if ([obj isKindOfClass:[NSNumber class]]) {
        return YES;
    }
    if ([obj isKindOfClass:[NSData class]]) {
        return YES;
    }
    if ([obj isKindOfClass:[NSDate class]]) {
        return YES;
    }
    if ([obj isKindOfClass:[NSSet class]]) {
        return YES;
    }
    
    return NO;
}


@end
