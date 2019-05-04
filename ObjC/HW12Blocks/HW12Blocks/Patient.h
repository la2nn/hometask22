//
//  Patient.h
//  HW12Blocks
//
//  Created by Nick on 05.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    stomach,
    leg,
    arm,
    eyes
} PartOfBody;

@protocol PatientDelegate;

@interface Patient : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) double temperature;
@property (assign, nonatomic) PartOfBody whatHurts;
//@property (assign, nonatomic) int rateDoctor;

//- (void) feelsBad;
- (void) patientFeelsBad: (void(^)(int, double)) hurtBlock;;
- (BOOL) hasHighTemperature;
- (void) takePill;

@end


NS_ASSUME_NONNULL_END
