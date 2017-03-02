//
//  ViewController.h
//  任意搭配
//
//  Created by cnmobi on 2017/3/2.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/// bottomView
@property  UIView *viewTop;


/// 开始拖动点
@property (nonatomic,assign) CGPoint startPoint;
//// 
@property (nonatomic,assign) CGPoint startFramePoint;
@end

