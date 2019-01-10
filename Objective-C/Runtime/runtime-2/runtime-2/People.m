//
//  People.m
//  runtime-2
//
//  Created by ChandlerZou on 2018/10/29.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

#import "People.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation People
- (NSDictionary *)allProperties
{
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    for (NSUInteger i = 0; i< count; i++){
        const char *propertyName = property_getName(properties[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        id propertyValue = [self valueForKey:name];
        
        if(propertyValue){
            resultDict[name] = propertyValue;
        }else{
            resultDict[name] = @"字典的key对应的value不能为nil！";
        }
    }
    free(properties);
    return resultDict;
}
- (NSDictionary *)allIvars
{
    unsigned int count = 0;
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    Ivar *ivars = class_copyPropertyList([self class], count);
    for (NSUInteger i= 0 ;i < count; i++){
        const char *varName = ivar_getName(ivars[i]);
        NSString *name  = [NSString stringWithUTF8String:varName];
        id varValue = [self valueForKey:name];
        if (varValue){
            resultDict[name] = varValue;
        }else{
            resultDict[name] = @"字典的key的value不能为nil！";
        }
        
    }
    free(ivars);
    return resultDict;

}

- (NSDictionary *)allMethods
{
    unsigned int count = 0;
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    Method *methods = class_copyMethodList([self class ], count);
    for ( NSUInteger i = 0; i < count; i++){
        const char *methodName = method_getName(methods[i]);
        NSString *name = [NSString stringWithUTF8String:methodName];
        id methodValue = [self valueForKey:name];
        if (methodValue){
            resultDict[name] = methodValue;
        }else{
            resultDict[name] = @"字典的key的value不能为nil！";
            
        }
        
    }
    free(methods);
    return resultDict;
}
@end
