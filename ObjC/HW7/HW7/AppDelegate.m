//
//  AppDelegate.m
//  HW7
//
//  Created by Nick on 25.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "AppDelegate.h"
#import "Human.h"
#import "Jumper.h"
#import "Swimmer.h"
#import "Runner.h"
#import "Animal.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    Human *human = [[Human alloc] init];
    Jumper *jumper1 = [[Jumper alloc] init];
    Jumper *jumper2 = [[Jumper alloc] init];
    Swimmer *swimmer1 = [[Swimmer alloc] init];
    Swimmer *swimmer2 = [[Swimmer alloc] init];
    Runner *runner1 = [[Runner alloc] init];
    Runner *runner2 = [[Runner alloc] init];
    Kangaroo *kang = [[Kangaroo alloc] init];
    Fish *fish = [[Fish alloc] init];
    Ostrich *ostrich = [[Ostrich alloc] init];
    
    NSArray *creatures = [[NSArray alloc] initWithObjects: human, jumper1, jumper2, swimmer1, swimmer2, runner1, runner2, kang, fish, ostrich, nil];
    
    for (id object in creatures) {
        bool mayDoSth = NO;
        NSLog(@"------------------------------");
        NSLog(@"Im %@", NSStringFromClass([object class]));
        
        if ([object respondsToSelector:@selector(run)]) {
            NSLog(@"and i can RUN");
            [object run];
            mayDoSth = YES;
        }
        if ([object respondsToSelector:@selector(speedUp)]) {
            NSLog(@"and i can speed up");
            [object speedUp];
            mayDoSth = YES;
        }
        
        if ([object respondsToSelector:@selector(swim)]) {
            NSLog(@"and i can SWIM");
            [object swim];
            mayDoSth = YES;
        }
        
        if ([object respondsToSelector:@selector(dive)]) {
            NSLog(@"and i can dive deeeeeeper");
            [object dive];
            mayDoSth = YES;
        }
        
        if ([object respondsToSelector:@selector(jump)]) {
            NSLog(@"and i can jump");
            [object jump];
            mayDoSth = YES;
        }
        
        if ([object respondsToSelector:@selector(highJump)]) {
            NSLog(@"and i can do high JUMP");
            [object highJump];
            mayDoSth = YES;
        }
        
        if (mayDoSth == NO) {
            NSLog(@"ya prosto kusok myasa");
        }
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
