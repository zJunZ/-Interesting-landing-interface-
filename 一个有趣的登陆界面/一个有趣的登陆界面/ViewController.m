//
//  ViewController.m
//  一个有趣的登陆界面
//
//  Created by Mac on 16/3/13.
//  Copyright © 2016年 zz.com. All rights reserved.
//

#import "ViewController.h"
#define LoginWidth 211
#define LoginHight 108
#define mainSizi [UIScreen mainScreen].bounds.size
#define rectLogin CGRectMake((mainSizi.width - LoginWidth)/2, 100, LoginWidth, LoginHight)
#define  rectLeftHand CGRectMake(5, 90, 40, 65)
#define  rectRightHand CGRectMake(LoginWidth -40, 90, 40, 65)
#define rectLeftGone CGRectMake(mainSizi.width/2 -100, vLogin.frame.origin.y - 22, 44, 44)
#define rectRightGone CGRectMake(mainSizi.width/2+ 60, vLogin.frame.origin.y - 22, 44, 44)
@interface ViewController ()<UITextFieldDelegate>
{
    UITextField *textUser;
    UITextField *textPwd;
    
    UIImageView *imageLeftHand;
    UIImageView *imageRightHand;
    
    UIImageView *imageLeftHandGone;
    UIImageView *imageRightHandGone;
    
    ZzLoginShowType showType;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubView];
}
-(void)setUpSubView{
    UIImageView *imageLogin = [[UIImageView alloc] initWithFrame:rectLogin];
    imageLogin.image = [UIImage imageNamed:@"owl-login"];
    //    imageLogin.layer.masksToBounds = YES;
    [self.view addSubview:imageLogin];
    
    imageLeftHand = [[UIImageView alloc] initWithFrame:rectLeftHand];
    imageLeftHand.image = [UIImage imageNamed:@"owl-login-arm-left"];
    [imageLogin addSubview:imageLeftHand];
    
    imageRightHand = [[UIImageView alloc] initWithFrame:rectRightHand];
    imageRightHand.image = [UIImage imageNamed:@"owl-login-arm-right"];
    [imageLogin addSubview:imageRightHand];
    
    UIView *vLogin = [[UIView alloc] initWithFrame:CGRectMake(15, 200, mainSizi.width -30, 160)];
    vLogin.layer.borderWidth  = 1;
    vLogin.layer.borderColor = [UIColor lightGrayColor].CGColor;
    vLogin.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:vLogin];
    
    imageLeftHandGone = [[UIImageView alloc] initWithFrame:rectLeftGone];
    imageLeftHandGone.image = [UIImage imageNamed:@"未标题-1"];
    [self.view addSubview:imageLeftHandGone];
    
    imageRightHandGone = [[UIImageView alloc] initWithFrame:rectRightGone];
    imageRightHandGone.image = [UIImage imageNamed:@"未标题-1"];
    [self.view addSubview:imageRightHandGone];
}



@end
