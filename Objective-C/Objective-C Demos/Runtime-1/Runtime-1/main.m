//
//  main.m
//  Runtime-1
//
//  Created by chandler7k on 2019/3/11.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/objc-runtime.h>
#import <objc/runtime.h>
#import "MyClass.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        
//        Class cls = objc_allocateClassPair(MyClass.class, "MySubClass", 0);
//        class_addMethod(cls, @selector(submethod1), (IMP)imp_submethod1, "v@:");
//        class_replaceMethod(cls, @selector(method1), (IMP)imp_submethod1, "v@:");
//        class_addIvar(cls, "_ivar1", sizeof(NSString*), log(sizeof(NSString *)),  "i");
    }
    
    return 0;
}
