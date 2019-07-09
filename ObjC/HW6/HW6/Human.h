//
//  Human.h
//  HW6
//
//  Created by Nick on 24.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    PlacesCinema,
    PlacesTheatre,
    PlacesPark,
    PlacesUniversity
} Places;

typedef enum {
    GradeA,
    GradeB,
    GradeC,
    GradeD,
    GradeF
} Grade;

@interface Human : NSObject

@property (strong, atomic) NSString *name;
@property (assign, atomic) int age;
@property (assign, atomic) BOOL isClever;
@property (assign, atomic) Places toGo;
@property (assign, atomic) Grade mark;

@end

NS_ASSUME_NONNULL_END
