//
//  Human.h
//  HW7
//
//  Created by Nick on 25.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Swimmers.h"
#import "Runners.h"

NS_ASSUME_NONNULL_BEGIN

@interface Human : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) int age;

@end

NS_ASSUME_NONNULL_END
