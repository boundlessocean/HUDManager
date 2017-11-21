//
//  ViewController.m
//  HUDManager
//
//  Created by boundlessocean on 2017/11/21.
//  Copyright © 2017年 Ocean. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+BL.h"

@interface ViewController ()<UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:{
            [MBProgressHUD showHUDLoadInView:self.view];
            break;
        }
        case 1:
            [MBProgressHUD showHUDWithLoadMessage:@"加载中..." inView:self.view];
            break;
        case 2:
            [MBProgressHUD showHUDWithSuccessMessage:@"登录成功"];
            break;
        case 3:
            [MBProgressHUD showHUDWithFailMessage:@"很遗憾,加载失败了"];
            break;
        case 4:
            [MBProgressHUD showHUDWithMessage:@"你在等什么？" inView:self.view];
            break;
        case 5:
            [MBProgressHUD showHUDAtBottomWithMessage:@"哎呀，发生错误了！" afterDelay:2];
            break;
        case 6:
            [MBProgressHUD showHUDWithMessage:@"主人，我好像遇到问题了！" afterDelay:2];
            break;
        case 7:{
            __block CGFloat progress = 0.5;
            [MBProgressHUD showHUDWithProgressValue:progress inView:self.view];
            break;
        }
        default:
            break;
    }
}
- (IBAction)hidHUD:(id)sender {
    [MBProgressHUD hideHUDAnimated:YES];
}

@end
