//
//  Student.h
//  HW13Multithreading
//
//  Created by Nick on 06.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (strong, nonatomic) NSString *name;

- (void) guessNumber: (int) maxNumberOfRange secretNumber: (int) answer startTime: (double) startTime;

@end

NS_ASSUME_NONNULL_END
