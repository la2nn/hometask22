//
//  Jumper.h
//  HW7
//
//  Created by Nick on 25.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Human.h"
#import "Jumpers.h"

NS_ASSUME_NONNULL_BEGIN

@interface Jumper : Human <Jumpers>
-(void) highJump;
-(void) jump;

@end

NS_ASSUME_NONNULL_END
