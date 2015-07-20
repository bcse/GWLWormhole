# How This Works

1. Receiver.app observing `CFGWLWormholeHello` from Darwin Notification Center and `GWLWormholeNotificationName` from default notification center.
2. Sender.app post `CFGWLWormholeHello` to Darwin Notification Center. Darwin Notification Center is a system-wide notification center, so Receiver.app will receive the notification.
3. After Receiver.app received `CFGWLWormholeHello` from Darwin Notification Center, it will post a `GWLWormholeNotificationName` notification to its default notification center. -- Because CFNotificationCenterAddObserver doesn't allow a member function as callback handler, so we have to repost the notification to default notification center. And then we can handle it in a member function.

## Note

1. OS X support distributed notification center and that can be used for IPC, too. On the other hand, iOS doesn't support distributed notification center.
