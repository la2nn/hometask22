//
//  Businessman.m
//  HW10Notifications
//
//  Created by Nick on 03.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Businessman.h"
#import "Government.h"

@implementation Businessman

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(averagePriceChangedNotification:)
                                                     name: GovernmentAveragePriceDidChangeNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(taxLevelChangedNotification:)
                                                     name: GovernmentTaxLevelDidChangeNotification
                                                   object: nil];
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void) taxLevelChangedNotification: (NSNotification*) notification {
    NSNumber *value = [notification.userInfo objectForKey:GovernmentTaxLevelUserInfoKey];
    double taxLevel = [value doubleValue];
    
    NSLog(@"So tax level was %.2f and now is %.2f", self.taxLevel, taxLevel);
    taxLevel < self.taxLevel ? NSLog(@"Businessmans are happy because tax level become lower") : NSLog(@"Businessmans are NOT happy because tax level become higher");
    self.taxDifference = taxLevel - self.taxLevel;
    self.taxLevel = taxLevel;
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    double averagePrice = [value doubleValue];
    double inflation = (averagePrice - self.averagePrice) / self.averagePrice * 100;
    
    averagePrice < self.averagePrice ? NSLog(@"Businessmans are happy because average price become lower") : NSLog(@"Businessmans are NOT happy because average price become higher");
    self.averagePrice = averagePrice;
    
    // NSLog(@"Inflation is %.1f percent(s)", inflation);
    NSLog(@"Tax difference is %.1f percent(s)", self.taxDifference);
    if ((inflation > 0 && self.taxDifference < 0) || (inflation < 0 && self.taxDifference > 0 )) {
        NSLog(@"Normal government *said businessman*");
    } else if (inflation > 0 || self.taxDifference > 0) {
        NSLog(@"Ebuchaya government *said businessman*");
    } else {
        NSLog(@"BEST government *said businessman*");
    }
}

@end
