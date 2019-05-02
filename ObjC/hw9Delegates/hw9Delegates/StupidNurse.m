//
//  StupidNurse.m
//  hw9Delegates
//
//  Created by Nick on 02.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "StupidNurse.h"

@implementation StupidNurse

- (void)patientFeelsBad:(Patient*) patient {
    NSLog(@"Good day, %@", patient.name);
    if (patient.hasHighTemperature ) {
        NSLog(@"Hmm, well, take this..");
        patient.temperature = arc4random_uniform(4) + 38 ;
        NSLog(@"%@ now has %f temperature!!!", patient.name, patient.temperature);
    }
    
    if (patient.hasHeadache) {
        NSLog(@"Please cure my headache..");
        NSLog(@"Just run nahooy, %@ ;)", patient.name);
    }
    
    patient.rateDoctor = 0;
    NSLog(@"fck u bitch c:");
}

@end
