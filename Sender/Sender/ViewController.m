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

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)sendAction:(id)sender {
    CFNotificationCenterRef const center = CFNotificationCenterGetDarwinNotifyCenter();
    CFDictionaryRef const userInfo = NULL;
    BOOL const deliverImmediately = YES;
    CFStringRef str = (__bridge CFStringRef)@"CFGWLWormholeHello";

    // The last 3 arguments are ignored if center is a Darwin Notification Center
    CFNotificationCenterPostNotification(center, str, NULL, userInfo, deliverImmediately);
}

@end
