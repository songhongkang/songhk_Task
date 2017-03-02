//
//  MD_Picture.h
//  任意搭配
//
//  Created by cnmobi on 2017/3/2.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD_Picture : NSObject
/// 图片URl
@property NSString *pictureURL;
/// 旋转角度
@property NSString *rotationAngle;
/// 中心点坐标
@property NSString *centerPosition;
/// 宽
@property float  width;
/// 高
@property float height;
/// 标记是那个图片
@property NSInteger mark;
/// 是否选中
@property BOOL isSelect;


@end
