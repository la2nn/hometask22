//
//  AppDelegate.m
//  hw9Delegates
//
//  Created by Nick on 01.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"
#import "Doctor.h"
#import "StupidNurse.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Doctor *doc1 = [[Doctor alloc] init];
    Doctor *doc2 = [[Doctor alloc] init];
    Doctor *doc3 = [[Doctor alloc] init];
    StupidNurse *nurse1 = [[StupidNurse alloc] init];
    StupidNurse *nurse2 = [[StupidNurse alloc] init];
    
    Patient *patient1 = [[Patient alloc] init];
    patient1.name = @"Sergey";
    patient1.temperature = 36.7;
    patient1.hasHeadache = NO;
    patient1.delegate = doc1;
    
    Patient *patient2 = [[Patient alloc] init];
    patient2.name = @"Vadim";
    patient2.temperature = 39.4;
    patient2.hasHeadache = YES;
    patient2.delegate = doc3;
    
    Patient *patient3 = [[Patient alloc] init];
    patient3.name = @"Mitya";
    patient3.temperature = 36.9;
    patient3.hasHeadache = YES;
    patient3.delegate = doc1;
    
    Patient *patient4 = [[Patient alloc] init];
    patient4.name = @"Egor";
    patient4.temperature = 36.5;
    patient4.hasHeadache = YES;
    patient4.delegate = nurse1;
    
    Patient *patient5 = [[Patient alloc] init];
    patient5.name = @"Ruslan";
    patient5.temperature = 37.0;
    patient5.hasHeadache = NO;
    patient5.delegate = nurse2;
    
    Patient *patient6 = [[Patient alloc] init];
    patient6.name = @"Maxim";
    patient6.temperature = 36.5;
    patient6.hasHeadache = YES;
    patient6.delegate = doc2;
    
    Patient *patient7 = [[Patient alloc] init];
    patient7.name = @"Fedor";
    patient7.temperature = 36.5;
    patient7.hasHeadache = YES;
    patient7.delegate = doc2;
    
    Patient *patient8 = [[Patient alloc] init];
    patient8.name = @"Abduhafis";
    patient8.temperature = 36.5;
    patient8.hasHeadache = YES;
    patient8.delegate = doc1;
    
    Patient *patient9 = [[Patient alloc] init];
    patient9.name = @"Sema";
    patient9.temperature = 36.5;
    patient9.hasHeadache = YES;
    patient9.delegate = doc3;
    
    Patient *patient10 = [[Patient alloc] init];
    patient10.name = @"Vlad";
    patient10.temperature = 36.5;
    patient10.hasHeadache = YES;
    patient10.delegate = doc3;
    
    Patient *patient11 = [[Patient alloc] init];
    patient11.name = @"Daniil";
    patient11.temperature = 36.5;
    patient11.hasHeadache = YES;
    patient11.delegate = doc2;
    
    NSArray *patients = [[NSArray alloc] initWithObjects: patient1, patient2, patient3, patient4, patient5, patient6, patient7, patient8, patient9, patient10, patient11, nil];
    NSArray *doctors = [[NSArray alloc] initWithObjects: doc1, doc2, doc3, nil];
    
    for (Patient *patient in patients) {
        patient.feelsBad;
        [patient.delegate patientFeelsBad: patient];
        if (patient.rateDoctor <= 3) {
            patient.delegate = doctors[arc4random_uniform(2)];
        }
        NSLog(@"-------------------------");
    }
    
    NSLog(@"%@", doc1.dayReport);
    NSLog(@"%@", doc2.dayReport);
    NSLog(@"%@", doc3.dayReport);
    
    doc1.dayReport.removeAllObjects;
    doc2.dayReport.removeAllObjects;
    doc3.dayReport.removeAllObjects;
    
//------------------- типа новый день --------------------
    NSLog(@"! ! !   NEW DAY    ! ! !");
    
    for (Patient *patient in patients) {
        patient.feelsBad;
        [patient.delegate patientFeelsBad: patient];
        if (patient.rateDoctor <= 3) {
            patient.delegate = doctors[arc4random_uniform(2)];
        }
        NSLog(@"-------------------------");
    }
    
    NSLog(@"%@", doc1.dayReport);
    NSLog(@"%@", doc2.dayReport);
    NSLog(@"%@", doc3.dayReport);
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
