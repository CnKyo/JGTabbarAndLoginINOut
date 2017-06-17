//
//  ZJBLLoginModel.h
//  ZJBL-GL
//
//  Created by 郭军 on 2017/6/1.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJBLLoginModel : NSObject

/*
 * 标识
 */
@property (nonatomic, assign) int ID;

@property (nonatomic, copy) NSString *token;

/*
 * 员工编码
 */
@property (nonatomic, copy) NSString *employeeCode;
/*
 * 仓库编号
 */
@property (nonatomic, copy) NSString *warehouseCode;
/*
 * 员工密码
 */
@property (nonatomic, copy) NSString *password;

/*
 * 员工名字
 */
@property (nonatomic, copy) NSString *ename;
/*
 * 所属机构id
 */
@property (nonatomic, copy) NSString *mechanismId;
/*
 * 所属机构名称
 */
@property (nonatomic, copy) NSString *mechanismName;

/*
 * 手机号码
 */
@property (nonatomic, copy) NSString *tel;

/*
 * 性别
 */
@property (nonatomic, assign) int sex;

/*
 * 生日
 */
@property (nonatomic, copy) NSString * birthday;

/*
 * 岗位名称
 */
@property (nonatomic, copy) NSString * positionNames;

/*
 * 区域名称
 */
@property (nonatomic, copy) NSString * regionNames;
/*
 *区域Id集
 */
@property (nonatomic, copy) NSString * regionIds;
/*
 * 岗位Id集
 */
@property (nonatomic, copy) NSString * positionIds;

/*
 * 岗位列表
 */
@property (nonatomic, strong) NSMutableArray *positionlist;
//private List<PosBean> positionlist=new ArrayList<PosBean>();

//    /*
//     * 删除标记 0.未删除  1.已删除
//     */
//    private int isDeleted;
@property (nonatomic, copy) NSString * url;




@end


@interface LoginPoitionlistModel : NSObject

@property (nonatomic, copy) NSString *positionName;


@end


