//
//  newsRootViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/9/22.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "newsRootViewController.h"
#import "OrderController.h"
#import "SystemMessageController.h"
#import "ActivityController.h"

@interface newsRootViewController ()<UIScrollViewDelegate>
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *BtnWidth;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation newsRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSNumber *number = [NSNumber numberWithFloat:[UIScreen mainScreen].bounds.size.width / 3];
//    self.BtnWidth = [UIScreen mainScreen].bounds.size.width / 3;
   
    self.scrollView.delegate = self;
    CGFloat contentX = [UIScreen mainScreen].bounds.size.width * 3;
    self.scrollView.contentSize = CGSizeMake(contentX, 0);
    self.scrollView.pagingEnabled = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addControllers];
    OrderController *VC = self.childViewControllers[0];
    VC.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:VC.view];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.btn1.selected = YES;
    // Do any additional setup after loading the view from its nib.
}
- (void)addControllers {
  
  
        OrderController *vc = [[OrderController alloc] init];
        [self addChildViewController:vc];
        SystemMessageController *vc1 = [[SystemMessageController alloc] init];
        [self addChildViewController:vc1];
        ActivityController *vc2 = [[ActivityController alloc] init];
       [self addChildViewController:vc2];
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSUInteger index = scrollView.contentOffset.x / self.scrollView.frame.size.width;
    if (index == 1) {
        SystemMessageController *VC = self.childViewControllers[1];
        self.btn1.selected = NO;

        self.btn2.selected = YES;
        
        self.btn3.selected = NO;
        VC.view.frame = scrollView.bounds;
        [self.scrollView addSubview:VC.view];


    }else if (index == 2){
        ActivityController *VC = self.childViewControllers[2];
        VC.view.frame = scrollView.bounds;
        [self.scrollView addSubview:VC.view];
        self.btn1.selected = NO;
        
        self.btn2.selected = NO;
        
        self.btn3.selected = YES;
    }
    else{
        self.btn1.selected = YES;
        
        self.btn2.selected = NO;
        
        self.btn3.selected = NO;
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
