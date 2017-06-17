//
//  ZJBLMineHeaderView.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/6/1.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLMineHeaderView.h"

@implementation ZJBLMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
      
        self.backgroundColor = [UIColor whiteColor];
        
        _Icon = [UIImageView new];
        _Icon.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
        _Icon.image = [UIImage imageNamed:@"placeHolder"];
        _Icon.clipsToBounds = YES;
        _Icon.layer.cornerRadius = 27.0;
        _Icon.userInteractionEnabled = YES;
        
        _Name = [UILabel new];
        _Name.textColor = [UIColor colorWithHexCode:@"#0e0e0e"];
        _Name.text = @"张三";
        _Name.font = JGFont(13);
        
        
        _Phone = [UILabel new];
        _Phone.textColor = [UIColor colorWithHexCode:@"#0e0e0e"];
        _Phone.text = @"15667678878";
        _Phone.font = JGFont(13);
        
        
        [self addSubview:_Icon];
        [self addSubview:_Name];
        [self addSubview:_Phone];
        
        [_Icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.mas_top).mas_offset(20);
            make.height.equalTo(@(54));
            make.width.equalTo(@(54));
        }];
        
        [_Name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_Icon.mas_bottom).mas_offset(7);
            make.centerX.equalTo(self.mas_centerX);
        }];
        
        [_Phone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_Name.mas_bottom).mas_offset(7);
            make.centerX.equalTo(self.mas_centerX);
        }];
        
    }
    return self;
}



@end
