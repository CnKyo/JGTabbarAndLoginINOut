//
//  ZJBLAppDelegate.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/5/31.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLAppDelegate.h"
#import "ZJBLTabbarController.h"
#import "ZJBLLoginController.h"
#import "ZJBLNavigationController.h"

@interface ZJBLAppDelegate ()

@property (nonatomic, strong) Reachability *hostReach;


@end



@implementation ZJBLAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    [self setRootVC];
    
    
    [self basicSetting];
        
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)setRootVC {
    
    NSString *tokenStr = [JGCommonTools getUserDefaultsWithKey:@"token"];
    
    if (!tokenStr.length) {
        
        self.window.rootViewController = [[ZJBLNavigationController alloc] initWithRootViewController:[[ZJBLLoginController alloc] init]];
        
    }else {
        
        self.window.rootViewController = [[ZJBLTabbarController alloc] init];
    }
}


- (void)basicSetting {
    
    //先设置网络监测状态为YES
    self.isReachable = YES;
    
    //网络监测
    [self judgeNetWorkState];
    
    
    
}

#pragma mark - 网络监测 -
- (void)judgeNetWorkState {
    
    //开启网络状况的监听
    [JGNotification addObserver:self
                       selector:@selector(reachabilityChanged:)
                           name:kReachabilityChangedNotification
                         object:nil];
    self.hostReach = [Reachability reachabilityWithHostname:@"www.baidu.com"] ;
    [self.hostReach startNotifier];  //开始监听，会启动一个run loop
}

//网络链接改变时会调用的方法
- (void)reachabilityChanged:(NSNotification *)note {
    Reachability *currReach = [note object];
    NSParameterAssert([currReach isKindOfClass:[Reachability class]]);
    
    //对连接改变做出响应处理动作
    NetworkStatus status = [currReach currentReachabilityStatus];
    //如果没有连接到网络就弹出提醒实况
    if(status == NotReachable)
    {
        self.isReachable = NO;
        [MBProgressHUD showError:@"网络连接错误,请稍后再试"];
    }
    else
    {
        self.isReachable = YES;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




@end
