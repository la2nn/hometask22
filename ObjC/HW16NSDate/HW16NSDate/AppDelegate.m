//
//  AppDelegate.m
//  HW16NSDate
//
//  Created by Nick on 15.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSDate *dayCounter;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSMutableArray *students = [[NSMutableArray alloc] init];
    NSArray *firstNames = [[NSArray alloc] initWithObjects: @"Egor", @"Petr", @"Denis", @"Maxim", @"Ivan", @"Nikita", @"Dima", @"Igor", @"Matvey", @"Vladimir", nil];
    NSArray *secondNames = [[NSArray alloc] initWithObjects: @"Egorov", @"Nikolaev", @"Fedorov", @"Tsum", @"Kruglov", @"Kvadratov", @"Yakubovich", @"Pushkin", @"Sidorov", @"Snow", nil];
    
    for (int i = 0; i < 30; i++) {
        Student *student = [[Student alloc] init];
        student.firstName = firstNames[arc4random_uniform(10)];
        student.secondName = secondNames[arc4random_uniform(10)];
        NSDateFormatter *year = [[NSDateFormatter alloc] init];
        [year setDateFormat: @"yyyy"];
        
        NSDate *someDate = [NSDate dateWithTimeInterval: arc4random_uniform(1072224000) sinceDate: [year dateFromString: @"1969"]];
        student.dateOfBirth = someDate;
        [students addObject: student];
    }
    
    
    NSLog(@"---- Отсортированный массив студентов (по возрасту) ----------");
    
    [students sortUsingComparator:^NSComparisonResult(Student* _Nonnull student1, Student* _Nonnull student2) {
        return [student2.dateOfBirth compare: student1.dateOfBirth];
    }];
    
    for (Student *student in students) {
        [formatter setDateFormat:@"dd MMMM YYYY"];
        NSLog(@"%@ %@ - %@", student.secondName, student.firstName, [formatter stringFromDate: student.dateOfBirth]);
    }
    
    NSLog(@"---- Разница в возрасте между старшим и младшим ---------");
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *differenceBetweenOldestAndYoungest = [calendar components: NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                                       fromDate: [students.lastObject dateOfBirth]
                                                                         toDate: [students[0] dateOfBirth] options:0];
    NSLog(@"%@", differenceBetweenOldestAndYoungest);
    
    NSLog(@"---- Дни, с которых начинается каждый месяц 2019 года --------");
    
    NSDateFormatter *beginningOfThisYearFormatter = [[NSDateFormatter alloc] init];
    [beginningOfThisYearFormatter setDateFormat: @"yyyy MMM dd"];
    NSDate *counterOfMouthsThisYear = [NSDate dateWithTimeInterval: 0 sinceDate:[beginningOfThisYearFormatter dateFromString: @"2019 Jan 01"]];
    
    NSDateComponents *componentsFromThisYear = [calendar components: NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitMonth | NSCalendarUnitDay fromDate: counterOfMouthsThisYear];
    for (int i = 0 ; i < 12; i++) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: @"EEEE - MMM"];
        
        counterOfMouthsThisYear = [calendar dateFromComponents: componentsFromThisYear];
        componentsFromThisYear.month += 1 ;
        
        NSLog(@"%@", [dateFormatter stringFromDate: counterOfMouthsThisYear]);
    }
    
    NSLog(@"---- Каждое воскресенье 2019 года --------");
    
    NSDate *counterOfDaysThisYear = [NSDate dateWithTimeInterval: 0 sinceDate:[beginningOfThisYearFormatter dateFromString: @"2019 Jan 01"]];
    componentsFromThisYear = [calendar components: NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitMonth | NSCalendarUnitDay fromDate: counterOfDaysThisYear];
    int counterOfSaturdays = 0;
    
    for (int i = 0 ; i < 365; i++) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: @"EEEE - dd - MMM"];
        NSDateFormatter *dateFormatterForDays = [[NSDateFormatter alloc] init];
        [dateFormatterForDays setDateFormat: @"EEEE"];
        
        counterOfDaysThisYear = [calendar dateFromComponents: componentsFromThisYear];
        NSString *currentDayString = [dateFormatterForDays stringFromDate: counterOfDaysThisYear];
       
        if ([currentDayString isEqualToString: @"Sunday"]) {
            NSLog(@"%@", [dateFormatter stringFromDate: counterOfDaysThisYear]);
            counterOfSaturdays++;
        }
        componentsFromThisYear.day += 1 ;
    }
    NSLog(@"Amount of Sundays in 2019 - %d", counterOfSaturdays);
    
    NSLog(@"---- Рабочие дни каждого месяца 2019 года --------");
    
    counterOfDaysThisYear = [NSDate dateWithTimeInterval: 0 sinceDate:[beginningOfThisYearFormatter dateFromString: @"2019 Jan 01"]];
    componentsFromThisYear = [calendar components: NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitMonth | NSCalendarUnitDay fromDate: counterOfDaysThisYear];
    int counterOfWeekdays = 0;
    
    for (int i = 0 ; i < 365; i++) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: @"EEEE - dd - MMM"];
        NSDateFormatter *dateFormatterForDays = [[NSDateFormatter alloc] init];
        [dateFormatterForDays setDateFormat: @"EEEE"];
        
        counterOfDaysThisYear = [calendar dateFromComponents: componentsFromThisYear];
        NSString *currentDayString = [dateFormatterForDays stringFromDate: counterOfDaysThisYear];
        
        if (![currentDayString isEqualToString: @"Sunday"] && ![currentDayString isEqualToString: @"Saturday"]) {
          //NSLog(@"%@", [dateFormatter stringFromDate: counterOfDaysThisYear]);
            counterOfWeekdays++;
        }
        componentsFromThisYear.day += 1 ;
    }
    NSLog(@"Amount of Weekdays in 2019 - %d", counterOfWeekdays);
    
    NSLog(@"------ Поздравления с днем рождения (таймер по дням каждые 0.5 сек) ----------");
    
    self.dayCounter = [NSDate date];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(dayCycling:) userInfo:students repeats:YES];
    
    return YES;
}


- (void) dayCycling:(NSTimer*) timer {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"dd MMM"];
    
    NSDateComponents *componentsFromCounter = [calendar components: NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate: self.dayCounter];
    componentsFromCounter.day += 1 ;
    
    self.dayCounter = [calendar dateFromComponents: componentsFromCounter];
    NSLog(@"%@", self.dayCounter);

    NSString *currentDayString = [dateFormatter stringFromDate: self.dayCounter];
    NSArray *students = [timer userInfo];
    
    for (Student *student in students) {
        NSString *studentBirthDayString = [dateFormatter stringFromDate: student.dateOfBirth];
        if ([currentDayString isEqualToString: studentBirthDayString]) {
            NSLog(@"HAPPY BDAY TO YOU, %@ %@ ", student.secondName, student.firstName);
        }
    }
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
