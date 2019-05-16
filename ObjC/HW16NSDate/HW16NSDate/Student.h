//
//  Student.h
//  HW16NSDate
//
//  Created by Nick on 15.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (assign, nonatomic) NSDate *dateOfBirth;
@property (assign, nonatomic) NSString *firstName;
@property (assign, nonatomic) NSString *secondName;

@end

NS_ASSUME_NONNULL_END

