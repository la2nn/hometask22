//
//  Businessman.h
//  HW10Notifications
//
//  Created by Nick on 03.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Businessman : NSObject

@property (assign, nonatomic) double taxLevel;
@property (assign, nonatomic) double averagePrice;
@property (assign, nonatomic) double taxDifference;

@end

NS_ASSUME_NONNULL_END
