//
//  SFPerformer.h
//  OCMultiDelegate
//
//  Created by lanyannoren on 2020/3/27.
//  Copyright © 2020 ace. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SFPerformerDelegate;
NS_ASSUME_NONNULL_BEGIN

@interface SFPerformer : NSObject <SFPerformerDelegate>

+ (instancetype)performerWithLevel:(NSInteger)level;

@end


@protocol SFPerformerDelegate <NSObject>

- (void)logLevel;

@end

NS_ASSUME_NONNULL_END
