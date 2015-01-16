//
//  GWLWormholeCallback.m
//  Receiver
//
//  Created by Grey Lee on 2015/1/16.
//  Copyright (c) 2015年 Grey Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWLWormholeCallback.h"

void wormholeNotificationCallback(CFNotificationCenterRef center,
                                  void *observer,
                                  CFStringRef name,
                                  const void *object,
                                  CFDictionaryRef userInfo) {
    NSString *identifier = (__bridge NSString *)name;

    [[NSNotificationCenter defaultCenter] postNotificationName:@"GWLWormholeNotificationName"
                                                        object:nil
                                                      userInfo:@{@"identifier": identifier}];
}

void GWLWormholeAddObserver(const void *observer) {
    CFNotificationCenterRef const center = CFNotificationCenterGetDarwinNotifyCenter();
    // The last 2 arguments are ignored if center is a Darwin Notification Center
    CFNotificationCenterAddObserver(center,
                                    observer,
                                    wormholeNotificationCallback,
                                    CFSTR("CFGWLWormholeHello"),
                                    NULL,
                                    0);
}

void GWLWormholeRemoveObserver(const void *observer) {
    CFNotificationCenterRef const center = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(center, observer);
}