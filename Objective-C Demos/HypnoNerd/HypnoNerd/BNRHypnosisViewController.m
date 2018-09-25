//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by ChandlerZou on 2018/9/19.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"
@interface BNRHypnosisViewController ()
//@property (weak,nonatomic) IBOutlet UITextField* textField;
@end

@implementation BNRHypnosisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadView
{
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"ads";
    textField.returnKeyType = UIReturnKeyDone;
    
    [backgroundView addSubview:textField];
    textField.delegate = self;
    self.view = backgroundView;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        self.tabBarItem.title = @"Hypnotize";
        
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




@end

