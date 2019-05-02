//
//  StupidNurse.h
//  hw9Delegates
//
//  Created by Nick on 02.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

NS_ASSUME_NONNULL_BEGIN

@interface StupidNurse : NSObject <PatientDelegate>

-(void) patientFeelsBad: (Patient*) patient;

@end

NS_ASSUME_NONNULL_END
