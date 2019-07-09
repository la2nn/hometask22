//
//  Government.m
//  HW10Notifications
//
//  Created by Nick on 03.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Government.h"

NSString* const GovernmentTaxLevelDidChangeNotification = @"GovernmentTaxLevelDidChangeNotification";
NSString* const GovernmentSalaryDidChangeNotification = @"GovernmentSalaryDidChangeNotification";
NSString* const GovernmentPensionDidChangeNotification = @"GovernmentPensionDidChangeNotification";
NSString* const GovernmentAveragePriceDidChangeNotification = @"GovernmentAveragePriceDidChangeNotification";

NSString* const GovernmentTaxLevelUserInfoKey = @"GovernmentTaxLevelUserInfoKey";
NSString* const GovernmentSalaryUserInfoKey = @"GovernmentSalaryUserInfoKey";
NSString* const GovernmentPensionUserInfoKey = @"GovernmentPensionUserInfoKey";
NSString* const GovernmentAveragePriceUserInfoKey = @"GovernmentAveragePriceUserInfoKey";

@implementation Government

- (instancetype)init
{
    self = [super init];
    if (self) {
        _taxLevel = 15;
        _salary = 500;
        _pension = 250;
        _averagePrice = 40;
    }
    return self;
}

- (void) setTaxLevel:(double)taxLevel {
    _taxLevel = taxLevel;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithDouble:taxLevel] forKey:GovernmentTaxLevelUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName: GovernmentTaxLevelDidChangeNotification
                                                        object: nil
                                                      userInfo: dictionary];
}

- (void) setSalary:(double)salary {
    _salary = salary;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithDouble:salary] forKey:GovernmentSalaryUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName: GovernmentSalaryDidChangeNotification
                                                        object: nil
                                                      userInfo: dictionary];
}

- (void) setPension:(double)pension {
    _pension = pension;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithDouble:pension] forKey:GovernmentPensionUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName: GovernmentPensionDidChangeNotification
                                                        object: nil
                                                      userInfo: dictionary];
}

/*- (double) inflation:(double)newAveragePrice {
    return (newAveragePrice - _averagePrice) / _averagePrice * 100;
} */

- (void) setAveragePrice:(double)averagePrice {
//    [self inflation:averagePrice];
    //_inflation = (averagePrice - _averagePrice) / _averagePrice * 100;
    _averagePrice = averagePrice;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithDouble:averagePrice] forKey:GovernmentAveragePriceUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName: GovernmentAveragePriceDidChangeNotification
                                                        object: nil
                                                      userInfo: dictionary];
}



@end
 
