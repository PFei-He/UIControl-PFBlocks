//
//  UIControl+PFBlocks.m
//  UIControl+PFBlocks
//
//  Created by PFei_He on 14-8-4.
//  Copyright (c) 2014年 PFei_He. All rights reserved.
//

#import "UIControl+PFBlocks.h"
#import <objc/runtime.h>

typedef void (^PFBlock)();

@interface PFTarget : NSObject

@property (nonatomic, copy) PFBlock block;
@property (nonatomic, assign) UIControlEvents controlEvents;

- (void)action;

@end

@implementation PFTarget

- (void)action
{
    if (self.block) self.block();
}

@end

@implementation UIControl (PFBlocks)

static NSString *const PFBlocksArray = @"PFBlocksArray";

- (NSMutableArray *)blocksArray
{
    NSMutableArray *blocksArray = objc_getAssociatedObject(self, &PFBlocksArray);
    if (!blocksArray) {
        blocksArray = [NSMutableArray array];
        objc_setAssociatedObject(self, &PFBlocksArray, blocksArray, OBJC_ASSOCIATION_RETAIN);
    }
    return blocksArray;
}

- (void)handleControlEvents:(UIControlEvents)controlEvents withBlock:(void (^)())block
{
    NSMutableArray *blocksArray = self.blocksArray;

    PFTarget *addTarget = [[PFTarget alloc] init];
    addTarget.block = block;
    addTarget.controlEvents = controlEvents;
    [blocksArray addObject:addTarget];

    [self addTarget:addTarget action:@selector(action) forControlEvents:controlEvents];
}

- (void)removeControlEvents:(UIControlEvents)controlEvents
{
    NSMutableArray *blocksArray = self.blocksArray;
    NSMutableArray *removeTargetArray = [NSMutableArray arrayWithCapacity:[blocksArray count]];

    [blocksArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        PFTarget *removeTarget = obj;
        if (removeTarget.controlEvents == controlEvents) {
            [removeTargetArray addObject:removeTarget];
            [self removeTarget:removeTarget action:@selector(action) forControlEvents:controlEvents];
        }
    }];

    [blocksArray removeObjectsInArray:removeTargetArray];
}

@end
