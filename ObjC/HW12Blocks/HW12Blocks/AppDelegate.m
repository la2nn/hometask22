//
//  AppDelegate.m
//  HW12Blocks
//
//  Created by Nick on 04.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
#import "Patient.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSArray *patients;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    void (^testBlock)(void) = ^{
        NSLog(@"Call test block");
    };
    testBlock();
    
    NSLog(@"------");
    
    void (^testBlockWithString)(NSString*) = ^(NSString* string){
        NSLog(@"Print sting -> %@", string);
    };
    testBlockWithString(@"TestTESTtest");
    
    NSLog(@"------");
    
    NSString* (^testBlockWithStringAndReturn)(NSString*) = ^(NSString* string){
        NSLog(@"Just %@", string);
        return @"Test was successful";
    };
    testBlockWithStringAndReturn(@"TestTESTtest");
    NSLog(@"%@", testBlockWithStringAndReturn(@"One more test with that block"));
    
    NSLog(@"------");
    
    int (^testBlockWithReturn)(void) = ^{
        NSLog(@"you will get random int number");
        int rndInt = arc4random_uniform(333);
        return rndInt;
    };
    NSLog(@"%d", testBlockWithReturn());
    
    [self methodWhatTakesBlock:^(int number) {
        NSLog(@"squared value -> %d", number * number);
    }];
    
    NSLog(@"-----------------------------");
    
    Student *student1 = [[Student alloc] init];
    Student *student2 = [[Student alloc] init];
    Student *student3 = [[Student alloc] init];
    Student *student4 = [[Student alloc] init];
    Student *student5 = [[Student alloc] init];
    Student *student6 = [[Student alloc] init];
    Student *student7 = [[Student alloc] init];
    Student *student8 = [[Student alloc] init];
    Student *student9 = [[Student alloc] init];
    Student *student10 = [[Student alloc] init];
    
    student1.firstName = @"Ilya";
    student2.firstName = @"Vadim";
    student3.firstName = @"Maxim";
    student4.firstName = @"Senya";
    student5.firstName = @"Alex";
    student6.firstName = @"Stepa";
    student7.firstName = @"Ruslan";
    student8.firstName = @"Nursultan";
    student9.firstName = @"Felix";
    student10.firstName = @"Netflix";
    
    student1.secondName = student5.secondName = student10.secondName = @"Leopoldov";
    student2.secondName = @"Zaycev";
    student3.secondName = @"Fedorov";
    student4.secondName = @"Petrov";
    student6.secondName = @"Ivanov";
    student7.secondName = @"Palkin";
    student8.secondName = @"Malkin";
    student9.secondName = @"Zaebalkin";
    
    NSArray *students = [[NSArray alloc] initWithObjects: student1, student2, student3, student4, student5, student6, student7, student8, student9, student10, nil];
    students = [students sortedArrayUsingComparator:^NSComparisonResult(Student*  _Nonnull obj1, Student*  _Nonnull obj2) {
        if (obj1.secondName > obj2.secondName) {
            return [obj1.secondName compare: obj2.secondName];
        } else if (obj1.secondName == obj2.secondName) {
            return [obj1.firstName compare: obj2.firstName];
        }
        return [obj1.secondName compare: obj2.secondName];
    }];
    
    NSLog(@"Sorted list of students: ");
    for (Student *student in students)  {
        NSLog(@"%@ %@", student.firstName, student.secondName);
    }
    
    NSLog(@"-----------------------------");
    
    Patient *patient1 = [[Patient alloc] init];
    Patient *patient2 = [[Patient alloc] init];
    Patient *patient3 = [[Patient alloc] init];
    Patient *patient4 = [[Patient alloc] init];
    Patient *patient5 = [[Patient alloc] init];
    Patient *patient6 = [[Patient alloc] init];
    Patient *patient7 = [[Patient alloc] init];
    Patient *patient8 = [[Patient alloc] init];
    patient1.name = @"Jacob";
    patient2.name = @"Vadim";
    patient3.name = @"Maxim";
    patient4.name = @"Senya";
    patient5.name = @"Alex";
    patient6.name = @"Stepa";
    patient7.name = @"Ruslan";
    patient8.name = @"Nursultan";
    
    NSArray* patients = [[NSArray alloc] initWithObjects: patient1, patient2, patient3, patient4, patient5, patient6, patient7, patient8, nil];
    SEL selectorCallsPatientFeelsBad = @selector(patientFeelsBad:);
    
    for (Patient* patient in patients) {
        [patient performSelector:selectorCallsPatientFeelsBad withObject:^(int numberFromAcheList, double temperature){
            NSLog(@"-------NEXT ONE-------");
            numberFromAcheList >= 0 ? NSLog(@"* tipa lechim * Now you are ok, %@", patient.name) : NSLog(@"You have no ache!");
            patient.hasHighTemperature ? patient.takePill : NSLog(@"i have not high temperature, so i should learn Objective C");
        } afterDelay:arc4random_uniform(15)];
    }
    
    return YES;
}

- (void) methodWhatTakesBlock: (void(^)(int)) testBlock {
    testBlock(4);
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
