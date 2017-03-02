//
//  bottomView.m
//  任意搭配
//
//  Created by cnmobi on 2017/3/2.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "bottomView.h"

@implementation bottomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)btnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (self.clickBtnBlock) {
        self.clickBtnBlock(sender.selected);
    }
}


#pragma mark - ====================Delegate====================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selectPictrueBlock) {
        self.selectPictrueBlock(indexPath.row);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELLID"];
    
    if (!cell) cell = [tableView dequeueReusableCellWithIdentifier:@"CELLDI"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"我是%ld",(long)indexPath.row];
    return cell;
}

@end
