//
//  ViewController.m
//  Atomic
//
//  Created by Frank on 2019/7/4.
//  Copyright © 2019 Frank. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self atomicTest];
//    [self atomicTestAddLock];
}

- (void)atomicTest {
    dispatch_queue_t concurrent = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // Thread A
    dispatch_async(concurrent, ^{
        // Task A
        NSLog(@"Enter Thread A");
        for (int count = 0; count < 100; count++) {
            self.atomicStr = @"A";
            self.nonAtomicStr = @"A";
            if (![@"A" isEqualToString:_atomicStr]) {
                NSLog(@"[Atomic] Task A's result is not expected. %@", _atomicStr);
            }
            if (![@"A" isEqualToString:_nonAtomicStr]) {
                NSLog(@"[NonAtomic] Task A's result is not expected. %@", _nonAtomicStr);
            }
        }
    });
    
    // Thread B
    dispatch_async(concurrent, ^{
        // Task B
        NSLog(@"Enter Thread B");
        for (int count = 0; count < 100; count++) {
            self.atomicStr = @"B";
            self.nonAtomicStr = @"B";
            if (![@"B" isEqualToString:_atomicStr]) {
                NSLog(@"[Atomic] Task B's result is not expected. %@", _atomicStr);
            }
            if (![@"B" isEqualToString:_nonAtomicStr]) {
                NSLog(@"[NonAtomic] Task B's result is not expected. %@", _nonAtomicStr);
            }
        }
    });
}

- (void)atomicTestAddLock {
    dispatch_queue_t concurrent = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // Thread A
    dispatch_async(concurrent, ^{
        // Task A
        NSLog(@"Enter Thread A");
        @synchronized (self) {
            for (int count = 0; count < 100; count++) {
                self.atomicStr = @"A";
                self.nonAtomicStr = @"A";
                if (![@"A" isEqualToString:_atomicStr]) {
                    NSLog(@"[Atomic] Task A's result is not expected. %@", _atomicStr);
                }
                if (![@"A" isEqualToString:_nonAtomicStr]) {
                    NSLog(@"[NonAtomic] Task A's result is not expected. %@", _nonAtomicStr);
                }
            }
        }
    });
    
    // Thread B
    dispatch_async(concurrent, ^{
        // Task B
        NSLog(@"Enter Thread B");
        @synchronized (self) {
            for (int count = 0; count < 100; count++) {
                self.atomicStr = @"B";
                self.nonAtomicStr = @"B";
                if (![@"B" isEqualToString:_atomicStr]) {
                    NSLog(@"[Atomic] Task B's result is not expected. %@", _atomicStr);
                }
                if (![@"B" isEqualToString:_nonAtomicStr]) {
                    NSLog(@"[NonAtomic] Task B's result is not expected. %@", _nonAtomicStr);
                }
            }
        }
    });
}

@end
