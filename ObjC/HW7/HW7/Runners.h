//
//  Runners.h
//  HW7
//
//  Created by Nick on 25.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#ifndef Runners_h
#define Runners_h

@protocol Runners <NSObject>

@optional
@property (assign, nonatomic) int distance;
@property (assign, nonatomic) int maxSpeed;
@property (assign, nonatomic) int currentSpeed;
-(void) speedUp;

@required
-(void) run;



@end


#endif /* Runners_h */
