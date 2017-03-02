//
//  MD_BigPicture.h
//  任意搭配
//
//  Created by cnmobi on 2017/3/2.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD_BigPicture : NSObject

/// 保存每一步的操作
@property NSMutableArray *arraySaveOneStepOprete;

///
@property NSInteger indexNum;

/// tag
@property NSInteger tagNum;

/// 是否选中
@property BOOL isSelect;
@end
