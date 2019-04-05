//
//  ViewController.m
//  AFAnalyse
//
//  Created by zouhuanlin on 2019/1/21.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@class Person;

@interface Person:NSObject
@property (nonatomic, strong) NSString *name;

@end

@implementation Person

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self kvo1];
}

- (void)func1
{
    NSLog(@"func1");
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    NSString *selectorString = NSStringFromSelector(sel);
//    if([selectorString isEqualToString:@"method1"]){
////        class_addMethod(self, @selector(method1), (IMP)func1, "@:");
//    }
//    return [super resolveInstanceMethod:sel];
//}


- (void)kvo1
{
    Person *p1 = [[Person alloc] init];
    p1.name = @"tom";
    [p1 addObserver:p1 forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    p1.name = @"kin";
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"p1 changed");
}
@end
