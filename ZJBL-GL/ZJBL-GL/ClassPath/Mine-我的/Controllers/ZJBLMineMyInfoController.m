//
//  ZJBLMineMyInfoController.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/6/1.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLMineMyInfoController.h"
#import "ZJBLMineMyInfoCell.h"
#import "ZJBLMineMyInfoHeader.h"

#import "ZJBLLoginController.h"
#import "ZJBLNavigationController.h"


@interface ZJBLMineMyInfoController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSArray *info_classArrM;

@end

static NSString * const ZJBLMineMyInfoCellID = @"ZJBLMineMyInfoCellID";

@implementation ZJBLMineMyInfoController

- (NSArray *)info_classArrM {
    if (!_info_classArrM) {
        _info_classArrM = @[@"手机", @"姓名", @"性别", @"生日", @"岗位", @"修改密码"];
    }
    return _info_classArrM;
}


- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHight - 64) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZJBLMineMyInfoCell class] forCellReuseIdentifier:ZJBLMineMyInfoCellID];
        UIView *HV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 10)];
        HV.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
        _tableView.tableHeaderView = HV;
        
        UIView *footerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 80)];
        footerV.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
        
        UIButton *exitBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 30, kDeviceWidth, 50)];
        exitBtn.titleLabel.font = JGFont(15);
        [exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [exitBtn setTitleColor:[UIColor colorWithHexCode:@"ffffff"] forState:UIControlStateNormal];
        [exitBtn setBackgroundImage:[UIImage imageWithColor:JGMainColor] forState:UIControlStateNormal];
        [exitBtn setBackgroundImage:[UIImage imageWithColor:JGButtonHeighColor] forState:UIControlStateHighlighted];
        [exitBtn addTarget:self action:@selector(exitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [footerV addSubview:exitBtn];
        
        _tableView.tableFooterView = footerV;
    }
    return _tableView;
}




- (NSString *)CustomNavTitle {
    return @"我的信息";
}


// 返回
- (void)backBtnClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
    
    //创建Table
    [self.view addSubview:self.tableView];
    
}



- (void)exitBtnClick {
    
//    __weak typeof(self) WeakSelf = self;
    
    //显示指示器
    [MBProgressHUD showMessage:@"正在退出..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //隐藏指示器
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showSuccess:@"退出成功!"];
        
        //清空token
        [JGCommonTools saveToUserDefaults:@"" key:@"token"];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.navigationController popToRootViewControllerAnimated:NO];
            [JGNotification postNotificationName:JGLoginBackCustomerVCNotification object:@"客户"];
            
            [UIApplication sharedApplication].keyWindow.rootViewController = [[ZJBLNavigationController alloc] initWithRootViewController:[[ZJBLLoginController alloc] init]];
        });
        
    });
    
}


#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.info_classArrM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZJBLMineMyInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:ZJBLMineMyInfoCellID forIndexPath:indexPath];
    cell.Info_Class.text = [self.info_classArrM objectAtIndex:indexPath.row];
//    cell.Info_Name.text = [self.info_nameArrM objectAtIndex:indexPath.row];
    if (indexPath.row >= 5) {
        cell.Arrow_Img.image = [UIImage imageNamed:@"my_info_arrow_right"];
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    ZJBLMineMyInfoHeader *headerV = [[ZJBLMineMyInfoHeader alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 94)];
    
    return headerV;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 94.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
