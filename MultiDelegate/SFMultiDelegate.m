//
//  SFMultiDelegate.m
//  OCMultiDelegate
//
//  Created by lanyannoren on 2020/3/27.
//  Copyright © 2020 ace. All rights reserved.
//

#import "SFMultiDelegate.h"

#import "SFMultiDelegateNode.h"

@interface SFMultiDelegate ()
{
    NSMutableArray *_delegates;
    NSLock *_objLock;
}
@end

@implementation SFMultiDelegate

- (instancetype)init {
    if (self = [super init]) {
        _delegates = [NSMutableArray arrayWithCapacity:1];
        _objLock = [NSLock new];
    }
    return self;
}

- (void)addDelegate:(id)delegate {
    [self addDelegate:delegate queue:dispatch_get_main_queue()];
}

- (void)addDelegate:(id)delegate queue:(dispatch_queue_t)queue {
    if (nil == delegate) return;
    if (NULL == queue) return;
    
    NSString *label = [NSString stringWithCString:dispatch_queue_get_label(queue) encoding:NSUTF8StringEncoding];
    if (nil == label || 0 == label.length) {
        NSAssert(NO, @"label of queue can not be null");
        return;
    }
    
    [_objLock lock];
    
    BOOL add = YES;
    for (SFMultiDelegateNode *node in _delegates) {
        if (node.delegate == delegate) {
            add = NO; // 已存在,不添加
            break;
        }
    }
    if (add) {
        [_delegates addObject:[SFMultiDelegateNode nodeWithDelegate:delegate queue:queue]];
    }
    
    [_objLock unlock];
}

- (void)removeDelegate:(id)delegate {
    if (nil == delegate) return;
    
    [_objLock lock];
    
    for (int i = 0; i < _delegates.count; i++) {
        SFMultiDelegateNode *node = _delegates[i];
        if (node.delegate == delegate) {
            [_delegates removeObjectAtIndex:i];
            break;
        }
    }
    
    [_objLock unlock];
}

- (void)removeAllDelegates {
    [_objLock lock];
    [_delegates removeAllObjects];
    [_objLock unlock];
}

- (void)dealloc {
    [_delegates removeAllObjects];
    _delegates = nil;
    _objLock = nil;
}


/********************************************************************************/
#pragma mark - 想法转发相关

- (void)doNothing {}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    // 防止 NSInvalidArgumentException
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = nil;
    [_objLock lock];
    for (SFMultiDelegateNode *node in _delegates) {
        signature = [node.delegate methodSignatureForSelector:aSelector];
        if (signature) {
            break;
        }
    }
    if (nil == signature) {
        signature = [[self class] instanceMethodSignatureForSelector:@selector(doNothing)];
    }
    [_objLock unlock];
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [_objLock  lock];
    for (SFMultiDelegateNode *node in _delegates) {
        if (![node.delegate respondsToSelector:anInvocation.selector]) {
            continue;
        }
        
        if (0 == strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(node.delQueue))) {
            [_objLock unlock];
            @synchronized (node) {
                [anInvocation invokeWithTarget:node.delegate];
            }
            [_objLock lock];
        } else {
            dispatch_async(node.delQueue, ^{
                @synchronized (node) {
                    [anInvocation invokeWithTarget:node.delegate];
                }
            });
        }
    }
    [_objLock unlock];
}



@end
