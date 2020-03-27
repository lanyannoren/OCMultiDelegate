//
//  SFMultiDelegate.h
//  OCMultiDelegate
//
//  Created by lanyannoren on 2020/3/27.
//  Copyright © 2020 ace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFMultiDelegate : NSObject

- (void)addDelegate:(id)delegate;
/**
 * @param queue 代理方法在这个队列执行,如果传入nil,则默认main_queue.
 */
- (void)addDelegate:(id)delegate queue:(dispatch_queue_t)queue;

- (void)removeDelegate:(id)delegate;
- (void)removeAllDelegates;

@end

NS_ASSUME_NONNULL_END
