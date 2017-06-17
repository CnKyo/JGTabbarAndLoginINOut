//
//  ZJBLHttpBaseModel.m
//  ZJBL-GL
//
//  Created by 郭军 on 2017/5/31.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "ZJBLHttpBaseModel.h"

@implementation ZJBLHttpBaseModel

- (instancetype)initWithObject:(id)object
{
    self = [super init];
    if (self) {
        self.resultCode    = [[object valueForKey:@"resultCode"] integerValue];
        self.resultMessage = [object valueForKey:@"resultMessage"];
        self.data          = [object valueForKey:@"data"];
    }
    return self;
}


@end
