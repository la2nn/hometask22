//
//  AppDelegate.m
//  HW10Notifications
//
//  Created by Nick on 02.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Doctor.h"
#import "Businessman.h"
#import "Pensioner.h"

@interface AppDelegate ()

@property (strong, nonatomic) Government *government;
@property (strong, nonatomic) Pensioner *pensioner;
@property (strong, nonatomic) Doctor *doc;
@property (strong, nonatomic) Businessman *businessman;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.government = [[Government alloc] init];
    //[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(governmentNotification:) name: GovernmentTaxLevelDidChangeNotification object: nil];
    //[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(governmentNotification:) name: GovernmentAveragePriceDidChangeNotification object: nil];
    //[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(governmentNotification:) name: GovernmentPensionDidChangeNotification object: nil];

    self.doc = [[Doctor alloc] init];
    self.businessman = [[Businessman alloc] init];
    self.pensioner = [[Pensioner alloc] init];
    
    self.doc.salary = self.government.salary ;
    self.businessman.taxLevel = self.government.taxLevel;
    self.pensioner.pension = self.government.pension;
    self.doc.averagePrice = self.businessman.averagePrice = self.pensioner.averagePrice = self.government.averagePrice;
    
    self.government.taxLevel = 22;
    self.government.salary = 900;
    self.government.pension = 1500;
    self.government.averagePrice = 35;
    
    return YES;
}

- (void) governmentNotification: (NSNotification*) notification {
   NSLog(@"governmentNotification userInfo = %@", notification.userInfo);
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
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
