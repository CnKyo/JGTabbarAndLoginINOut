//
//  ZJBLCustomerController.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/5/31.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLCustomerController.h"
#import "ZJBLCustomerCell.h"
#import "ZJBLCustomerModel.h"


@interface ZJBLCustomerController () <UITableViewDelegate, UITableViewDataSource> {
    NSInteger _dataCount;
}

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *customerArrM;

@end

static NSString * const ZJBLCustomerCellId = @"ZJBLCustomerCellId";


@implementation ZJBLCustomerController

- (NSMutableArray *)customerArrM {
    if (!_customerArrM) {
        _customerArrM = [NSMutableArray array];
    }
    return _customerArrM;
}


- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHight - 64) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZJBLCustomerCell class] forCellReuseIdentifier:ZJBLCustomerCellId];
        UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 13)];
        headerV.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
        _tableView.tableHeaderView = headerV;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}


- (UIBarButtonItem *)getLeftButtonItem {
    //导航栏左侧
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 30, 200, 30)];
    //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    leftBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    [leftBtn setImage:[UIImage imageNamed:@"customer_nav_left"] forState:UIControlStateNormal];
    [leftBtn setTitle:@"仓库345678904569" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

- (UIBarButtonItem *)getRightButtonItem {
    
    UIView *rightNavView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 88, 40)];
    
    //导航栏右侧
    UIButton *rightBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(88 - 27, 6 + 7, 17, 17)];
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"customer_nav_right_add"] forState:UIControlStateNormal];
    [rightBtn1 addTarget:self action:@selector(rightBtn1Click) forControlEvents:UIControlEventTouchUpInside];
    [rightNavView addSubview:rightBtn1];
    
    //导航栏右侧
    UIButton *rightBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(88 - 71, 6 + 7, 17, 17)];
    [rightBtn2 setBackgroundImage:[UIImage imageNamed:@"customer_nav_right_search"] forState:UIControlStateNormal];
    [rightBtn2 addTarget:self action:@selector(rightBtn2Click) forControlEvents:UIControlEventTouchUpInside];
    [rightNavView addSubview:rightBtn2];
    return [[UIBarButtonItem alloc] initWithCustomView:rightNavView];
}

//点击导航栏左侧
- (void)leftBtnClick {
    
    
    
}

//点击了导航栏右侧 加号 按钮
- (void)rightBtn1Click {
    
    
}

//点击了导航栏右侧 搜索 按钮
- (void)rightBtn2Click {
    
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[ZJBLTabbarController sharedZJBLTabbarController] showCusTabbar];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = [self getLeftButtonItem];
    self.navigationItem.rightBarButtonItem = [self getRightButtonItem];;
    [self.view addSubview:self.tableView];
    

   //[self setupRefresh];
    
}

//设置刷新数据
- (void)setupRefresh {
    
//    self.tableView.mj_header = [ZJBLRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    [self.tableView.mj_header beginRefreshing];
//    
//    self.tableView.mj_footer = [ZJBLRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

//加载最新数据
- (void)loadNewData {
    
    if (![JGCommonTools isNetWorkReachable]) {
        
        [MBProgressHUD showError:@"网络连接错误,请检查网络"];
        return;
    }
    
   }

//加载更多数据
- (void)loadMoreData {
    
    if (![JGCommonTools isNetWorkReachable]) {
        
        [MBProgressHUD showError:@"网络连接错误,请检查网络"];
        return;
    }

}


#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.customerArrM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZJBLCustomerCell *cell = [tableView dequeueReusableCellWithIdentifier:ZJBLCustomerCellId forIndexPath:indexPath];
    cell.Model = [self.customerArrM objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
 
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 79 ;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
