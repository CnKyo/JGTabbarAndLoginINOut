//
//  ZJBLHttpManager.h
//  ZJBL-GL
//
//  Created by 郭军 on 2017/5/31.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ZJResponseFailed = 0,
    ZJResponseError     = 2,
    ZJResponseUnLogin   = 100,
    ZJResponseSuccess   = 200,
    ZJResponseUnknown,
} ZJHttpResponseState;

typedef void(^success)(id data);
typedef void(^failure)(ZJHttpResponseState responseState, NSError *error, NSString *message);


@interface ZJBLHttpManager : NSObject


#pragma mark - 客户 -
//////////////////////////////////////////////////////////////////////////////////////
/************************************  客户接口  *************************************/
/**
*  客户一级界面数据请求
*
*  @param startRow   起始行数
*  @param endRow     结束行数
*  @param success    成功回调
*  @param failure    失败回调
*/
+ (void)CustomerGetSellerListStartRow:(NSInteger)startRow
                               endRow:(NSInteger)endRow
                              success:(success)success
                              failure:(failure)failure;




#pragma mark - 我的 -
//////////////////////////////////////////////////////////////////////////////////////
/************************************  我的接口  *************************************/
/**
 *  我的 ---->  登录
 *
 *  @param username   登录账号
 *  @param password   登录密码
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)LoginWithUserName:(NSString *)username
                 password:(NSString *)password
                  success:(success)success
                  failure:(failure)failure;

@end
