//
//  Doctor.m
//  HW10Notifications
//
//  Created by Nick on 03.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Doctor.h"
#import "Government.h"

@implementation Doctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(averagePriceChangedNotification:)
                                                     name: GovernmentAveragePriceDidChangeNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(salaryChangedNotification:)
                                                     name: GovernmentSalaryDidChangeNotification
                                                   object: nil];
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void) salaryChangedNotification:(NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey: GovernmentSalaryUserInfoKey];
    double salary = [value doubleValue];
    
    NSLog(@"So salary was %.2f and now is %.2f", self.salary, salary);
    NSLog(@"%@", salary < self.salary ? @"Doctors are NOT happy because salary become lower" : @"Doctors are happy because salary become higher");
    self.salaryDifference = (salary - self.salary) / self.salary * 100;
    self.salary = salary;
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey: GovernmentAveragePriceUserInfoKey];
    double averagePrice = [value doubleValue];
    double inflation = (averagePrice - self.averagePrice) / self.averagePrice * 100;
    
    NSLog(@"%@", averagePrice < self.averagePrice ? @"Doctors are happy because average price become lower" : @"Doctors are NOT happy because average price become higher");
    self.averagePrice = averagePrice;
    
    NSLog(@"Inflation is %.1f percent(s)", inflation);
    NSLog(@"Salary difference is %.1f percent(s)", self.salaryDifference);
    NSLog(@"%@", inflation > self.salaryDifference ? @"Ebuchaya government *said doctor*" : @"The best government in the world! *said doctor*");
}

@end


//salary < self.salary ? NSLog(@"Doctors are NOT happy because salary become lower") : NSLog(@"Doctors are happy because salary become higher");
