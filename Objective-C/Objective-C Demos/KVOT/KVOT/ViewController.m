//
//  ViewController.m
//  KVOT
//
//  Created by chandler7k on 2019/3/18.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import "ViewController.h"
#import "Sark.h"
@interface ViewController ()
@property (nonatomic, copy) NSString *testName;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Sark *sark1 = [[Sark alloc] init];
    [sark1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    sark1.name = @"hello";
    [sark1 removeObserver:self forKeyPath:@"name"];
    self.testName = @"hello";
    [self willChangeValueForKey:@"testName"];
    self.testName = @"hello2";
    [self didChangeValueForKey:@"testName"];
    
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
    return NO;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"检测到%@ 的 %@ 变为%@",object, keyPath,change);
}
- (void)willChangeValueForKey:(NSString *)key
{
    [super willChangeValueForKey:key];
    NSLog(@"vc will change");
}

- (void)didChangeValueForKey:(NSString *)key
{
    [super didChangeValueForKey:key];
    NSLog(@"vc did");
}

@end
