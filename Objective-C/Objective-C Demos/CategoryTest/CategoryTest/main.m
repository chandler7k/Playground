//
//  main.m
//  CategoryTest
//
//  Created by chandler7k on 2019/3/13.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Child.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Child *child = [[Child alloc] init];
        NSLog(@"%@", child);
        [child run];
    }
    return 0;
}
