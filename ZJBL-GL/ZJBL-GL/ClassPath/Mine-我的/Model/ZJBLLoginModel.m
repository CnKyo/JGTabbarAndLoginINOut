//
//  ZJBLLoginModel.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/6/1.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLLoginModel.h"

@implementation ZJBLLoginModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id"};
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"positionlist" : [LoginPoitionlistModel class]};
}


@end

@implementation LoginPoitionlistModel



@end

