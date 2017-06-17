//
//  ZJBLCustomerCell.h
//  ZJBL-GL
//
//  Created by 郭军 on 2017/5/31.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJBLCustomerModel;

@interface ZJBLCustomerCell : UITableViewCell

@property (nonatomic, strong) UIImageView *Icon; //图像

@property (nonatomic, strong) UILabel *BgValue; //角标


@property (nonatomic, strong) UILabel *Title; //标题

//@property (nonatomic, strong) UIImageView *StateIcon; //状态图像
//
//@property (nonatomic, strong) UILabel *State; //状态

@property (nonatomic, strong) UIImageView *TimeIcon; //时间图像

@property (nonatomic, strong) UILabel *Time; //时间

@property (nonatomic, strong) UILabel *Distance; //距离

@property (nonatomic, strong) UILabel *Info; //信息


@property (nonatomic, strong) ZJBLCustomerModel *Model;


@end
