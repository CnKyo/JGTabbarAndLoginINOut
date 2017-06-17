//
//  ZJBLLoginController.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/6/1.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLLoginController.h"
#import "ZJBLLoginModel.h"
#import "ZJBLLoginForgetPwdController.h"

@interface ZJBLLoginController ()

@property (nonatomic, strong) UITextField *accountTextF; //账号

@property (nonatomic, strong) UITextField *passwordTextF; //密码

@property (nonatomic, strong) ZJBLLoginModel *LoginModel; //登录模型

@end

@implementation ZJBLLoginController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createSubViews];
    
    
}


- (void)createSubViews {
    
    //设置背景色
    self.view.backgroundColor = [UIColor colorWithHexCode:@"#f4f4f4"];
    
    
    //logo
    UIImageView *logoV = [UIImageView new];
    logoV.image = [UIImage imageNamed:@"logo"];
    
    //login_logo_name
    UIImageView *logoNameV = [UIImageView new];
    logoNameV.image = [UIImage imageNamed:@"login_logo_name"];
    

    //账号
    _accountTextF = [UITextField new];
    _accountTextF.placeholder = @"用户名/邮箱/手机号";
    _accountTextF.keyboardType = UIKeyboardTypeNumberPad;
    _accountTextF.text = @"13283828620";
    _accountTextF.textColor = [UIColor colorWithHexCode:@"#333333"];
    _accountTextF.font = JGFont(13);
    [_accountTextF setValue:[UIColor colorWithHexCode:@"#999999"] forKeyPath:@"_placeholderLabel.textColor"];
    _accountTextF.clearButtonMode = UITextFieldViewModeWhileEditing;

    
    //中间线
    UIView *Line = [UIView new];
    Line.backgroundColor = [UIColor colorWithHexCode:@"#cccccc"];
    
    //密码
    _passwordTextF = [UITextField new];
    _passwordTextF.placeholder = @"请输入手机号";
    _passwordTextF.textColor = [UIColor colorWithHexCode:@"#333333"];
    _passwordTextF.font = JGFont(13);
    _passwordTextF.text = @"123456";
    [_passwordTextF setValue:[UIColor colorWithHexCode:@"#999999"] forKeyPath:@"_placeholderLabel.textColor"];
    _passwordTextF.clearButtonMode = UITextFieldViewModeWhileEditing;

    
    //密码底部线
    UIView *Line1 = [UIView new];
    Line1.backgroundColor = [UIColor colorWithHexCode:@"#cccccc"];
    
    
    
    //登录按钮
    UIButton *loginBtn = [UIButton new];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"logo-btn"] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = JGFont(14);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //忘记密码
    UIButton *forgetBtn = [UIButton new];
    [forgetBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor colorWithHexCode:@"#999999"] forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = JGFont(14);
    forgetBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    forgetBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [forgetBtn addTarget:self action:@selector(forgetBtnClick) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:logoV];
    [self.view addSubview:logoNameV];
    [self.view addSubview:_accountTextF];
    [self.view addSubview:Line];
    [self.view addSubview:_passwordTextF];
    [self.view addSubview:Line1];
    [self.view addSubview:loginBtn];
    [self.view addSubview:forgetBtn];
    
    
    [logoV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).mas_offset(80);
        make.width.equalTo(@(65));
        make.height.equalTo(@(75));
    }];
    
    [logoNameV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logoV.mas_bottom).mas_offset(17);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@(140));
        make.height.equalTo(@(30));
    }];
    
    
    [_accountTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logoNameV.mas_bottom).mas_offset(39);
        make.left.equalTo(self.view.mas_left).mas_offset(20);
        make.right.equalTo(self.view.mas_right).mas_offset(-20);
        make.height.equalTo(@(37));
    }];
    
    [Line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_accountTextF.mas_left);
        make.right.equalTo(_accountTextF.mas_right);
        make.top.equalTo(_accountTextF.mas_bottom);
        make.height.equalTo(@(1));
    }];
    
    [_passwordTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Line.mas_bottom);
        make.left.equalTo(_accountTextF.mas_left);
        make.right.equalTo(_accountTextF.mas_right);
        make.height.equalTo(@(45));
    }];
    
    [Line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_passwordTextF.mas_left);
        make.right.equalTo(_passwordTextF.mas_right);
        make.top.equalTo(_passwordTextF.mas_bottom);
        make.height.equalTo(@(1));
    }];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Line1.mas_left);
        make.right.equalTo(Line1.mas_right);
        make.top.equalTo(Line1.mas_bottom).mas_offset(20);
        make.height.equalTo(@(37));
    }];
    
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(loginBtn.mas_right);
        make.top.equalTo(loginBtn.mas_bottom).mas_offset(10);
        make.width.equalTo(@(100));
        make.height.equalTo(@(40));
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}


- (void)forgetBtnClick {
    
    ZJBLLoginForgetPwdController *forgetVC = [[ZJBLLoginForgetPwdController alloc] init];
    [self.navigationController pushViewController:forgetVC animated:YES];
    
    
}




#pragma mark - 点击了登录按钮 -
- (void)loginBtnClick {
    
    //退出键盘
    [self.view endEditing:YES];
    
    if (![JGCommonTools isNetWorkReachable]) {
        
        [MBProgressHUD showError:@"网络连接错误,请检查网络"];
        return;
    }
    
    
    //可以去掉空格，注意此时生成的str是autorelease属性的，不要妄想对strUrl进行release操作。
//    NSString *acountStr = [_accountTextF.text stringByReplacingOccurrencesOfString:@" " withString:@""];
//    
//    NSString *pwdStr = [_passwordTextF.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
//
    
    [MBProgressHUD showMessage:@"正在登陆"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hideHUD];
        [JGCommonTools saveToUserDefaults:@"test,test,test" key:@"token"];
   
        ZJBLTabbarController *tabbarVC = [[ZJBLTabbarController alloc] init];
        
        [UIApplication sharedApplication].keyWindow.rootViewController = tabbarVC;
    });
//
    
    
    
//    if (!acountStr.length) {
//        
//        [MBProgressHUD showError:@"请输入账号"];
//        return;
//    }
//    
//    if (!pwdStr.length) {
//        
//        [MBProgressHUD showError:@"请输入密码"];
//        return;
//    }
    
    
//    NSString *passwordStr = [JGCommonTools md5String:pwdStr];
    

}


//存储登录数据
- (void)saveLoginData {
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
