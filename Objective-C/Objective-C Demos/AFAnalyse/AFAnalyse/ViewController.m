//
//  ViewController.m
//  AFAnalyse
//
//  Created by zouhuanlin on 2019/1/21.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)func1
{
    NSLog(@"func1");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSString *selectorString = NSStringFromSelector(sel);
    if([selectorString isEqualToString:@"method1"]){
        class_addMethod(self, @selector(method1), (IMP)func1, "@:");
    }
    return [super resolveInstanceMethod:sel];
}


@end
