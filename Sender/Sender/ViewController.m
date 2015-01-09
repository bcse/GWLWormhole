//
//  ViewController.m
//  Sender
//
//  Created by Grey Lee on 2015/1/8.
//  Copyright (c) 2015年 Grey Lee. All rights reserved.
//

#import <CoreFoundation/CoreFoundation.h>
#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (IBAction)sendAction:(id)sender {
    CFNotificationCenterRef const center = CFNotificationCenterGetDarwinNotifyCenter();

    // The last 3 arguments are ignored if center is a Darwin Notification Center
    CFNotificationCenterPostNotification(center, CFSTR("CFGWLWormholeHello"), NULL, NULL, 0);
}

@end
