//
//  ZJBLWarehouseHeader.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/6/1.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLWarehouseHeader.h"

@implementation ZJBLWarehouseHeader

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        //背景
        _bgV = [UIImageView new];
        _bgV.image = [UIImage imageNamed:@"warhouse_title_bg"];

        //头像
        
        
        
        [self addSubview:_bgV];
  
        
        [_bgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
        }];
        
        
    }
    return self;
}

@end
