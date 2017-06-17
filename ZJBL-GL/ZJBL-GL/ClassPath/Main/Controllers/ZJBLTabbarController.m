//
//  ZJBLTabbarController.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/5/31.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLTabbarController.h"

#import "ZJBLNavigationController.h" //导航控制器

#import "ZJBLCustomerController.h" //客户
#import "ZJBLSchedulingController.h" //排程
#import "ZJBLWarehouseController.h" //仓库
#import "ZJBLLogisticsController.h" //物流
#import "ZJBLMineController.h" //我的

#import "ZJBLTabbar.h"
#import "ZJBLTabbarCenterButton.h"

#define kCenterViewWidth 49
#define kCenterViewHeight 61
#define kCenterBtnWidth kCenterViewWidth
#define kCenterBtnHeight 50



@interface ZJBLTabbarController () <ZJBLTabBarDelegate> {
    ZJBLTabbarButton *_selectedBarButton;
}


@property(nonatomic,strong) ZJBLTabbarCenterButton *centerBtn;
@property(nonatomic,strong) UIView *centerView;
@property(nonatomic,strong) ZJBLTabbar *lctabBar;

@end

@implementation ZJBLTabbarController

HMSingletonM(ZJBLTabbarController)

- (ZJBLTabbar *)lctabBar {
    
    if (!_lctabBar) {
        
        _lctabBar = [[ZJBLTabbar alloc]initWithFrame:self.tabBar.bounds];
        _lctabBar.delegate = self;
        CGRect frame = _lctabBar.frame;
        _lctabBar.frame = CGRectMake(0, self.view.frame.size.height-kTabbarHeight, frame.size.width, kTabbarHeight);
        _lctabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_bg"]];
    }
    return _lctabBar;
}


- (UIView *)centerView {
    if (!_centerView) {
        
        _centerView =[[UIView alloc]init];
        _centerView.center = CGPointMake(kDeviceWidth*0.5, kDeviceHight-(kCenterViewHeight*0.5));
        _centerView.bounds = CGRectMake(0, 0, kCenterViewWidth, kCenterViewHeight);
        _centerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_center_bg"]];
        _centerBtn = [[ZJBLTabbarCenterButton alloc]initWithFrame:CGRectMake(0, 5, kCenterBtnWidth, kCenterViewHeight - 6)];
        [_centerBtn setImage:[UIImage imageNamed:@"Warehouse_normal"] forState:UIControlStateNormal];
        [_centerBtn setImage:[UIImage imageNamed:@"Warehouse_selected"] forState:UIControlStateSelected];
        _centerBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_centerBtn setTitle:@"仓库" forState:UIControlStateNormal];
        [_centerBtn setTitleColor:JGMainColor forState:UIControlStateSelected];
        [_centerBtn setTitleColor:JGRGBColor(128, 128, 128) forState:UIControlStateNormal];
        _centerBtn.tag = 2;
        [_centerBtn addTarget:self action:@selector(centerClick:) forControlEvents:UIControlEventTouchUpInside];
        [_centerView addSubview:_centerBtn];
    }
    return _centerView;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBar removeFromSuperview];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建子控制器
    [self setUpChildViewControllers];
    
    // 修改tabbar中间的tabbarItem
    [self setUpMidelTabbarItem];
    
    [JGNotification addObserver:self
                       selector:@selector(LoginBackCustomerVC)
                           name:JGLoginBackCustomerVCNotification
                         object:nil];
    
    
}

- (void)dealloc {
    [JGNotification removeObserver:self];
}

//登录 回到首页
- (void)LoginBackCustomerVC {
    
    [self goToSelectCtrlWithTitle:@"客户" Index:0];
}



/**
 切换Tabbar下的控制器到指定界面
 
 @param name Tabbar的名字
 @param Index Tabbar控制器的位置
 */
- (void)goToSelectCtrlWithTitle:(NSString *)name Index:(NSUInteger)Index {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (UIView *view in self.lctabBar.subviews) {
            if ([view isMemberOfClass:[ZJBLTabbarButton class]]) {
                ZJBLTabbarButton *btn = (ZJBLTabbarButton *)view;
                if ([btn.currentTitle isEqualToString:name]) {
                    btn.selected = YES;
                    self.selectedIndex = Index;
                    _centerBtn.selected = NO;
                    _selectedBarButton = btn;
                }else {
                    btn.selected = NO;
                }
            }
        }
    });
}





#pragma mark -修改tabbar中间的tabbarItem
- (void)setUpMidelTabbarItem {
    
    //    self.tabBar.hidden = YES;
    
    [self.view addSubview:self.lctabBar];
    [self.view addSubview:self.centerView];
}



//隐藏tabBar
- (void)hiddenCusTabbar {
    
    self.centerView.hidden = YES;
    self.lctabBar.hidden = YES;
}

//显示tabBar
- (void)showCusTabbar {
    self.centerView.hidden = NO;
    self.lctabBar.hidden = NO;
}


-(void)centerClick:(UIButton *)btn{
    //    NSLog(@"%ld",(long)btn.tag);
    
    for (UIView *view in self.lctabBar.subviews) {
        if ([view isMemberOfClass:[ZJBLTabbarButton class]]) {
            ZJBLTabbarButton *btn = (ZJBLTabbarButton *)view;
            btn.selected = NO;
        }
    }
    
    
    _selectedBarButton.selected = NO;
    _centerBtn.selected = YES;
    
    self.selectedIndex = btn.tag;
    
    //添加动画
    [self cusTabbarItemAddAnimationWithBtn:btn];
}


-(void)changeNav:(NSInteger)from to:(NSInteger)to andBtn:(ZJBLTabbarButton *)btn {
    self.selectedIndex = to;
    _selectedBarButton.selected = NO;
    _selectedBarButton = btn;
    _centerBtn.selected = NO;
    //    NSLog(@"%ld - %@",(long)to, btn.currentTitle);
    
    //添加动画
    [self cusTabbarItemAddAnimationWithBtn:btn];
}

//添加动画
- (void)cusTabbarItemAddAnimationWithBtn:(UIButton *)btn {
    
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.2;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [btn.layer addAnimation:pulse forKey:nil];
}



/**
 *  创建子控制器
 */
- (void)setUpChildViewControllers {
    
    //客户
    [self addChildViewController:[[ZJBLNavigationController alloc] initWithRootViewController:[[ZJBLCustomerController alloc] init]]];
    
    //排程
    [self addChildViewController:[[ZJBLNavigationController alloc] initWithRootViewController:[[ZJBLSchedulingController alloc] init]]];
    
    //仓库
    [self addChildViewController:[[ZJBLNavigationController alloc] initWithRootViewController:[[ZJBLWarehouseController alloc] init]]];
    
    //物流
    [self addChildViewController:[[ZJBLNavigationController alloc] initWithRootViewController:[[ZJBLLogisticsController alloc] init]]];
    
    //我的
    [self addChildViewController:[[ZJBLNavigationController alloc] initWithRootViewController:[[ZJBLMineController alloc] init]]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
