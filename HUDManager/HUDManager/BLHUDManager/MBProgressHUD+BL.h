//
//  MBProgressHUD+BL.h
//  test
//
//  Created by boundlessocean on 2017/11/20.
//  Copyright © 2017年 Ocean. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>
// 使用注意:
// 1.正常情况下你不需要调用包含 InView 的方法，除非你需要在指定的view上显示HUD
// 2.进度条 进度在 >= 1时会自动消失
// 3.如果你需要修改进度条颜色 参考.m中_indicator.lineColor 、_indicator.progressColor 、_indicator.progressRemainingColor
// 4.如果你需要修改文字颜色 请在.m中修改 contentColor
// 5.如果你需要修改HUD背景颜色 请在.m中修改 bezelView
// 6.如果你需要文字或图形 边距大小 请在.m中修改 margin
// ***** 7.调用一下两条API如果未显示成功失败图片 -> 项目 ->Build Phases->Copy Bundle Resoure-> +
// ***** + (MBProgressHUD *)showHUDWithSuccessMessage:(NSString *)message;
// ***** + (MBProgressHUD *)showHUDWithFailMessage:(NSString *)message;


@interface MBProgressHUD (BL)

#pragma mark - - 隐藏HUD
+ (void)hideHUDAnimated:(BOOL)animated;

#pragma mark - - 只显示菊花的情况， 需要手动调用hideHUD方法
+ (void)showHUDLoad;

#pragma mark - - 显示菊花和文字， 需要手动调用hideHUD方法
+ (void)showHUDWithLoadMessage:(NSString *)message;

#pragma mark - - 显示文字和状态(成功失败)，2秒后自动消失
// 成功 ，2秒后自动消失
+ (MBProgressHUD *)showHUDWithSuccessMessage:(NSString *)message;
// 失败 ，2秒后自动消失
+ (MBProgressHUD *)showHUDWithFailMessage:(NSString *)message;

#pragma mark - - 只显示文字，除了afterDelay，其他需要手动调用hideHUD方法
+ (MBProgressHUD *)showHUDWithMessage:(NSString *)message;
+ (MBProgressHUD *)showHUDWithMessage:(NSString *)message afterDelay:(NSTimeInterval)timeInterval;
// 文字显示在界面的底部
+ (MBProgressHUD *)showHUDAtBottomWithMessage:(NSString *)message afterDelay:(NSTimeInterval)timeInterval;

#pragma mark - - 显示进度条，进度大于=1消失
+ (void)showHUDWithProgressValue:(CGFloat)progress;


#pragma mark - - inView 指定view显示HUD
+ (void)showHUDLoadInView:(UIView *)view;
+ (void)showHUDWithLoadMessage:(NSString *)message inView:(UIView *)view;
+ (MBProgressHUD *)showHUDWithMessage:(NSString *)message inView:(UIView *)view;
+ (MBProgressHUD *)showHUDWithMessage:(NSString *)Message inView:(UIView *)view afterDelay:(NSTimeInterval)timeInterval;
+ (MBProgressHUD *)showHUDWithMessage:(NSString *)message inView:(UIView *)view status:(BOOL)isSuccess;
+ (void)showHUDWithProgressValue:(CGFloat)progress inView:(UIView *)view;

@end
