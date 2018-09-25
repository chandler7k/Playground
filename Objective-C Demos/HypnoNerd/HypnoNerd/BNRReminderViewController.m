//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by ChandlerZou on 2018/9/19.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

#import "BNRReminderViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface BNRReminderViewController ()
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation BNRReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datePicker.maximumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        self.tabBarItem.title = @"Reminder";
        
    }
    return self;
}


- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@",date);
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"ME";
    note.fireDate = date;
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"hello";
    content.body = @"hello";
    UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:date repeats:false];
    
    UNNotificationRequest* request = [UNNotificationRequest
                                      requestWithIdentifier:@"MorningAlarm" content:content trigger:trigger];
    
}

@end
