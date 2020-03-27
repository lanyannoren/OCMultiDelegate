//
//  SFMultiDelegateNode.h
//  OCMultiDelegate
//
//  Created by lanyannoren on 2020/3/27.
//  Copyright © 2020 ace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFMultiDelegateNode : NSObject

// weak reference
@property (nonatomic, weak) id delegate;
@property (nonatomic, assign) dispatch_queue_t delQueue;

+ (instancetype)nodeWithDelegate:(id)delegate queue:(dispatch_queue_t)queue;

@end

NS_ASSUME_NONNULL_END
