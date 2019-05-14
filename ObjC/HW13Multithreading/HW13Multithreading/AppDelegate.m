//
//  AppDelegate.m
//  HW13Multithreading
//
//  Created by Nick on 06.05.2019.
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
    
    student1.name = @"Vanya";
    student2.name = @"Petya";
    student3.name = @"Egor";
    student4.name = @"Sanya";
    student5.name = @"Dima";
    
    int maxNumber = 1000;
    int secretNumber = 15;
    double startTime = CACurrentMediaTime();
    
    [student1 guessNumber: maxNumber secretNumber: secretNumber startTime: startTime];
    [student2 guessNumber: maxNumber secretNumber: secretNumber startTime: startTime];
    [student3 guessNumber: maxNumber secretNumber: secretNumber startTime: startTime];
    [student4 guessNumber: maxNumber secretNumber: secretNumber startTime: startTime];
    [student5 guessNumber: maxNumber secretNumber: secretNumber startTime: startTime];
    
   /* dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(dispatch_get_main_queue(), ^{
        student1.resultBlock();
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        student2.resultBlock();
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        student3.resultBlock();
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        student4.resultBlock();
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        student5.resultBlock();
    }); */
    
   /* dispatch_async(queue, ^{
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        [student1 guessNumber:maxNumber secretNumber:secretNumber];
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        [student2 guessNumber:maxNumber secretNumber:secretNumber];
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        [student3 guessNumber:maxNumber secretNumber:secretNumber];
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        [student4 guessNumber:maxNumber secretNumber:secretNumber];
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        [student5 guessNumber:maxNumber secretNumber:secretNumber];
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    }); */
    
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
