//
//  ViewController.m
//  任意搭配
//
//  Created by cnmobi on 2017/3/2.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "ViewController.h"
#import "bottomView.h"
#import "MD_Picture.h"
#import "View_Operating.h"
#import "MD_BigPicture.h"
#import "BigBigModel.h"



//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()
{
    MD_Picture *model;
    BOOL dragEnable;
    
    /// 把说有的模型放到数组中去
    NSMutableArray *arraySave;
    MD_BigPicture *bigModel;
    BigBigModel *bigbigModel;

    /// 最后一次点击
    NSInteger kkkk;
    /// 重新拖动
    NSInteger again;
    /// 移动到那个数组的第几个元素了
    NSInteger jjjjj;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    again = 0;
    bigbigModel = [[BigBigModel alloc] init];
    
    arraySave = [NSMutableArray array];
    [self createBottomView];
}


- (void)createBottomView
{
    self.viewTop= [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , SCREEN_HEIGHT - 100)];
    View_Operating *viewBottom = [[NSBundle mainBundle]loadNibNamed:@"View" owner:self options:nil].lastObject;
    
    viewBottom.selectBtnClickBlock =^(NSInteger row)
    {
        
        for (MD_BigPicture *model10 in bigbigModel.arraySaveMD) {
//            NSLog(@"===============%ld",model10.tagNum);
            if (model10.tagNum == kkkk) {
//                NSLog(@"%@",model10.arraySaveOneStepOprete);
                NSLog(@"===============%ld",model10.indexNum -again - 1);
                if (model10.indexNum -again - 1 > 0  ) {
                    again ++ ;
                    UIButton *btn = [self.view viewWithTag:model10.tagNum];
                    MD_Picture *model1111 =
                    model10.arraySaveOneStepOprete[model10.indexNum - again -1];
                    btn.center = CGPointMake([[model1111.centerPosition componentsSeparatedByString:@","][0] floatValue], [[model1111.centerPosition componentsSeparatedByString:@","][1] floatValue]);
                    
                    jjjjj = model10.indexNum  - again -1;
                    NSLog(@"===============%ld",jjjjj);
                }
            }
        }
    };
    
    
    
    viewBottom.frame = CGRectMake(0, SCREEN_HEIGHT - 100 - 50, SCREEN_WIDTH, 50);
    bottomView *view = [[NSBundle mainBundle]loadNibNamed:@"View" owner:self options:nil].firstObject;
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:self.viewTop];
    [self.view addSubview:view];
    [self.viewTop addSubview:viewBottom];

    
    view.clickBtnBlock = ^(BOOL isClickTop)
    {
        if (isClickTop) {
            [self.navigationController setNavigationBarHidden:YES animated:YES];
            [UIView animateWithDuration:0.2 animations:^{
                view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            }];
        }
        else{
            [self.navigationController setNavigationBarHidden:NO animated:YES];
            [UIView animateWithDuration:0.2 animations:^{
                view.frame = CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, SCREEN_HEIGHT);
            }];
        }
    };
    view.selectPictrueBlock =^(NSInteger row)
    {
        model = [[MD_Picture alloc] init];
        dragEnable = NO;
//        [bigModel.arraySaveMD addObject:model];
        bigModel = [[MD_BigPicture alloc] init];
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        btn.center = self.viewTop.center;
        [btn setBackgroundImage :[UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)row]] forState:UIControlStateNormal];
        [self.viewTop addSubview:btn];
        btn.tag = 1000 + row;
//        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        //添加移动手势可以拖动
        UIPanGestureRecognizer *_panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragAction:)];
        _panGestureRecognizer.minimumNumberOfTouches = 1;
        _panGestureRecognizer.maximumNumberOfTouches = 1;
        btn.userInteractionEnabled = YES;
        [btn addGestureRecognizer:_panGestureRecognizer];
        model.pictureURL = [NSString stringWithFormat:@"%ld",row];
        model.mark = btn.tag;
        model.width = 80;
        model.height = 80;
        model.centerPosition = [NSString stringWithFormat:@"%lf,%lf",self.viewTop.center.x,self.viewTop.center.y];
        NSLog(@"===============%lf,=====%lf",self.viewTop.center.x,self.viewTop.center.y);
        [bigModel.arraySaveOneStepOprete addObject:model];
        bigModel.tagNum = btn.tag;
        [bigbigModel.arraySaveMD addObject:bigModel];
    };
}

#pragma mark - ====================BtnClick====================

-(void)dragAction:(UIPanGestureRecognizer *)pan{
//    pan.view.tag;
    
    NSLog(@"tag -------%ld",pan.view.tag);
    UIView *draggableObj = [self.view viewWithTag:pan.view.tag];
    kkkk = pan.view.tag;
    if (pan.state == UIGestureRecognizerStateChanged) {
        //注意，这里取得的参照坐标系是该对象的上层View的坐标。
        CGPoint offset = [pan translationInView:self.viewTop];
        //通过计算偏移量来设定draggableObj的新坐标
        [draggableObj setCenter:CGPointMake(draggableObj.center.x + offset.x, draggableObj.center.y + offset.y)];
        //初始化sender中的坐标位置。如果不初始化，移动坐标会一直积累起来。
        [pan setTranslation:CGPointMake(0, 0) inView:self.viewTop];
    }
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        model = [[MD_Picture alloc] init];
        model.mark  = pan.view.tag;
        model.centerPosition = [NSString stringWithFormat:@"%lf,%lf",draggableObj.center.x,draggableObj.center.y];
        
        [bigModel.arraySaveOneStepOprete addObject:model];
        bigModel.indexNum = bigModel.arraySaveOneStepOprete.count;
        bigModel.isSelect = YES;
        again = 0;
    }
}

- (void)btnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    dragEnable = sender.selected;
    if (sender.selected) {
        sender.layer.borderWidth =1;
        sender.layer.borderColor = [UIColor redColor].CGColor;
    }else{
        sender.layer.borderColor =0 ;
        sender.layer.borderColor = [UIColor clearColor].CGColor;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
