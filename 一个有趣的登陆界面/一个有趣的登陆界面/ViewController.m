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
#define offset 60
#define  rectRightHand CGRectMake(LoginWidth -40, 90, 40, 65)
#define rectLeftGone CGRectMake(mainSizi.width/2 -100, vLogin.frame.origin.y - 22, 44, 44)
#define rectRightGone CGRectMake(mainSizi.width/2+ offset, vLogin.frame.origin.y - 22, 44, 44)
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
    
    textUser = [[UITextField alloc] initWithFrame:CGRectMake(30, 30, vLogin.frame.size.width - offset, 44)];
    textUser.delegate = self;
    textUser.layer.cornerRadius = 5;
    textUser.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textUser.layer.borderWidth = 0.5;
    textUser.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    textUser.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *imageUser = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    imageUser.image = [UIImage imageNamed:@"iconfont-user"];
    [textUser.leftView addSubview:imageUser];
    [vLogin addSubview:textUser];
    
    textPwd = [[UITextField alloc] initWithFrame:CGRectMake(30, 90, vLogin.frame.size.width - offset, 44)];
    textPwd.delegate = self;
    textPwd.layer.cornerRadius = 5;
    textPwd.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textPwd.layer.borderWidth = 0.5;
    textPwd.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    textPwd.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *imagePwd = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    imagePwd.image = [UIImage imageNamed:@"iconfont-password"];
    [textPwd.leftView addSubview:imagePwd];
    [vLogin addSubview:textPwd];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField isEqual:textUser]) {
        if (showType != ZzLoginShowType_PASS) {
            showType =ZzLoginShowType_USER;
            return;
        }
        showType = ZzLoginShowType_USER;
        [UIView animateWithDuration:0.5 animations:^{
            imageLeftHand.frame =CGRectMake(imageLeftHand.frame.origin.x - 55, imageLeftHand.frame.origin.y
                                            + 30, imageLeftHand.frame.size.width, imageLeftHand.frame.size.height);
            imageRightHand.frame =CGRectMake(imageRightHand.frame.origin.x + 52, imageRightHand.frame.origin.y
                                            + 30, imageRightHand.frame.size.width, imageRightHand.frame.size.height);
            
            imageLeftHandGone.frame =CGRectMake(imageLeftHandGone.frame.origin.x - 70, imageLeftHandGone.frame.origin.y
                                             , imageLeftHandGone.frame.size.width, imageLeftHandGone.frame.size.height);
            imageRightHandGone.frame =CGRectMake(imageRightHandGone.frame.origin.x + 30, imageRightHandGone.frame.origin.y
                                           , imageRightHandGone.frame.size.width, imageRightHandGone.frame.size.height);
        } completion:^(BOOL finished) {
        }];
    }
    else if ([textField isEqual:textPwd]){
        if (showType == ZzLoginShowType_PASS) {
            showType = ZzLoginShowType_PASS;
            return;
        }
        showType =ZzLoginShowType_PASS;
        [UIView animateWithDuration:0.5 animations:^{
            imageLeftHand.frame =CGRectMake(imageLeftHand.frame.origin.x + 55, imageLeftHand.frame.origin.y
                                            - 30, imageLeftHand.frame.size.width, imageLeftHand.frame.size.height);
            imageRightHand.frame =CGRectMake(imageRightHand.frame.origin.x - 52, imageRightHand.frame.origin.y
                                             - 30, imageRightHand.frame.size.width, imageRightHand.frame.size.height);
            
            imageLeftHandGone.frame =CGRectMake(imageLeftHandGone.frame.origin.x + 70, imageLeftHandGone.frame.origin.y
                                                , 0,0);
            imageRightHandGone.frame =CGRectMake(imageRightHandGone.frame.origin.x - 30, imageRightHandGone.frame.origin.y
                                                 , 0, 0);
        } completion:^(BOOL finished) {
        }];

    }
}


@end
