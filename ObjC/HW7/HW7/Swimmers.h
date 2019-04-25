//
//  Swimmers.h
//  HW7
//
//  Created by Nick on 25.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#ifndef Swimmers_h
#define Swimmers_h

@protocol Swimmers <NSObject>

@optional
@property (assign, nonatomic) int distance;
@property (assign, nonatomic) int maxSpeed;
@property (assign, nonatomic) int currentSpeed;
-(void) dive;

@required
-(void) swim;


@end

#endif /* Swimmers_h */
