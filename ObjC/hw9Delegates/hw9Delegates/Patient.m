//
//  Patient.m
//  hw9Delegates
//
//  Created by Nick on 01.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Patient.h"

@implementation Patient

/* -(void) nowHurts {
    self.whatHurts = arc4random_uniform(3);
} */

- (void) feelsBad {
    self.whatHurts = arc4random_uniform(3);
    self.hasHeadache = arc4random() % 2;
    self.temperature = arc4random_uniform(4) + 36;
}

- (BOOL) hasHighTemperature {
    if (self.temperature >= 37.0) {
        NSLog(@"Doc, help me, i have high temperature!");
        return true;
    }
    NSLog(@"%@ hasn't high temperature", self.name);
    return false;
}

- (void) takePill {                             // лечит от температуры
    NSLog(@"%@ takes a pill. Now your temperature is about 36.6 at celsium.", self.name);
    self.temperature = 36.6;
}

- (void) makeShot {                            // лечит от головной боли
    NSLog(@"Make a shot to %@. Your headache is dissapeared!", self.name);
    self.hasHeadache = NO;
}

@end
