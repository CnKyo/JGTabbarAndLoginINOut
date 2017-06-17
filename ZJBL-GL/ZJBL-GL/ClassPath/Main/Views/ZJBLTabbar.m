//
//  ZJBLTabbar.m
//  ZJBL-SJ
//
//  Created by 郭军 on 2017/5/8.
//  Copyright © 2017年 ZJNY. All rights reserved.
//

#import "ZJBLTabbar.h"

@implementation ZJBLTabbar {
    ZJBLTabbarButton *_selectedBarButton;
    
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addBarButtons];
    }
    return self;
}

-(void) addBarButtons{
    
    
    NSArray *titlesArr = @[@"客户",@"排程",@"仓库",@"物流",@"我的"];
    NSArray *normalImage = @[@"Customer_normal" ,@"Scheduling_normal" ,@"Warehouse_normal" ,@"Logistics_normal" ,@"Mine_normal" ];
    NSArray *selectedImage = @[@"Customer_selected" ,@"Scheduling_selected" ,@"Warehouse_selected" ,@"Logistics_selected" ,@"Mine_selectes" ];
    
    
    
    for (int i = 0 ; i<titlesArr.count ; i++) {
        ZJBLTabbarButton *btn = [[ZJBLTabbarButton alloc] init];
        CGFloat btnW = self.frame.size.width/5;
        CGFloat btnX = i * btnW;
        CGFloat btnY = 0;
        CGFloat btnH = self.frame.size.height;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        NSString *imageName = [NSString stringWithFormat:@"%@",normalImage[i]];
        NSString *selImageName = [NSString stringWithFormat:@"%@",selectedImage[i]];
        NSString *title = titlesArr[i];
        
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
        btn.tag = i;
        
        
        if (i!=2) {
            [btn setTitle:title forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize: 11.0];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [btn setTitleColor:JGMainColor forState:UIControlStateSelected];
            [btn setTitleColor:JGRGBColor(128, 128, 128) forState:UIControlStateNormal];
            [self addSubview:btn];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        }
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        //        [self addSubview:btn];
        
        if(i == 0){
            [self btnClick:btn];
        }
    }
}


-(void) btnClick:(ZJBLTabbarButton *)button{
    
    
    [self.delegate changeNav:_selectedBarButton.tag to:button.tag andBtn:button];
    _selectedBarButton.selected = NO;
    button.selected = YES;
    _selectedBarButton = button;
    
    
}

@end
