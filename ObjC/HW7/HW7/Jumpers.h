//
//  Jumpers.h
//  HW7
//
//  Created by Nick on 25.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#ifndef Jumpers_h
#define Jumpers_h

@protocol Jumpers <NSObject>

@optional
@property (assign, nonatomic) int maxJumpHeight;
@property (assign, nonatomic) int maxJumpWidth;
-(void) highJump;

@required
-(void) jump;

@end


#endif /* Jumpers_h */
