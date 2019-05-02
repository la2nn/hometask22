//
//  Patient.h
//  hw9Delegates
//
//  Created by Nick on 01.05.2019.
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
@property (assign, nonatomic) BOOL hasHeadache;
@property (weak, nonatomic) id <PatientDelegate> delegate;
@property (assign, nonatomic) PartOfBody whatHurts;
@property (assign, nonatomic) int rateDoctor;

-(void) feelsBad;
-(BOOL) hasHighTemperature;
-(void) takePill;
-(void) makeShot;

@end

@protocol PatientDelegate <NSObject>

-(void) patientFeelsBad: (Patient*) patient;

@end

NS_ASSUME_NONNULL_END
