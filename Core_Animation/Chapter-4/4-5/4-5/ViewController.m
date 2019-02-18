//
//  ViewController.m
//  4-5
//
//  Created by zouhuanlin on 2019/2/18.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *digitsView;
@property (weak, nonatomic) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *digits = [UIImage imageNamed:@"Digits.png"];
    for(UIView *view in self.digitsView){
        view.layer.contents = (__bridge id)digits.CGImage;
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 0.1);
        view.layer.contentsGravity = kCAGravityResizeAspect;
    }
    
    // start timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    [self tick];
    
}
- (void)setDigit:(NSInteger)digit forView:(UIView *)view
{
    view.layer.contentsRect = CGRectMake(digit * 0.1, 0, 0.1, 1.0);
}

- (void)tick
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger uints = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:uints fromDate:[NSDate date]];
    
    [self setDigit:components.hour / 10 forView:self.digitsView[0]];
    [self setDigit:components.hour % 10 forView:self.digitsView[1]];
    
    //set minutes
    [self setDigit:components.minute / 10 forView:self.digitsView[2]];
    [self setDigit:components.minute % 10 forView:self.digitsView[3]];
    
    //set seconds
    [self setDigit:components.second / 10 forView:self.digitsView[4]];
    [self setDigit:components.second % 10 forView:self.digitsView[5]];
}


@end
