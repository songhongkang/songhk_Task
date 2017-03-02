//
//  View_Operating.h
//  任意搭配
//
//  Created by cnmobi on 2017/3/2.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View_Operating : UIView

@property (nonatomic, copy) void(^selectBtnClickBlock)(NSInteger );

@property (nonatomic, copy) void(^selectAddBlock)(NSInteger );

@end
