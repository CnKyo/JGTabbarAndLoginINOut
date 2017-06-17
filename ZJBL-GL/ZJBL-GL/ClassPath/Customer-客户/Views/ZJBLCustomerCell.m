//
//  ZJBLCustomerCell.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/5/31.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLCustomerCell.h"
#import "ZJBLCustomerModel.h"


@implementation ZJBLCustomerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //图像
        _Icon = [UIImageView new];
        _Icon.image = [UIImage imageNamed:@"placeHolder"];
        _Icon.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
        
        _BgValue = [UILabel new];
        _BgValue.clipsToBounds = YES;
        _BgValue.layer.cornerRadius = 7.5f;
        _BgValue.backgroundColor = [UIColor redColor];
        _BgValue.textColor = [UIColor colorWithHexCode:@"#ffffff"];
        _BgValue.font = JGFont(10);
        _BgValue.textAlignment = NSTextAlignmentCenter;
        
        //标题
        _Title = [UILabel new];
        _Title.textColor = [UIColor colorWithHexCode:@"#0e0e0e"];
        _Title.font = JGFont(13);
        _Title.text = @"中久便利店测试";
        

        
        //时间图像
        _TimeIcon = [UIImageView new];
        _TimeIcon.image = [UIImage imageNamed:@"customer_timer"];
        
        //时间
        _Time = [UILabel new];
        _Time.textColor = [UIColor colorWithHexCode:@"#0e0e0e"];
        _Time.font = JGFont(11);
//        _Time.text = @"08:30-22:00";
        
        //距离
        _Distance = [UILabel new];
        _Distance.textColor = [UIColor colorWithHexCode:@"#0e0e0e"];
        _Distance.font = JGFont(11);
        _Distance.textAlignment = NSTextAlignmentRight;
//        _Distance.text = @"2227m";
        
        
        //信息
        _Info = [UILabel new];
        _Info.textColor = [UIColor colorWithHexCode:@"#999999"];
        _Info.font = JGFont(11);
        _Info.text = @"双十一福利大放送，当天有下单就会哈哈哈哈或";
        
        UIView *Line = [UIView new];
        Line.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
        
        [self.contentView addSubview:_Icon];
        [self.contentView addSubview:_BgValue];
        [self.contentView addSubview:_Title];
        [self.contentView addSubview:_TimeIcon];
        [self.contentView addSubview:_Time];
        [self.contentView addSubview:_Distance];
        [self.contentView addSubview:_Info];
        [self.contentView addSubview:Line];
        
        
        [_Icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(10);
            make.centerY.equalTo(self.mas_centerY);
            make.width.equalTo(@(64));
            make.height.equalTo(@(64));
        }];
        
        [_BgValue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_Icon.mas_right).mas_offset(-2.5);
            make.centerY.equalTo(_Icon.mas_top).mas_offset(2.5);
            make.width.equalTo(@(15));
            make.height.equalTo(@(15));
        }];
        
        [_Title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).mas_offset(9);
            make.left.equalTo(_Icon.mas_right).mas_offset(8);
        }];
        
        
        [_TimeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_Title.mas_bottom).mas_offset(8);
            make.left.equalTo(_Icon.mas_right).mas_offset(8);
            make.width.equalTo(@(16));
            make.height.equalTo(@(16));
        }];
        
        [_Time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_TimeIcon.mas_top);
            make.left.equalTo(_TimeIcon.mas_right).mas_offset(5);
        }];
        
        [_Distance mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).mas_offset(-10);
            make.top.equalTo(_TimeIcon.mas_top);
        }];
        
        
        [_Info mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_TimeIcon.mas_left);
            make.bottom.equalTo(self.mas_bottom).mas_offset(-12);
            make.right.equalTo(self.mas_right).mas_offset(-50);
        }];
        
        [Line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.mas_bottom);
            make.height.equalTo(@(1));
        }];
    }
    return self;
}


- (void)setModel:(ZJBLCustomerModel *)Model {
    _Model = Model;
    

}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
