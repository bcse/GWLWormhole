//
//  ViewController.swift
//  Receiver
//
//  Created by Grey Lee on 2015/1/16.
//  Copyright (c) 2015年 Grey Lee. All rights reserved.
//

import Cocoa
import CoreFoundation

class ViewController: NSViewController {

    @IBOutlet var textview: NSTextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let center = CFNotificationCenterGetDarwinNotifyCenter()
//        CFNotificationCenterAddObserver(center,
//            unsafeAddressOf(self),
//            CFNotificationCallback(COpaquePointer([wormholeNotificationCallback])),
//            "CFGWLWormholeHello" as CFString,
//            nil,
//            CFNotificationSuspensionBehavior.DeliverImmediately);

        GWLWormholeAddObserver(unsafeAddressOf(self))
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveMessageNotification:", name: "GWLWormholeNotificationName", object: nil)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        GWLWormholeRemoveObserver(unsafeAddressOf(self))
//        let center = CFNotificationCenterGetDarwinNotifyCenter()
//        CFNotificationCenterRemoveEveryObserver(center, unsafeAddressOf(self))
    }

    func didReceiveMessageNotification(notification: NSNotification) {
        if let userInfo: NSDictionary = notification.userInfo {
            if let identifier: NSString = userInfo["identifier"] as? NSString {
                let formatter = NSDateFormatter()
                formatter.dateFormat = "HH:mm:ss.SSSS"
                self.textview.string = formatter.stringFromDate(NSDate())
            }
        }
    }
}

