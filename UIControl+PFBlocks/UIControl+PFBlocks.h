//
//  UIControl+PFBlocks.h
//  UIControl+PFBlocks
//
//  Created by PFei_He on 14-8-4.
//  Copyright (c) 2014年 PFei_He. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (PFBlocks)

- (void)handleControlEvents:(UIControlEvents)controlEvents withBlock:(void (^)())block;

- (void)removeControlEvents:(UIControlEvents)controlEvents;

@end
