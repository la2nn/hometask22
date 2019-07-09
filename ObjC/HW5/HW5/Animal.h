//
//  Animal.h
//  HW5
//
//  Created by Nick on 23.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject
@property (strong, nonatomic) NSString *sobriquet;
@property (assign, nonatomic) int age;

-(void) walk;

@end

@interface Cow: Animal

-(void) walk;

@end

@interface Crocodile: Animal

-(void) walk;

@end

NS_ASSUME_NONNULL_END
