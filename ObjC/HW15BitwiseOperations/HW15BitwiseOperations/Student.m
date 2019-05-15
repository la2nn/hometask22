//
//  Student.m
//  HW15BitwiseOperations
//
//  Created by Nick on 15.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString*) answerByType: (StudentSubjectType) type  {
    return self.subjectType & type ? @"Y" : @"N";
}

- (NSString*) description {
    return [NSString stringWithFormat: @"Student studies: "
                                        "biology = %@ "
                                        "math = %@ "
                                        "development = %@ "
                                        "engineering = %@ "
                                        "art = %@ "
                                        "psychology = %@ "
                                        "anatomy = %@",
                                        [self answerByType: StudentSubjectTypeBiology],
                                        [self answerByType: StudentSubjectTypeMath],
                                        [self answerByType: StudentSubjectTypeDevelopment],
                                        [self answerByType: StudentSubjectTypeEngineering],
                                        [self answerByType: StudentSubjectTypeArt],
                                        [self answerByType: StudentSubjectTypePsychology],
                                        [self answerByType: StudentSubjectTypeAnatomy]];
}

@end
