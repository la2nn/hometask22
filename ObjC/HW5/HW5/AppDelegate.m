//
//  AppDelegate.m
//  HW5
//
//  Created by Nick on 22.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "AppDelegate.h"
#import "Human.h"
#import "Animal.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Human *newHuman = [[Human alloc] init];
    Bicyclist *newBicyclist = [[Bicyclist alloc] init];
    Swimmer *newSwimmer = [[Swimmer alloc] init];
    Runner *newRunner = [[Runner alloc] init];
    Student *newStudent = [[Student alloc] init];
    
    newHuman.name = @"Oleg";
    newHuman.height = 166;
    newHuman.weight = 72;
    newHuman.gender = @"Male";
    
    newBicyclist.name = @"Olga";
    newBicyclist.height = 162;
    newBicyclist.weight = 52;
    newBicyclist.gender = @"Female";
    
    newSwimmer.name = @"Sveta";
    newSwimmer.height = 192;
    newSwimmer.weight = 133;
    newSwimmer.gender = @"Female";
    
    newRunner.name = @"Elena";
    newRunner.height = 188;
    newRunner.weight = 77;
    newRunner.gender = @"Female";
    
    newStudent.name = @"DIMAS";
    newStudent.height = 210;
    newStudent.weight = 37;
    newStudent.gender = @"Male";
    newStudent.mark = 5;
    newStudent.nickName = @"botan";
    
    Animal *newAnimal = [[Animal alloc] init];
    Cow *newCow = [[Cow alloc] init];
    Crocodile *newCrocodile = [[Crocodile alloc] init];
    
    newAnimal.sobriquet = @"Maybe piglet?";
    newAnimal.age = 3;
    
    newCow.sobriquet = @"Xiaomi";
    newCow.age = 9;
    
    newCrocodile.sobriquet = @"Croco";
    newCrocodile.age = 3;
    
    NSArray *creatures = [[NSArray alloc] initWithObjects: newHuman, newBicyclist, newSwimmer, newRunner, newStudent, newAnimal, newCow, newCrocodile, nil];
    NSMutableArray *humans = [[NSMutableArray alloc] init];
    NSMutableArray *animals = [[NSMutableArray alloc] init];
    
    for (NSObject *object in creatures) {
        if ([object isKindOfClass: [Human class]]) {
            Human* human = (Human*)object;
            [humans addObject: human];
        }
        if ([object isKindOfClass: [Animal class]]) {
            Animal* animal = (Animal*)object;
            [animals addObject: animal];
        }
    }
    
    NSArray *humansSorted = [humans sortedArrayUsingComparator:^NSComparisonResult(Human *obj1, Human *obj2){
        return [obj1.name compare:obj2.name];
    }];
    
    NSArray *animalsSorted = [animals sortedArrayUsingComparator:^NSComparisonResult(Animal *obj1, Animal *obj2){
        return [obj1.sobriquet compare:obj2.sobriquet];
    }];
    
    NSArray *sortedCreatures = [[NSArray alloc] initWithObjects: humansSorted, animalsSorted, nil];
    
    
    for (NSObject *object in sortedCreatures.reverseObjectEnumerator) {         //по заданию надо перевернуть массив
        NSLog(@"-----------------------");
        NSLog(@"%@", NSStringFromClass([object class]));
        
        if ([object isKindOfClass: [Animal class]]) {
            Animal* animal = (Animal*)object;
            
            NSLog(@"%@", animal.sobriquet);
            NSLog(@"%d", animal.age);
    
            [animal walk];
        }
        
        if ([object isKindOfClass: [Human class]]) {

            Human* human = (Human*)object;
            
            NSLog(@"%@", human.name);
            NSLog(@"%d", human.height);
            NSLog(@"%d", human.weight);
            NSLog(@"%@", human.gender);
            
            [human move];
            
            if ([object isKindOfClass: [Student class]]) {
                Student* student = (Student*)object;
                
                NSLog(@"mark %d", student.mark);
                NSLog(@"and student name is %@", student.nickName);
            }
            
        }
    }
    
   /* //NSArray *arr = [[NSArray alloc] initWithObjects: @"Str1", @"Str2", nil];
    // or
    //NSArray *arr = [NSArray arrayWithObjects: @"Str1", @"Str2", nil];
    // or
   NSArray *arr = @[@"a", @"b", @"c"];
    for (int i = 0; i < [arr count]; i++) {
        NSLog(@"%@", [arr objectAtIndex: i]);
        NSLog(@"i = %d", i);
    }
    for (NSString *string in arr) {
        NSLog(@"%@", string);
        NSLog(@"index = %d", [arr indexOfObject: string]);
    } */
    
    // Override point for customization after application launch.
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
