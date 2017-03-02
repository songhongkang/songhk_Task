//
//  bottomView.h
//  任意搭配
//
//  Created by cnmobi on 2017/3/2.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface bottomView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) void(^clickBtnBlock)(BOOL );
@property (nonatomic, copy) void(^selectPictrueBlock)(NSInteger );

@property IBOutlet UITableView *tableView_List;

@end
