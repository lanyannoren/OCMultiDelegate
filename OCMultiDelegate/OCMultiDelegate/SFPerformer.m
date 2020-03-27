//
//  SFPerformer.m
//  OCMultiDelegate
//
//  Created by lanyannoren on 2020/3/27.
//  Copyright © 2020 ace. All rights reserved.
//

#import "SFPerformer.h"


@interface SFPerformer ()
@property (nonatomic, assign) NSInteger level;

@end

@implementation SFPerformer

+ (instancetype)performerWithLevel:(NSInteger)level {
    SFPerformer *performer = [SFPerformer new];
    performer.level = level;
    return performer;
}


- (void)logLevel {
    NSLog(@"%p level is %zd", self, self.level);
}

@end
