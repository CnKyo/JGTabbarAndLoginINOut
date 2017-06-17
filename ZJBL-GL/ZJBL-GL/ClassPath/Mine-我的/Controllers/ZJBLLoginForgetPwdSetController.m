//
//  ZJBLLoginForgetPwdSetController.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/6/17.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLLoginForgetPwdSetController.h"

@interface ZJBLLoginForgetPwdSetController ()
{
    UIButton *_bottomBtn;
}

@property (nonatomic, strong) UITextField *PwdTF; //新密码

@property (nonatomic, strong) UITextField *AgainPwdTF; //再次输入的新密码


@end

@implementation ZJBLLoginForgetPwdSetController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
    
    self.navigationItem.title = @"重置密码";
    
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
    
    
    _PwdTF = [UITextField new];
    _PwdTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    _PwdTF.leftViewMode = UITextFieldViewModeAlways;
    _PwdTF.placeholder = @"请输入重置密码";
    _PwdTF.textColor = [UIColor colorWithHexCode:@"#333333"];
    _PwdTF.font = JGFont(13);
    _PwdTF.secureTextEntry = YES;
    [_PwdTF setValue:[UIColor colorWithHexCode:@"#cccccc"] forKeyPath:@"_placeholderLabel.textColor"];
    _PwdTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_PwdTF addTarget:self action:@selector(PwdTFChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    UIView *Line1 = [UIView new];
    Line1.backgroundColor = [UIColor colorWithHexCode:@"#e3e3e3"];
    
    
    _AgainPwdTF = [UITextField new];
    _AgainPwdTF.placeholder = @"请再次输入重置密码";
    _AgainPwdTF.font = [UIFont systemFontOfSize:13];
    _AgainPwdTF.textColor = [UIColor colorWithHexCode:@"#333333"];
    _AgainPwdTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    _AgainPwdTF.leftViewMode = UITextFieldViewModeAlways;
    _AgainPwdTF.tintColor = JGMainColor;
    _AgainPwdTF.secureTextEntry = YES;
    _AgainPwdTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _AgainPwdTF.layer.borderColor = [UIColor colorWithHexCode:@"#f0f0f0"].CGColor;
    [_AgainPwdTF setValue:[UIColor colorWithHexCode:@"#cccccc"] forKeyPath:@"_placeholderLabel.textColor"];
    [_AgainPwdTF setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    [_AgainPwdTF addTarget:self action:@selector(AgainPwdTFChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    
    UIView *Line2 = [UIView new];
    Line2.backgroundColor = [UIColor colorWithHexCode:@"#e3e3e3"];
    
    
    _bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, kDeviceHight - 48 - 64, kDeviceWidth, 48)];
    _bottomBtn.clipsToBounds = YES;
    _bottomBtn.layer.cornerRadius = 5.0f;
    [_bottomBtn setTitle:@"提交" forState:UIControlStateNormal];
    _bottomBtn.titleLabel.font = JGFont(15);
    [_bottomBtn setTitleColor:[UIColor colorWithHexCode:@"ffffff"] forState:UIControlStateNormal];
    [_bottomBtn setBackgroundImage:[UIImage imageWithColor:JGMainColor] forState:UIControlStateNormal];
    [_bottomBtn setBackgroundImage:[UIImage imageWithColor:JGButtonHeighColor] forState:UIControlStateHighlighted];
    [_bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _bottomBtn.enabled = NO;
    
    [self.view addSubview:totalV];
    [totalV addSubview:_PwdTF];
    [totalV addSubview:Line1];
    [totalV addSubview:_AgainPwdTF];
    [totalV addSubview:Line2];
    [self.view addSubview:_bottomBtn];
    
    [totalV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(Line2.mas_bottom);
    }];
    
    
    [_PwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(totalV.mas_top).mas_offset(15);
        make.left.equalTo(totalV.mas_left).mas_offset(15);
        make.right.equalTo(totalV.mas_right).mas_offset(-15);
        make.height.equalTo(@(40));
    }];
    
    
    [Line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(totalV.mas_left);
        make.right.equalTo(totalV.mas_right);
        make.top.equalTo(_PwdTF.mas_bottom).mas_offset(5);
        make.height.equalTo(@(1));
    }];
    
    [_AgainPwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(totalV.mas_left).mas_offset(15);
        make.right.equalTo(totalV.mas_right).mas_offset(-15);
        make.top.equalTo(Line1.mas_bottom).mas_offset(5);
        make.height.equalTo(@(40));
    }];
    
    [Line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(totalV.mas_left);
        make.right.equalTo(totalV.mas_right);
        make.top.equalTo(_AgainPwdTF.mas_bottom).mas_offset(5);
        make.height.equalTo(@(1));
    }];
    
    [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).mas_offset(15);
        make.right.equalTo(self.view.mas_right).mas_offset(-15);
        make.top.equalTo(totalV.mas_bottom).mas_offset(15);
        make.height.equalTo(@(40));
    }];
    
}

#pragma mark - 监听按钮是否可以点击 -
-(void)PwdTFChange:(UITextField *)textF{
    _bottomBtn.enabled = (_PwdTF.text.length && _AgainPwdTF.text.length);
}


-(void)AgainPwdTFChange:(UITextField *)textF {
    _bottomBtn.enabled = (_PwdTF.text.length && _AgainPwdTF.text.length);
}



#pragma mark - 点击了底部按钮 -
- (void)bottomBtnClick {
    
    if (![JGCommonTools isNetWorkReachable]) {
        
        [MBProgressHUD showError:@"网络连接错误,请检查网络"];
        return;
    }
    
    
    if (![_PwdTF.text isEqualToString:_AgainPwdTF.text]) {
        [MBProgressHUD showError:@"两次输入不一致,请重新输入"];
        _PwdTF.text = @"";
        _AgainPwdTF.text = @"";
        return;
    }
    
//    NSString *PwdStr = [JGCommonTools md5String:_PwdTF.text];

    
    [MBProgressHUD showSuccess:@"修改成功"];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
