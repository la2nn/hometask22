//
//  Doctor.h
//  hw9Delegates
//
//  Created by Nick on 01.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
NS_ASSUME_NONNULL_BEGIN

@interface Doctor : NSObject <PatientDelegate>
@property (strong, nonatomic) NSMutableDictionary *dayReport;

-(void) patientFeelsBad: (Patient*) patient;

@end

NS_ASSUME_NONNULL_END
