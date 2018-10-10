//
//  APPViewController.m
//  BLHUDManager
//
//  Created by fuhaiyang on 10/10/2018.
//  Copyright (c) 2018 fuhaiyang. All rights reserved.
//

#import "APPViewController.h"
#import "MBProgressHUD+BL.h"
@interface APPViewController ()

@end

@implementation APPViewController

- (void)viewDidLoad
{
    
    [MBProgressHUD showMsg:@"不错哟"];
    [MBProgressHUD showBottomMsg:@"哎呦，不错哟" delay:2];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
