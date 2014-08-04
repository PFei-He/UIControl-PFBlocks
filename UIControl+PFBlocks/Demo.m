//
//  Demo.m
//  UIControl+PFBlocks
//
//  Created by PFei_He on 14-8-4.
//  Copyright (c) 2014年 PFei_He. All rights reserved.
//

#import "Demo.h"
#import "UIControl+PFBlocks.h"

@interface Demo ()

@end

@implementation Demo

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(110, 100, 100, 30);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button handleControlEvents:UIControlEventTouchUpInside withBlock:^{
        NSLog(@"ABC");
    }];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
