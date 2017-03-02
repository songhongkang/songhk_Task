//
//  View_Operating.m
//  任意搭配
//
//  Created by cnmobi on 2017/3/2.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "View_Operating.h"

@implementation View_Operating

- (IBAction)btnClick:(UIButton *)sender
{
    if (sender.tag - 100 == 0) {
        if (self.selectBtnClickBlock) {
            self.selectBtnClickBlock(sender.tag);
        }
    }else{
        if (self.selectAddBlock) {
            self.selectAddBlock(sender.tag);
        }
    }

}
@end
