//
//  ViewController.m
//  FKVC
//
//  Created by zouhuanlin on 2019/3/20.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"
#import "Statics.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSLog(@"%ld",[[dic objectForKey:@"count"] integerValue]);
    
    Statics *st = [[Statics alloc] initWithDictionary:dic];
    NSLog(@"%ld", st.count);
    
}


@end
