//
//  ViewController.h
//  Atomic
//
//  Created by Frank on 2019/7/4.
//  Copyright © 2019 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (copy, atomic) NSString *atomicStr;
@property (copy, nonatomic) NSString *nonAtomicStr;

@end

