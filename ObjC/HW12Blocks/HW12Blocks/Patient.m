//
//  Patient.m
//  HW12Blocks
//
//  Created by Nick on 05.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (void) patientFeelsBad: (void(^)(int, double)) hurtBlock {
    self.temperature = drand48() + 36.8;
    self.whatHurts = arc4random_uniform(3);
    hurtBlock(self.whatHurts, self.temperature);
}

- (BOOL) hasHighTemperature {
    if (self.temperature >= 37.0) {
        NSLog(@"Help me, i have high temperature - %.1f!", self.temperature);
        return true;
    }
    NSLog(@"%@ hasn't high temperature", self.name);
    return false;
}

- (void) takePill {
    NSLog(@"%@ takes a pill. Now your temperature is about 36.6 at celsium.", self.name);
    self.temperature = 36.6;
}

@end

