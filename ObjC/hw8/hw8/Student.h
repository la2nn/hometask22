//
//  Student.h
//  hw8
//
//  Created by Nick on 29.04.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (assign, nonatomic) NSString *firstName;
@property (assign, nonatomic) NSString *lastName;

-(void) greeting;

@end

NS_ASSUME_NONNULL_END
