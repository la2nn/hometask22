//
//  Student.m
//  HW13Multithreading
//
//  Created by Nick on 06.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Student.h"
#import <UIKit/UIKit.h>

@interface Student ()

+ (dispatch_queue_t) studentsQueue;

@end

@implementation Student

- (void) guessNumber: (int) maxNumberOfRange secretNumber: (int) answer startTime: (double) startTime {
    dispatch_async([Student studentsQueue], ^{
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        
        int result = arc4random_uniform(maxNumberOfRange + 1);
        NSMutableSet *guessedNumbers = [[NSMutableSet alloc] init];
        
        while (result != answer) {
            result = arc4random_uniform(maxNumberOfRange + 1);
            id tmp = [NSNumber numberWithInt:result];
            if ([guessedNumbers containsObject: tmp]) {
                break;
            }
            [guessedNumbers addObject: [NSNumber numberWithInt:tmp]];
            NSLog(@"%@ guess it's %d", self.name, result);
        }

        NSLog(@"%@ WIN THIS ONE -> %d", self.name, result);
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    });
}

+ (dispatch_queue_t) studentsQueue {
    static dispatch_queue_t queue;
    static dispatch_once_t task;
    dispatch_once(&task, ^{
        queue = dispatch_queue_create("nnick.multithreading.queue", DISPATCH_QUEUE_CONCURRENT);
    });
    return queue;
}

@end
