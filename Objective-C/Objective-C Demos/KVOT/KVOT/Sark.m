//
//  Sark.m
//  KVOT
//
//  Created by chandler7k on 2019/3/18.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import "Sark.h"

@implementation Sark

- (void)setName:(NSString *)name
{
    NSLog(@"setName");
    _name = name;
}
- (void)willChangeValueForKey:(NSString *)key
{
    [super willChangeValueForKey:key];
    NSLog(@"will change value for key");
}

- (void)didChangeValueForKey:(NSString *)key
{
    [super didChangeValueForKey:key];
    NSLog(@"did change value for key");
}
@end
