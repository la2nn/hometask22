//
//  Swimmer.h
//  HW7
//
//  Created by Nick on 25.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Human.h"
#import "Swimmers.h"

NS_ASSUME_NONNULL_BEGIN

@interface Swimmer : Human <Swimmers>

-(void) dive;
-(void) swim;

@end

NS_ASSUME_NONNULL_END
