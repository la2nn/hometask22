//
//  Doctor.m
//  hw9Delegates
//
//  Created by Nick on 01.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor


 
-(void) patientFeelsBad: (Patient*) patient {
    NSLog(@"Hello, %@", patient.name);
    patient.rateDoctor = 5;
    NSMutableString *listOfAches = [[NSMutableString alloc] init];
    if (patient.hasHighTemperature ) {
        patient.takePill;
        patient.rateDoctor -= arc4random_uniform(2);
        [listOfAches appendString: @"High temperature | "];
    }
    
    if (patient.hasHeadache) {
         NSLog(@"Please cure my headache..");
        patient.makeShot;
        patient.rateDoctor -= arc4random_uniform(2);
        [listOfAches appendString: @"Headache | "];
    }
    
    NSLog(@"Doctor, And i have %d-ache", patient.whatHurts);
    NSLog(@"*make something to treat him*");
    patient.rateDoctor -= arc4random_uniform(3);
    [listOfAches appendString: [NSString stringWithFormat:@"%d-ache", patient.whatHurts] ];
    
    NSLog(@"My rate is - %d", patient.rateDoctor);
    self.dayReport[patient.name] = listOfAches;
    //[self.dayReport setObject:listOfAches forKey:patient.name];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dayReport = [NSMutableDictionary dictionary];
    }
    return self;
}

@end
