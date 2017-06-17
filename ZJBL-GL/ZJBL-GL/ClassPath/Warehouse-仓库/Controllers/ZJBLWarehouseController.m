//
//  ZJBLWarehouseController.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/5/31.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLWarehouseController.h"
#import "ZJBLWarehouseHeader.h"
#import "ZJBLWarehouseCell.h"


@interface ZJBLWarehouseController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;


@end

static NSString * const ZJBLWarehouseCellId = @"ZJBLWarehouseCellId";

@implementation ZJBLWarehouseController

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 160, kDeviceWidth, kDeviceHight - 44-160) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZJBLWarehouseCell class] forCellReuseIdentifier:ZJBLWarehouseCellId];
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //隐藏导航栏
    /*
     navigationBarHidden: 连同导航侧滑返回手势消失
     navigationBar.hidden: 只消失导航
     */
    //    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //显示导航栏
    //    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.hidden = NO;
}






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavBar];
    [self.view addSubview:self.tableView];
    
    

    
}


//创建导航栏
- (void)createNavBar {
    
    
    
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 160)];
    [self.view addSubview:navView];
    
    UIImageView *navImgV = [[UIImageView alloc] initWithFrame:navView.bounds];
    navImgV.image = [UIImage imageNamed:@"warhouse_title_bg"];
    [navView addSubview:navImgV];
}




#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZJBLWarehouseCell *cell = [tableView dequeueReusableCellWithIdentifier:ZJBLWarehouseCellId forIndexPath:indexPath];
    
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
