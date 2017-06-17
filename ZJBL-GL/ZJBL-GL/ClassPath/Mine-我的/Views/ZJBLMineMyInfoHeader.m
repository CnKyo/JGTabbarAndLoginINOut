//
//  ZJBLMineMyInfoHeader.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/6/1.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLMineMyInfoHeader.h"

@implementation ZJBLMineMyInfoHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        //头像文字
        UILabel *iconLbl = [[UILabel alloc] init];
        iconLbl.text = @"头像";
        iconLbl.font = JGFont(14);
        iconLbl.textColor = [UIColor colorWithHexCode:@"#333333"];
        
        
        //最右侧的箭头
        UIImageView *imgV = [[UIImageView alloc] init];
        //    imgV.image = [UIImage imageNamed:@"my_info_arrow_right"];
        
        
        //用户头像
        UIImageView *headImgV = [[UIImageView alloc] init];
        headImgV.clipsToBounds = YES;
        headImgV.layer.cornerRadius = 32.0f;
        headImgV.image = [UIImage imageNamed:@"placeHolder"];

        
//        NSString *urlStr = [NSString stringWithFormat:@"%@%@",HTTPBaseIconUrl,[JGCommonTools getUserDefaultsWithKey:@"headImg"]];
        
//        [headImgV sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage circleImage:@"mine_userIcon"]];
        
        
        //底部线
        UIView *bottomLine = [[UIView alloc] init];
        bottomLine.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
        
        
        
        [self addSubview:iconLbl];
        [self addSubview:imgV];
        [self addSubview:headImgV];
        [self addSubview:bottomLine];
        
        
        
        [iconLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(12);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self).offset(-5);
            make.width.equalTo(@(14));
            make.height.equalTo(@(14));
            make.centerY.equalTo(self);
        }];
        
        [headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(imgV.mas_left).offset(-6);
            make.width.equalTo(@(64));
            make.height.equalTo(@(64));
            make.centerY.equalTo(self);
            
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

@end
