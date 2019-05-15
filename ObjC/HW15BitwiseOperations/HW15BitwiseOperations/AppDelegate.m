//
//  AppDelegate.m
//  HW15BitwiseOperations
//
//  Created by Nick on 15.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSMutableArray *students = [[NSMutableArray alloc] init];
    NSMutableArray *humanitarianStudents = [[NSMutableArray alloc] init];
    NSMutableArray *technicalStudents = [[NSMutableArray alloc] init];
    int countOfDevelopmentStudies = 0;
    
    for (int i = 0; i < 10; i++) {
        Student *student = [[Student alloc] init];
        student.subjectType = 1 << arc4random_uniform(2)     |
                              1 << 1 + arc4random_uniform(2) |
                              1 << 2 + arc4random_uniform(2) |
                              1 << 3 + arc4random_uniform(2) |
                              1 << 4 + arc4random_uniform(2) |
                              1 << 5 + arc4random_uniform(2) |
                              1 << 6 + arc4random_uniform(2) ;
        [students addObject: student];
    }
    
    NSLog(@"%@", students);
    
    for (Student *student in students) {
        int countOfTechnicalSubjects = 0;
        int countOfHumanitarianSubjects = 0;
        
        // По заданию отменяю биологию у студентов, выбравших ее
        if (student.subjectType & StudentSubjectTypeBiology) {
            NSLog(@"Biology was cancelled");
            student.subjectType = ~StudentSubjectTypeBiology;
        }
        
        //student.subjectType & StudentSubjectTypeBiology ? countOfHumanitarianSubjects++ : NULL;
        student.subjectType & StudentSubjectTypeMath ? countOfTechnicalSubjects++ : NULL;
        student.subjectType & StudentSubjectTypeDevelopment ? countOfTechnicalSubjects++ : NULL;
        student.subjectType & StudentSubjectTypeDevelopment ? countOfDevelopmentStudies++ : NULL;
        student.subjectType & StudentSubjectTypeEngineering ? countOfTechnicalSubjects++ : NULL;
        student.subjectType & StudentSubjectTypeArt ? countOfHumanitarianSubjects++ : NULL;
        student.subjectType & StudentSubjectTypePsychology ? countOfHumanitarianSubjects++ : NULL;
        student.subjectType & StudentSubjectTypeAnatomy ? countOfHumanitarianSubjects++ : NULL;
        
        NSLog(@"This student studies %d technicalSubject", countOfTechnicalSubjects);
        NSLog(@"This student studies %d humanitarianSubject", countOfHumanitarianSubjects);
        NSLog(@"     -----------------     ");
        
        countOfTechnicalSubjects > countOfHumanitarianSubjects ? [technicalStudents addObject: student] : [humanitarianStudents addObject: student];
    }
    
    NSLog(@"%@", humanitarianStudents);
    NSLog(@"%@", technicalStudents);
    NSLog(@"Development is studied by %d students", countOfDevelopmentStudies);
    NSLog(@"     -----------------     ");
    
    // -----------------
    
    int randomNumber = arc4random_uniform(INT_MAX);
    NSMutableString *result = [[NSMutableString alloc] init];
    
    NSLog(@"%d", randomNumber);
    
    while (YES) {
        randomNumber % 2 == 1 ? [result insertString:@"1" atIndex:0] : [result insertString:@"0" atIndex:0];
        randomNumber = randomNumber / 2;
        if (randomNumber == 1) {
            [result insertString:@"1" atIndex:0];
            break;
        }
    }
    
    NSLog(@"%@", result);
    
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
