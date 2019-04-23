//
//  Human.h
//  HW5
//
//  Created by Nick on 23.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Human : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) int height;
@property (assign, nonatomic) int weight;
@property (strong, nonatomic) NSString *gender;

- (void) move;

@end

@interface Bicyclist: Human

- (void) move;

@end

@interface Runner: Human

- (void) move;

@end

@interface Swimmer: Human

- (void) move;

@end

@interface Student: Human
- (void) move;

@property (assign, nonatomic) int mark;
@property (strong, nonatomic) NSString *nickName;

@end


NS_ASSUME_NONNULL_END
