//
//  ViewController.m
//  Receiver
//
//  Created by Grey Lee on 2015/1/8.
//  Copyright (c) 2015年 Grey Lee. All rights reserved.
//

#import <CoreFoundation/CoreFoundation.h>
#import "ViewController.h"

static NSString * const GWLWormholeNotificationName = @"GWLWormholeNotificationName";

void wormholeNotificationCallback(CFNotificationCenterRef center,
                                  void *observer,
                                  CFStringRef name,
                                  const void *object,
                                  CFDictionaryRef userInfo) {
    NSString *identifier = (__bridge NSString *)name;

    [[NSNotificationCenter defaultCenter] postNotificationName:GWLWormholeNotificationName
                                                        object:nil
                                                      userInfo:@{@"identifier": identifier}];
}

@interface ViewController ()

@property (unsafe_unretained) IBOutlet NSTextView *textview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    CFNotificationCenterRef const center = CFNotificationCenterGetDarwinNotifyCenter();
    // The last 2 arguments are ignored if center is a Darwin Notification Center
    CFNotificationCenterAddObserver(center,
                                    (__bridge const void *)(self),
                                    wormholeNotificationCallback,
                                    CFSTR("CFGWLWormholeHello"),
                                    NULL,
                                    0);

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveMessageNotification:)
                                                 name:GWLWormholeNotificationName
                                               object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    CFNotificationCenterRef const center = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(center, (__bridge const void *)(self));
}

- (void)didReceiveMessageNotification:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    NSString *identifier = [userInfo valueForKey:@"identifier"];

    if ([identifier isEqualToString:@"CFGWLWormholeHello"]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"HH:mm:ss.SSSS";
        self.textview.string = [formatter stringFromDate:[NSDate date]];
    }
}

@end
