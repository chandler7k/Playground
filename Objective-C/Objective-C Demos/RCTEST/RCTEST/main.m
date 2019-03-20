//
//  main.m
//  RCTEST
//
//  Created by chandler7k on 2019/3/17.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSObject *name = [[NSObject alloc] init];
        
        NSLog(@"rc = %lu", (unsigned long)[name retainCount]);
        
        [name release];
        NSLog(@"rc = %lu", (unsigned long)[name retainCount]);
        [name release];
        NSLog(@"rc = %lu", (unsigned long)[name retainCount]);
        
        name = nil;
        NSLog(@"rc = %lu", (unsigned long)[name retainCount]);
    }
    return 0;
}
