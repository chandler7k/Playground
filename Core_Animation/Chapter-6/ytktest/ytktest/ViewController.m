//
//  ViewController.m
//  ytktest
//
//  Created by zouhuanlin on 2019/2/20.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"
#import <YTKNetwork.h>
#import "BDRequest.h"
#import <AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    BDRequest *dr = [[BDRequest alloc] init];
//    [dr startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//        NSLog(@"suc");
//    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//        NSLog(@"fa");
//    }];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:@"https://baidu.com"];
    [manager GET:@"" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"hello");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"fuck you ");
    }];
}


@end
