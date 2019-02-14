//
//  People.m
//  RuntimeDemo-2
//
//  Created by zouhuanlin on 2019/2/14.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "People.h"
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation People
- (NSDictionary *)allProperties
{
    unsigned int count = 0;
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    
    for(NSUInteger i = 0; i < count; i++){
        const char *propertyName = property_getName(properties[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        id propertyValue = [self valueForKey:name];
        
        if (propertyName){
            resultDict[name] = propertyValue;
        }else{
            resultDict[name] = @"字典的Key对应的value不能为nil";
        }
    }
    free(properties);
    
    return  resultDict;
}

- (NSDictionary *)allIvars
{
    unsigned int count = 0;
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    for (NSUInteger i = 0; i< count; i++){
        const char *varName = ivar_getName(ivars[i]);
        NSString *name = [NSString stringWithUTF8String:varName];
        
        id varValue = [self valueForKey:name];
        
        if(varValue){
            resultDict[name] = varValue;
        }else{
            resultDict[name] = @"字典的Key对应的value不能为nil";
        }
    }
    free(ivars);
    return resultDict;
}

- (NSDictionary *)allMethods
{
    unsigned int count = 0;
    Method *methods = class_copyMethodList([self class], &count);
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    
    for (NSUInteger i = 0; i < count ;  i++){
        SEL methodSEL = method_getName(methods[i]);
        const char *methodName = sel_getName(methodSEL);
        NSString *name = [NSString stringWithUTF8String:methodName];
        
        int arguments = method_getNumberOfArguments(methods[i]);
        
        resultDict[name] = @(arguments-2);
        
    }
    
    free(methods);
    return resultDict;
}

@end
