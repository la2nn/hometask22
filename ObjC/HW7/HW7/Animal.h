//
//  Animal.h
//  HW7
//
//  Created by Nick on 25.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jumpers.h"
#import "Swimmers.h"
#import "Runners.h"

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject

@end


@interface Kangaroo : Animal <Jumpers>

@end


@interface Fish : Animal <Swimmers>

@end

@interface Ostrich : Animal <Runners, Jumpers>             // по заданию

@end

NS_ASSUME_NONNULL_END
