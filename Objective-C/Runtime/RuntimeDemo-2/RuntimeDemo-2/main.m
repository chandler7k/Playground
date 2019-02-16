//
//  main.m
//  RuntimeDemo-2
//
//  Created by zouhuanlin on 2019/2/14.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        People *cangTeacher = [[People alloc] init];
        cangTeacher.name = @"cang";
        cangTeacher.age = 18;
        [cangTeacher setValue:@"sensi" forKey:@"occupation"];
        
        NSDictionary *propertyResultDict = [cangTeacher allProperties];
        for(NSString *propertyName in propertyResultDict.allKeys){
            NSLog(@"propertyName: %@, propertyValue: %@", propertyName, propertyResultDict[propertyName]);
        }
        
        NSDictionary *ivarResultDic = [cangTeacher allIvars];
        for (NSString *ivarName in ivarResultDic.allKeys) {
            NSLog(@"ivarName:%@, ivarValue:%@",ivarName, ivarResultDic[ivarName]);
        }
        
        NSDictionary *methodResultDic = [cangTeacher allMethods];
        for (NSString *methodName in methodResultDic.allKeys) {
            NSLog(@"methodName:%@, argumentsCount:%@", methodName, methodResultDic[methodName]);
        }
    }
    return 0;
}
