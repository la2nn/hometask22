//
//  Human.m
//  HW5
//
//  Created by Nick on 23.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Human.h"

@implementation Human

- (void) move {
    NSLog(@"MOVE HERE");
}

@end

@implementation Bicyclist: Human

- (void) move {
    NSLog(@"КРУТИ ПЕДАЛИ");
}

@end

@implementation Runner: Human

- (void) move {
    NSLog(@"RUN HERE");
}

@end

@implementation Swimmer: Human

- (void) move {
    NSLog(@"SWIM HERE LOOL");
}

@end

@implementation Student: Human
- (void) move {
    super.move;
    NSLog(@"YA STUDENT IDU ZA KEFIROM");
}
@end
