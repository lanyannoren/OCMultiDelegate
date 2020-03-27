//
//  ViewController.m
//  OCMultiDelegate
//
//  Created by lanyannoren on 2020/3/27.
//  Copyright © 2020 ace. All rights reserved.
//

#import "ViewController.h"

#import "SFPerformer.h"
#import "SFMultiDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) SFMultiDelegate <SFPerformerDelegate>*delegate;
@property (nonatomic, strong) SFPerformer *pone;
@property (nonatomic, strong) SFPerformer *ptwo;
@property (nonatomic, strong) SFPerformer *pthree;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pone = [SFPerformer performerWithLevel:1];
    self.ptwo = [SFPerformer performerWithLevel:2];
    self.pthree = [SFPerformer performerWithLevel:123];
    
    self.delegate = (SFMultiDelegate <SFPerformerDelegate>*)[SFMultiDelegate new];
    [self.delegate addDelegate:self.pone];
    [self.delegate addDelegate:self.ptwo];
    [self.delegate addDelegate:self.pthree];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.delegate logLevel];
}


@end
