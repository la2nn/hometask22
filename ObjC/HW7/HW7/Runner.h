//
//  Runner.h
//  HW7
//
//  Created by Nick on 25.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Human.h"
#import "Runners.h"
NS_ASSUME_NONNULL_BEGIN

@interface Runner : Human <Runners>

-(void) run;
-(void) speedUp;

@end

NS_ASSUME_NONNULL_END
