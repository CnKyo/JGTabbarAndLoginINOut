//
//  ZJBLMineMyInfoCell.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/6/1.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLMineMyInfoCell.h"

@implementation ZJBLMineMyInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _Info_Class = [[UILabel alloc] init];
        //        _Info_Class.text = @"用户名";
        _Info_Class.textColor = [UIColor colorWithHexCode:@"#0e0e0e"];
        _Info_Class.font = JGFont(13);
        
        
        //最右侧的箭头
        _Arrow_Img = [[UIImageView alloc] init];
        //        imgV.image = [UIImage imageNamed:@"my_info_arrow_right"];
        
        _Info_Name = [[UILabel alloc] init];
        _Info_Name.textColor = [UIColor colorWithHexCode:@"#808080"];
        _Info_Name.font = JGFont(12);
        
        //底部线
        UIView *bottomLine = [[UIView alloc] init];
        bottomLine.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
        
        [self.contentView addSubview:_Info_Class];
        [self.contentView addSubview:_Arrow_Img];
        [self.contentView addSubview:_Info_Name];
        [self.contentView addSubview:bottomLine];
        
        
        [_Info_Class mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(12);
            make.top.equalTo(self);
            make.bottom.equalTo(self).offset(-1);
        }];
        
        
        [_Arrow_Img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-5);
            make.width.equalTo(@(14));
            make.height.equalTo(@(14));
            make.centerY.equalTo(self);
        }];
        
        [_Info_Name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_Arrow_Img.mas_left).offset(-6);
            make.top.equalTo(self);
            make.bottom.equalTo(self).offset(-1);
        }];
        
        [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(12);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.equalTo(@(1));
        }];
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
