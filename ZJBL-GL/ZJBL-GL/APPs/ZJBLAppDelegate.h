//
//  ZJBLAppDelegate.h
//  ZJBL-GL
//
//  Created by 郭军 on 2017/5/31.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJBLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/** 标记网络状态  */
@property (nonatomic, assign)BOOL isReachable;


@end
