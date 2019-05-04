//
//  Pensioner.m
//  HW10Notifications
//
//  Created by Nick on 03.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Pensioner.h"
#import "Government.h"

@implementation Pensioner

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(averagePriceChangedNotification:)
                                                     name: GovernmentAveragePriceDidChangeNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(pensionChangedNotification:)
                                                     name: GovernmentPensionDidChangeNotification
                                                   object: nil];
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void) pensionChangedNotification: (NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey: GovernmentPensionUserInfoKey];
    double pension = [value doubleValue];
    
    NSLog(@"So pension was %.2f and now is %.2f", self.pension, pension);
    NSLog(@"%@", pension < self.pension ? @"Pensioners are NOT happy because pension become lower" : @"Pensioners are happy because pension become higher");
    self.pensionDifference = (pension - self.pension) / self.pension * 100;
    self.pension = pension;
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey: GovernmentAveragePriceUserInfoKey];
    double averagePrice = [value doubleValue];
    double inflation = (averagePrice - self.averagePrice) / self.averagePrice * 100;

    NSLog(@"%@", averagePrice < self.averagePrice ? @"Pensioners are happy because average price become lower" : @"Pensioners are NOT happy because average price become higher");
    self.averagePrice = averagePrice;
    
   // NSLog(@"Inflation is %.1f percent(s)", inflation);
    NSLog(@"Pension difference is %.1f percent(s)", self.pensionDifference);
    NSLog(@"%@", inflation > self.pensionDifference ? @"Ebuchaya government *said pensioner*" : @"The best government in the world! *said pensioner*");
}

@end
