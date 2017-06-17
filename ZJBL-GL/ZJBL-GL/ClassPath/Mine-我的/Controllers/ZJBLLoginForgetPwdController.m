//
//  ZJBLLoginForgetPwdController.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/6/17.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLLoginForgetPwdController.h"
#import "ZJBLTimerButton.h"
#import "ZJBLLoginForgetPwdSetController.h"


@interface ZJBLLoginForgetPwdController () {
    UIButton *_bottomBtn;
    ZJBLTimerButton *_TimerBtn;
}

@property (nonatomic, strong) UITextField *TelTF; //手机号

@property (nonatomic, strong) UITextField *CodeTF; //验证码


@end

@implementation ZJBLLoginForgetPwdController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
    
    self.navigationItem.title = @"修改手机号";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"nav_back" highIcon:nil target:self action:@selector(backIconClick)];
    
    [self createSubViews];
    
}


- (void)backIconClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}



- (void)createSubViews {
    
    UIView *totalV = [UIView new];
    totalV.backgroundColor = [UIColor whiteColor];

    
    _TelTF = [UITextField new];
    _TelTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    _TelTF.leftViewMode = UITextFieldViewModeAlways;
    _TelTF.placeholder = @"请输入手机号";
    _TelTF.keyboardType = UIKeyboardTypeNumberPad;
    _TelTF.textColor = [UIColor colorWithHexCode:@"#333333"];
    _TelTF.font = JGFont(13);
    [_TelTF setValue:[UIColor colorWithHexCode:@"#cccccc"] forKeyPath:@"_placeholderLabel.textColor"];
    _TelTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_TelTF addTarget:self action:@selector(TelTFChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    //时间按钮
    _TimerBtn = [[ZJBLTimerButton alloc] initWithFrame:CGRectMake(_TelTF.right, _TelTF.y , 105, 40)];
    _TimerBtn.enabled = NO;
    __weak typeof(self) WeakSelf = self;
    _TimerBtn.countDownButtonBlock = ^{
        
        //开始获取验证码
        [WeakSelf SendCode];
    };
    
    UIView *Line1 = [UIView new];
    Line1.backgroundColor = [UIColor colorWithHexCode:@"#e3e3e3"];
    
    
    _CodeTF = [UITextField new];
    _CodeTF.placeholder = @"请输入短信验证码";
    _CodeTF.font = [UIFont systemFontOfSize:13];
    _CodeTF.textColor = [UIColor colorWithHexCode:@"#333333"];
    _CodeTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    _CodeTF.leftViewMode = UITextFieldViewModeAlways;
    _CodeTF.tintColor = JGMainColor;
    _CodeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _CodeTF.layer.borderColor = [UIColor colorWithHexCode:@"#f0f0f0"].CGColor;
    [_CodeTF setValue:[UIColor colorWithHexCode:@"#cccccc"] forKeyPath:@"_placeholderLabel.textColor"];
    [_CodeTF setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    [_CodeTF addTarget:self action:@selector(CodeTFChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    UIView *Line2 = [UIView new];
    Line2.backgroundColor = [UIColor colorWithHexCode:@"#e3e3e3"];
    
    
    _bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, kDeviceHight - 48 - 64, kDeviceWidth, 48)];
    _bottomBtn.clipsToBounds = YES;
    _bottomBtn.layer.cornerRadius = 5.0f;
    [_bottomBtn setTitle:@"下一步" forState:UIControlStateNormal];
    _bottomBtn.titleLabel.font = JGFont(15);
    [_bottomBtn setTitleColor:[UIColor colorWithHexCode:@"ffffff"] forState:UIControlStateNormal];
    [_bottomBtn setBackgroundImage:[UIImage imageWithColor:JGMainColor] forState:UIControlStateNormal];
    [_bottomBtn setBackgroundImage:[UIImage imageWithColor:JGButtonHeighColor] forState:UIControlStateHighlighted];
    [_bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _bottomBtn.enabled = NO;
    
    [self.view addSubview:totalV];
    [totalV addSubview:_TelTF];
    [totalV addSubview:_TimerBtn];
    [totalV addSubview:Line1];
    [totalV addSubview:_CodeTF];
    [totalV addSubview:Line2];
    [self.view addSubview:_bottomBtn];
    
    [totalV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(Line2.mas_bottom);
    }];
        
    [_TelTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(totalV.mas_left).mas_offset(15);
        make.height.equalTo(@(40));
        make.width.equalTo(@(kDeviceWidth-145));
        make.centerY.equalTo(_TimerBtn.mas_centerY);
    }];
    
    [_TimerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_TelTF.mas_right).mas_offset(10);
        make.top.equalTo(totalV.mas_top).mas_offset(21);
        make.width.equalTo(@(105));
        make.height.equalTo(@(40));
    }];
    
    [Line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(totalV.mas_left);
        make.right.equalTo(totalV.mas_right);
        make.top.equalTo(_TelTF.mas_bottom).mas_offset(10);
        make.height.equalTo(@(1));
    }];
    
    [_CodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(totalV.mas_left).mas_offset(15);
        make.right.equalTo(totalV.mas_right).mas_offset(-15);
        make.top.equalTo(Line1.mas_bottom).mas_offset(10);
        make.height.equalTo(@(40));
    }];
    
    [Line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(totalV.mas_left);
        make.right.equalTo(totalV.mas_right);
        make.top.equalTo(_CodeTF.mas_bottom).mas_offset(5);
        make.height.equalTo(@(1));
    }];
    
    [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).mas_offset(15);
        make.right.equalTo(self.view.mas_right).mas_offset(-15);
        make.top.equalTo(totalV.mas_bottom).mas_offset(15);
        make.height.equalTo(@(40));
    }];
    
}


//发送验证码
- (void)SendCode {
    
//    if (![JGCommonTools isNetWorkReachable]) {
//        
//        [MBProgressHUD showError:@"网络连接错误,请检查网络"];
//        return;
//    }
    
    
     [MBProgressHUD showSuccess:@"已发送,请注意查收"];
    
    //[_TimerBtn reSetCodeBtn];  这里网络请求 失败调用reSetCodeBtn


}

#pragma mark - 监听按钮是否可以点击 -
-(void)CodeTFChange:(UITextField *)textF{
    _bottomBtn.enabled = _CodeTF.text.length;
}

//获取验证码按钮是否可以点击
-(void)TelTFChange:(UITextField *)textF{
    _TimerBtn.enabled = _TelTF.text.length;
}


#pragma mark - 点击了底部按钮 -
- (void)bottomBtnClick {
    
    
//    if (![JGCommonTools isNetWorkReachable]) {
//        
//        [MBProgressHUD showError:@"网络连接错误,请检查网络"];
//        return;
//    }
//    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    ZJBLLoginForgetPwdSetController *SetVC = [[ZJBLLoginForgetPwdSetController alloc] init];
    SetVC.Tel = _TelTF.text;
    [self.navigationController pushViewController:SetVC animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
