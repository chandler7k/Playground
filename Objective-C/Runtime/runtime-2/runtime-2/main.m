//
//  main.m
//  runtime-2
//
//  Created by ChandlerZou on 2018/10/29.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
#import "People+People_Associated.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        People *cang = [[People alloc] init];
        
        cang.name = @"cang";
        cang.age = 18;
        [cang setValue:@"laoshi" forKey:@"occupation"];
        cang.associateBust = @(90);
        cang.associateCallBack = ^(){
            NSLog(@"cang is going to code");
        };
        cang.associateCallBack();
        NSDictionary *propertyResultDic = [cang allProperties];
        for(NSString *propertyName in propertyResultDic.allKeys){
            NSLog(@"propertyName: %@, propertyValue: %@", propertyName, propertyResultDic[propertyName]);
        
        }
    }
    return 0;
}
