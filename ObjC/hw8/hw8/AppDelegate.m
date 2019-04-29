//
//  AppDelegate.m
//  hw8
//
//  Created by Nick on 29.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
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
    student1.firstName = @"Egor";
    student2.firstName = @"Denis";
    student3.firstName = @"Danil";
    student4.firstName = @"Ivan";
    student5.firstName = @"Stas";
    student6.firstName = @"Alex";
    student7.firstName = @"Kirill";
    student8.firstName = @"Mitrofanushka";
    student9.firstName = @"Lipton";
    student10.firstName = @"IceTea";
    student1.lastName = @"Egorov";
    student2.lastName = @"Denisov";
    student3.lastName = @"Danilov";
    student4.lastName = @"Ivanov";
    student5.lastName = @"Pyeha";
    student6.lastName = @"Skuterenko";
    student7.lastName = @"Fedorov";
    student8.lastName = @"Mitrofanov";
    student9.lastName = @"Nesteaov";
    student10.lastName = @"Chaev";
    
    NSDictionary *listOfStudents = @{[NSString stringWithFormat: @"%@ %@", student1.firstName, student1.lastName] : student1,
                                     [NSString stringWithFormat: @"%@ %@", student2.firstName, student2.lastName] : student2,
                                     [NSString stringWithFormat: @"%@ %@", student3.firstName, student3.lastName] : student3,
                                     [NSString stringWithFormat: @"%@ %@", student4.firstName, student4.lastName] : student4,
                                     [NSString stringWithFormat: @"%@ %@", student5.firstName, student5.lastName] : student5,
                                     [NSString stringWithFormat: @"%@ %@", student6.firstName, student6.lastName] : student6,
                                     [NSString stringWithFormat: @"%@ %@", student7.firstName, student7.lastName] : student7,
                                     [NSString stringWithFormat: @"%@ %@", student8.firstName, student8.lastName] : student8,
                                     [NSString stringWithFormat: @"%@ %@", student9.firstName, student9.lastName] : student9,
                                     [NSString stringWithFormat: @"%@ %@", student10.firstName, student10.lastName] : student10};
    
    NSLog(@"%@", listOfStudents.allKeys);
    NSLog(@"%@", listOfStudents);
    
    for (NSString *key in listOfStudents.allKeys) {
        NSLog(@"%@", key);
        [listOfStudents[key] greeting];
    }
    
    NSArray *keysForListOfStudents = [listOfStudents allKeys];
    NSArray *sortedKeysForListOfStudents = [keysForListOfStudents sortedArrayUsingSelector:@selector(compare:)];
    for (NSString *key in sortedKeysForListOfStudents) {
        NSLog(@"%@", key);
    }
    
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
