//
//  ZJBLHttpManager.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/5/31.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLHttpManager.h"
//#import "AFNetworking.h"
#import "ZJBLHttpBaseModel.h"

typedef enum : NSUInteger {
    POST,
    GET,
} ZJHttpMthod;



@implementation ZJBLHttpManager

/**
 *  Https请求证书设置
 *
 *  @return AFSecurityPolicy
 */

//+ (AFSecurityPolicy *)customSecurityPolicy
//{
//    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"https" ofType:@"cer"];
//    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
//    
//    NSSet *set = [NSSet setWithObject:certData];
//    /**
//     AFSecurityPolicy分三种验证模式：
//     AFSSLPinningModeNone:只是验证证书是否在信任列表中
//     AFSSLPinningModeCertificate：该模式会验证证书是否在信任列表中，然后再对比服务端证书和客户端证书是否一致
//     AFSSLPinningModePublicKey：只验证服务端证书与客户端证书的公钥是否一致
//     */
//    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//    // 是否允许使用自签名证书
//    [securityPolicy setAllowInvalidCertificates:YES];
//    [securityPolicy setPinnedCertificates:set];
//    return securityPolicy;
//}

//
//+ (AFHTTPSessionManager *)manager {
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    //    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//    //
//    //    manager.requestSerializer.timeoutInterval = 5.f;//设置请求超时时间
//    //
//    //    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
//    
//    return manager;
//}


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
                              failure:(failure)failure {
    
   
}






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
                  failure:(failure)failure {
    
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/api/supplier/login",HTTPBaseUrl];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"username"] = username;
    parameters[@"password"] = password;
    
    [self HttpRequestWithHttpMthod:POST URLStr:urlStr parameters:parameters progress:nil sueeess:success failure:failure];
}



#pragma mark - 公有方法 -
////////////////////////////////////////////////////////////////////////////////////
/***********************************  公有方法   ************************************/
////////////////////////////////////////////////////////////////////////////////////
/**
 *  创建一个http请求
 *
 *  @param httpMthod      请求方法 GET OR POST
 *  @param URLStr         请求URL字符串
 *  @param parameters     请求参数
 *  @param progress       请求进度(可忽略)
 *  @param success        请求成功的回调
 *  @param failure        请求失败的回调
 */
+ (void)HttpRequestWithHttpMthod:(ZJHttpMthod)httpMthod
                          URLStr:(NSString *)URLStr
                      parameters:(NSDictionary *)parameters
                        progress:(void (^)(NSProgress * _Nonnull))progress
                         sueeess:(success)success
                         failure:(failure)failure {
    
//    AFHTTPSessionManager *manager = [self manager];
//    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
//    [manager setSecurityPolicy:[self customSecurityPolicy]];
//    switch (httpMthod) {
//        case GET:
//        {
//            [manager GET:URLStr parameters:parameters progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                [self responseSuccessHandleWithResponseObject:responseObject success:success failure:failure];
//                
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                failure(ZJResponseFailed,error,@"网络请求失败");
//            }];
//        }
//            break;
//        case POST:
//        {
//            [manager POST:URLStr parameters:parameters progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                [self responseSuccessHandleWithResponseObject:responseObject success:success failure:failure];
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                failure(ZJResponseFailed,error,@"网络请求失败");
//            }];
//        }
//            break;
//        default:
//            break;
//    }
}




/**
 *  处理请求成功的方法
 *
 *  @param responseObject JSON 对象
 *  @param success        成功回调
 *  @param failure        失败回调（不是网络请求的失败，而是服务端返回的失败。例:参数错误，未登录等）
 */
+ (void)responseSuccessHandleWithResponseObject:(id)responseObject
                                        success:(success)success
                                        failure:(failure)failure {
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    
    ZJBLHttpBaseModel *baseModel = [[ZJBLHttpBaseModel alloc] initWithObject:dict];
    switch (baseModel.resultCode) {
        case ZJResponseSuccess:
            success(baseModel.data);
            break;
            
        default:
            failure(ZJResponseUnknown,nil,baseModel.resultMessage);
            break;
    }
}


@end
