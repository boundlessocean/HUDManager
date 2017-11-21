//
//  MBProgressHUD+BL.m
//  test
//
//  Created by boundlessocean on 2017/11/20.
//  Copyright © 2017年 Ocean. All rights reserved.
//

#import "MBProgressHUD+BL.h"
#import <objc/runtime.h>
@implementation MBProgressHUD (BL)

static char containerViewKey;

// 只显示菊花的情况
+ (void)showHUDLoad{
    UIView *containerView = [UIApplication sharedApplication].keyWindow;
    [self showHUDLoadInView:containerView];
}

+ (void)showHUDLoadInView:(UIView *)view{
    objc_setAssociatedObject(self, &containerViewKey, view, OBJC_ASSOCIATION_RETAIN);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.margin = 15;
}

// 显示菊花和文字
+ (void)showHUDWithLoadMessage:(NSString *)message{
    UIView *containerView = [UIApplication sharedApplication].keyWindow;
    [self showHUDWithLoadMessage:message inView:containerView];
}

+ (void)showHUDWithLoadMessage:(NSString *)message inView:(UIView *)view{
    objc_setAssociatedObject(self, &containerViewKey, view, OBJC_ASSOCIATION_RETAIN);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    hud.margin = 15;
}

// 只显示文字
+ (MBProgressHUD *)showHUDWithMessage:(NSString *)message afterDelay:(NSTimeInterval)timeInterval{
    UIView *containerView = [UIApplication sharedApplication].keyWindow;
    return [self showHUDWithMessage:message inView:containerView afterDelay:timeInterval];
}

+ (MBProgressHUD *)showHUDAtBottomWithMessage:(NSString *)message afterDelay:(NSTimeInterval)timeInterval{
    UIView *containerView = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDWithMessage:message inView:containerView afterDelay:timeInterval];
    hud.offset = CGPointMake(0.f, [UIScreen mainScreen].bounds.size.height/2 - 100);
    return hud;
}

+ (MBProgressHUD *)showHUDWithMessage:(NSString *)message inView:(UIView *)view afterDelay:(NSTimeInterval)timeInterval{
    MBProgressHUD *hud = [self showHUDWithMessage:message inView:view];
    [hud hideAnimated:YES afterDelay:timeInterval];
    return hud;
}

+ (MBProgressHUD *)showHUDWithMessage:(NSString *)message{
    UIView *containerView = [UIApplication sharedApplication].keyWindow;
    return [self showHUDWithMessage:message inView:containerView];
}

+ (MBProgressHUD *)showHUDWithMessage:(NSString *)message inView:(UIView *)view{
    objc_setAssociatedObject(self, &containerViewKey, view, OBJC_ASSOCIATION_RETAIN);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    hud.animationType = MBProgressHUDAnimationZoomOut;
    hud.margin = 10;
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

// 显示文字和状态
+ (MBProgressHUD *)showHUDWithSuccessMessage:(NSString *)message{
    UIView *containerView = [UIApplication sharedApplication].keyWindow;
    return [self showHUDWithMessage:message inView:containerView status:YES];
}

+ (MBProgressHUD *)showHUDWithFailMessage:(NSString *)message{
    UIView *containerView = [UIApplication sharedApplication].keyWindow;
    return [self showHUDWithMessage:message inView:containerView status:NO];
}

+ (MBProgressHUD *)showHUDWithMessage:(NSString *)message inView:(UIView *)view status:(BOOL)isSuccess{
    objc_setAssociatedObject(self, &containerViewKey, view, OBJC_ASSOCIATION_RETAIN);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = message;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MBProgressHUD" ofType:@"bundle"];
    path = [path stringByAppendingPathComponent:isSuccess ? @"success.png" : @"error.png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.animationType = MBProgressHUDAnimationZoomOut;
    hud.margin = 10;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:2];
    return hud;
}

// 显示进度条
+ (void)showHUDWithProgressValue:(CGFloat)progress{
    UIView *containerView = [UIApplication sharedApplication].keyWindow;
    [self showHUDWithProgressValue:progress inView:containerView];
}


+ (void)showHUDWithProgressValue:(CGFloat)progress inView:(UIView *)view{
    objc_setAssociatedObject(self, &containerViewKey, view, OBJC_ASSOCIATION_RETAIN);
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    } else if (hud.progress == 0){
        [hud hideAnimated:NO];
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    hud.progress = progress;
    
    [hud setValue:[UIColor blackColor] forKeyPath:@"_indicator.lineColor"];
    [hud setValue:[UIColor blueColor] forKeyPath:@"_indicator.progressColor"];
    [hud setValue:[UIColor whiteColor] forKeyPath:@"_indicator.progressRemainingColor"];
    hud.margin = 10;
    if (progress >= 1) {
        [self hideHUDAnimated:YES];
    }
}

// 隐藏HUD
+ (void)hideHUDAnimated:(BOOL)animated{
    UIView *containerView = objc_getAssociatedObject(self, &containerViewKey);
    if (containerView) {
        MBProgressHUD *hud = [MBProgressHUD HUDForView:containerView];
        [hud hideAnimated:YES];
    }
}
@end
