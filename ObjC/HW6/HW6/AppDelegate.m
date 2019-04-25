//
//  AppDelegate.m
//  HW6
//
//  Created by Nick on 24.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "AppDelegate.h"
#import "Human.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

    Human *student = [[Human alloc] init];
   
    student.name = @"Petya";
    student.age = 20;
    student.isClever = YES;
    student.mark = GradeA;
    student.toGo = PlacesCinema;
    
    NSLog(@"%@ is %d. He got %d and went to %d.", student.name, student.isClever, student.mark, student.toGo);
    
    // error ->    student.toGo = PlacesTown;
    
   
    CGPoint p1 = CGPointMake(0, 10);
    /* OR
     CGPoint p1;
    p1.x = 0;
    p1.y = 10; */
    
    CGRect field = CGRectMake(p1.x, p1.y, 10, 10);
    
    /* OR
     CGRect field;
    field.origin = p1;
    field.size.height = 10;
    field.size.width = 10; */
    
    CGRect square = CGRectMake(7, 4, 3, 3);
    
    /* OR
    CGRect square;
    square.origin.x = 7;
    square.origin.y = 4;
    square.size.height = 3;
    square.size.width = 3;   */
    
    int couter = 0;
    
    NSMutableArray *points = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++) {
        CGPoint point = CGPointMake(arc4random_uniform(10), arc4random_uniform(10));
        
        if (CGRectContainsPoint(square, point)) {
            NSLog(@"Point with coordinates %f %f intersects square in center of field", point.x, point.y);
            couter += 1;
        }
        [points addObject: [NSValue valueWithCGPoint: point]];
    }
    
    NSLog(@"%@", points);
    NSLog(@"counter represents %d", couter);
    
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
