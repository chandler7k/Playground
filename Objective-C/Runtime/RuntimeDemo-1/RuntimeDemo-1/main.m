//
//  main.m
//  Runtimedemo-1
//
//  Created by zouhuanlin on 2019/2/14.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif
void sayFunction(id self, SEL _cmd, id some)
{
    NSLog(@"%@ years old %@ says: %@", object_getIvar(self, class_getInstanceVariable([self class], "_age")), [self valueForKey:@"name"], some);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        Class People = objc_allocateClassPair([NSObject class], "Person", 0);
        class_addIvar(People, "_name", sizeof(NSString*), log2(sizeof(NSString*)), @encode(NSString*));
        
        class_addIvar(People, "_age", sizeof(int), sizeof(int), @encode(int));
        
        SEL s = sel_registerName("say:");
        class_addMethod(People, s, (IMP)sayFunction, "v@:@");
        
        // 注册类 只有注册了才能allocated
        objc_registerClassPair(People);
        
        id peopleInstance = [[People alloc] init];
        [peopleInstance setValue:@"canglaoshi" forKey:@"name"];
        
        Ivar ageIvar = class_getInstanceVariable(People, "_age");
        object_setIvar(peopleInstance, ageIvar, @18);
        
        //msgsend
        // 这里最好是把objc_msgSend强制转换成接受参数形式。
        ((void (*)(id, SEL, id))objc_msgSend)(peopleInstance, s, @"hello");
        peopleInstance = nil;
        objc_disposeClassPair(People);
        
        
    }
    return 0;
}
