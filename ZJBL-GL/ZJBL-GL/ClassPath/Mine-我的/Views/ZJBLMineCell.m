//
//  ZJBLMineCell.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/6/1.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLMineCell.h"

@implementation ZJBLMineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundColor = [UIColor colorWithHexCode:@"#ffffff"];
        UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
        bgView.backgroundColor = [UIColor colorWithHexCode:@"#dedede"];
        self.selectedBackgroundView = bgView;
        
        _iconImgV = [UIImageView new];
        
        
        _titleLbl = [UILabel new];
        _titleLbl.textColor = [UIColor colorWithHexCode:@"#3333"];
        _titleLbl.textAlignment = NSTextAlignmentLeft;
        _titleLbl.font = JGFont(15);
        
        [self addSubview:_iconImgV];
        [self addSubview:_titleLbl];
        
        
        [_iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(12);
            make.centerY.equalTo(self.mas_centerY);
            make.height.equalTo(@(19));
            make.width.equalTo(@(19));
        }];
        
        
        [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_iconImgV.mas_right).mas_offset(10);
            make.centerY.equalTo(self.mas_centerY);
        }];
        
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
