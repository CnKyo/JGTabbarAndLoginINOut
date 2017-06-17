//
//  ZJBLMineController.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/5/31.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLMineController.h"
#import "ZJBLMineCell.h"
#import "ZJBLMineHeaderView.h"

#import "ZJBLMineMyInfoController.h" //我的信息


@interface ZJBLMineController () <UITableViewDelegate, UITableViewDataSource> {
    ZJBLMineHeaderView *_headerV;
}


@property (nonatomic, strong)UITableView *tableView;

@end


static NSString * const ZJBLMineCellId = @"ZJBLMineCellId";

@implementation ZJBLMineController

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHight - 64) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[ZJBLMineCell class] forCellReuseIdentifier:ZJBLMineCellId];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
        _tableView.scrollIndicatorInsets = _tableView.contentInset;
        _headerV = [[ZJBLMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 136)];
//        _headerV.delegate = self;
        _tableView.tableHeaderView = _headerV;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
    }
    return _tableView;
}




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.tabBarController.tabBar.hidden = YES;
    [[ZJBLTabbarController sharedZJBLTabbarController] showCusTabbar];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的";

    [self.view addSubview:self.tableView];
    
    
}



#pragma mark - UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) return 3;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZJBLMineCell *cell = [tableView dequeueReusableCellWithIdentifier:ZJBLMineCellId forIndexPath:indexPath];

    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            cell.iconImgV.image = [UIImage imageNamed:@"frg_my_info_msg"];
            cell.titleLbl.text = @"我的信息";
        }else if (indexPath.row == 1) {
            
            cell.iconImgV.image = [UIImage imageNamed:@"frg_my_info_stucure"];
            cell.titleLbl.text = @"组织架构";
        }else if (indexPath.row == 2) {
            
            cell.iconImgV.image = [UIImage imageNamed:@"frg_my_info_record"];
            cell.titleLbl.text = @"个人业绩";
        }        
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            
            cell.iconImgV.image = [UIImage imageNamed:@"frg_my_info_train"];
            cell.titleLbl.text = @"培训中心";
        }
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    if (indexPath.section == 0) {
        if (indexPath.row == 0) { //我的信息
            ZJBLMineMyInfoController *myInfoVC = [[ZJBLMineMyInfoController alloc] init];
             [[ZJBLTabbarController sharedZJBLTabbarController] hiddenCusTabbar];
            [self.navigationController pushViewController:myInfoVC animated:YES];
            
        }
    }
    
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 8.0f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50 ;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
