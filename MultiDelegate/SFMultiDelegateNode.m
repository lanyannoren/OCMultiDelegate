//
//  SFMultiDelegateNode.m
//  OCMultiDelegate
//
//  Created by lanyannoren on 2020/3/27.
//  Copyright © 2020 ace. All rights reserved.
//

#import "SFMultiDelegateNode.h"

@implementation SFMultiDelegateNode

+ (instancetype)nodeWithDelegate:(id)delegate queue:(dispatch_queue_t)queue {
    SFMultiDelegateNode *node = [SFMultiDelegateNode new];
    node.delegate = delegate;
    node.delQueue = queue;
    return node;
}

@end
