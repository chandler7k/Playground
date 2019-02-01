//
//  ViewController.m
//  3.4
//
//  Created by zouhuanlin on 2019/1/18.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (nonatomic, strong) CALayer *blueLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.lightGrayColor;
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50, 50, 100, 100);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.blueLayer];
    
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    // get touch point
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    //convert point to the white layer's coordinates
//    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
//
//    if([self.layerView.layer containsPoint:point]){
//        point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
//        if([self.blueLayer containsPoint:point]){
//            [[[UIAlertView alloc] initWithTitle:@"inside the blue layer" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
//        }else{
//            [[[UIAlertView alloc] initWithTitle:@"inside the white layer" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
//        }
//    }
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    CALayer *layer = [self.layerView.layer hitTest:point];
    if(layer == self.blueLayer){
        [[[UIAlertView alloc] initWithTitle:@"In blue layer" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        
    }else if(layer == self.layerView.layer){
        [[[UIAlertView alloc] initWithTitle:@"In white layer" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}
@end
