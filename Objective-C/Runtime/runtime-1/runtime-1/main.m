//
//  main.m
//  runtime-1
//
//  Created by ChandlerZou on 2018/10/29.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/objc-runtime.h>
#import <objc/runtime.h>
#import <objc/message.h>

void sayFunction(id self, SEL _cmd, id some){
    NSLog(@"%@岁的%@ 说： %@",object_getIvar(self, class_getInstanceVariable([self class], "_age")),[self valueForKey:@"name"], some);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        Class People = objc_allocateClassPair([NSObject class], "Persion", 0);
        class_addIvar(People, "_name", sizeof(NSString*), log2(sizeof(NSString*)), @encode(NSString*));
        class_addIvar(People, "_age", sizeof(int), sizeof(int), @encode(int));
        
        SEL s = sel_registerName("say:");
        class_addMethod(People, s, (IMP)sayFunction, "v@:@");
        
        objc_registerClassPair(People);
        
        id peopleInstance = [[People alloc] init];
        [peopleInstance setValue:@"苍老师" forKey:@"name"];
        Ivar ageIvar = class_getInstanceVariable(People, "_age");
        object_setIvar(peopleInstance, ageIvar, @18);
        ((void (*)(id, SEL, id))objc_msgSend)(peopleInstance,s,@"大家好");
        peopleInstance = nil;
        objc_disposeClassPair(People);
    }
    return 0;
}
