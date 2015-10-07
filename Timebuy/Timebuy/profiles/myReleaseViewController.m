//
//  myReleaseViewController.m
//  Timebuy
//
//  Created by yuweize on 15/9/25.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "myReleaseViewController.h"
#import "waitTableViewCell.h"
#import "waitBigTableViewCell.h"
#import "ingTableViewCell.h"
#import "ingBigTableViewCell.h"
#import "doneTableViewCell.h"
#import "doneBigTableViewCell.h"
#import "complainTableViewCell.h"
#import "cancelBigTableViewCell.h"
#import "cancelTableViewCell.h"
#import "complainDetailViewController.h"
#import "waitingDetailViewController.h"
#import "doneDetailViewController.h"
#import "ingDetailViewController.h"
#define kDuration 0.4  // 动画持续时间(秒)

@interface myReleaseViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *releasetableview;
@property (strong, nonatomic) IBOutlet UIView *releaseRootview;
@property (strong, nonatomic) IBOutlet UIView *backView;
@property (strong, nonatomic) IBOutlet UIButton *button0;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) IBOutlet UIButton *button5;
@property (nonatomic) NSArray *lightArray;
@property (strong, nonatomic) IBOutlet UIImageView *light0;
@property (strong, nonatomic) IBOutlet UIImageView *light1;
@property (strong, nonatomic) IBOutlet UIImageView *light2;
@property (strong, nonatomic) IBOutlet UIImageView *light3;
@property (strong, nonatomic) IBOutlet UIImageView *light4;
@property (nonatomic) UISwipeGestureRecognizer *rightTap;
@property (nonatomic) UISwipeGestureRecognizer *leftTap;
@property (nonatomic) NSInteger pageTag;
#pragma -----------------------tableview的字典数组----------------------------
@property (nonatomic) NSMutableDictionary *dataSourceDic;
#pragma -----------------------5个segment的字典数组----------------------------
@property (nonatomic) NSMutableDictionary *ingSourceDic;//进行中
@property (nonatomic) NSMutableDictionary *waitSourceDic;//等待中
@property (nonatomic) NSMutableDictionary *doneSourceDic;//已完成
@property (nonatomic) NSMutableDictionary *complainSourceDic;//申诉中
@property (nonatomic) NSMutableDictionary *cancelSourceDic;//已取消
@end

@implementation myReleaseViewController
#pragma ----------------------------tableview数据初始化--------------------------------
-(void)createData:(NSInteger) buttonTag{
    
}
#pragma ----------------------------segment 图标移动----------------------------------
-(void) showlight{
    int i=0;
    for(UIImageView *object in _lightArray)
    {
        if(_pageTag==i)
        {
            object.hidden=false;
            i++;
            continue;
        }
        object.hidden=true;
        i++;
    }
}
#pragma ----------------------------segment click------------------------------------
-(IBAction)buttonClick:(id)sender{
    UIButton *button = (UIButton *)sender;
    NSInteger tag = button.tag;
    if(tag==_pageTag)
    {
        return;
    }
    switch (tag) {
        case 1:
            [self createData:tag];
            break;
        case 2:
            [self createData:tag];
            break;
        case 3:
            [self createData:tag];
            break;
        case 4:
            [self createData:tag];
            break;
        case 5:
            [self createData:tag];
            break;
    }
}
#pragma -----------------------------手势左右移动------------------------------------
-(void)right{
    _pageTag++;
    NSLog(@"%ld",(long)_pageTag);
    if(_pageTag>4)
    {
        _pageTag--;
        return;
    }
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromRight;
    [[self.backView layer] addAnimation:animation forKey:@"animation"];
    [UIView setAnimationDelegate:self];
    // 动画完毕后调用某个方法
    //[UIView setAnimationDidStopSelector:@selector(animationFinished:)];
    [UIView commitAnimations];
    //[_backView addGestureRecognizer:_singleTap1];
    [self showlight];

    [self.view addSubview:_backView];
    [self.releasetableview reloadData];
}
-(void)left{
    _pageTag--;
    NSLog(@"%ld",(long)_pageTag);
    if(_pageTag<0)
    {
        _pageTag++;
        return;
    }
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromLeft;
    [[self.backView layer] addAnimation:animation forKey:@"animation"];
    [UIView setAnimationDelegate:self];
    // 动画完毕后调用某个方法
    //[UIView setAnimationDidStopSelector:@selector(animationFinished:)];
    [UIView commitAnimations];
    [self showlight];
    [self.view addSubview:_backView];
    [self.releasetableview reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    for (UIView *v in self.tabBarController.view.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            v.hidden = YES;
        }
    }
    
    self.tabBarController.tabBar.hidden = YES;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    for (UIView *v in self.tabBarController.view.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            v.hidden = NO;
        }
    }
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self createData];
    self.title=@"我的发布";
    _pageTag=0;
    _lightArray=[[NSArray alloc]initWithObjects:_light0,_light1,_light2,_light3,_light4, nil];
    [self showlight];
    self.releasetableview.delegate=self;
    self.releasetableview.dataSource=self;
    //设置view的点击手势
    _backView.userInteractionEnabled = YES;
    _rightTap = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(right)];
    _rightTap.direction=UISwipeGestureRecognizerDirectionLeft;
    [_backView addGestureRecognizer:_rightTap];
    _leftTap = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(left)];
    _leftTap.direction=UISwipeGestureRecognizerDirectionRight;
    [_backView addGestureRecognizer:_leftTap];
 
    // Do any additional setup after loading the view from its nib.
}
#pragma ----------------------------TableviewDelegate---------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;//self.dataSourceDic.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:self.releasetableview cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_pageTag==0)
    {
        waitingDetailViewController *vc=[[waitingDetailViewController alloc]init];
        [self.navigationController pushViewController:vc animated:true];
    }
    else if(_pageTag==1)
    {
        ingDetailViewController *vc=[[ingDetailViewController alloc]init];
        [self.navigationController pushViewController:vc animated:true];

    }
    else if(_pageTag==2)
    {
        doneDetailViewController *vc=[[doneDetailViewController alloc]init];
        [self.navigationController pushViewController:vc animated:true];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier =[NSString stringWithFormat:@"ingCell%ld",(long)indexPath.row];
    if(indexPath.row==1)
    {
        //NSString *CellIdentifier =[NSString stringWithFormat:@"ingCell%ld",indexPath.row];
        ingBigTableViewCell *imgcell = (ingBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (imgcell == nil) {
            imgcell.contentView.frame = imgcell.bounds;
            imgcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            
            imgcell = [[[NSBundle mainBundle] loadNibNamed:@"ingBigTableViewCell" owner:self options:nil] lastObject];
        }
        [imgcell setAccessoryType:UITableViewCellAccessoryNone];
        [imgcell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return imgcell;
        //cell=imgcell;
    }
    else
    {
        __weak typeof(self) weakSelf = self;
        ingTableViewCell *imgcell = (ingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (imgcell == nil) {
            imgcell.contentView.frame = imgcell.bounds;
            imgcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            imgcell = [[[NSBundle mainBundle] loadNibNamed:@"ingTableViewCell" owner:self options:nil] lastObject];
        }
        imgcell.commitBlock=^{
            NSLog(@"commit block");
            complainDetailViewController *vc=[[complainDetailViewController alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:true];
        };
        [imgcell setAccessoryType:UITableViewCellAccessoryNone];
        [imgcell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return imgcell;
        //cell=imgcell;
    }
//    [cell setAccessoryType:UITableViewCellAccessoryNone];
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    return cell;
    //UITableViewCell *cell=[[UITableViewCell alloc]init];

#pragma -----------------------------进行中界面-初始化--------------------------------
    /*if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"0"])
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"ingCell%ld",indexPath.row];
        if([self.dataSourceDic objectForKey:@"pics"])
        {
            ingBigTableViewCell *cell = (ingBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ingBigTableViewCell" owner:self options:nil] lastObject];
            }
          //  [cell setData:self.dataSourceDic];
        }
        else
        {
            ingTableViewCell *cell = (ingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ingTableViewCell" owner:self options:nil] lastObject];
            }
        }
        //  [cell setData:self.dataSourceDic];
    }
#pragma -----------------------------等待中界面-初始化--------------------------------
    if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"1"])
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"waitCell%ld",indexPath.row];
        if([self.dataSourceDic objectForKey:@"pics"])
        {
            waitBigTableViewCell *cell = (waitBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"waitBigTableViewCell" owner:self options:nil] lastObject];
            }
            //[cell setData:self.dataSourceDic];
        }
        else
        {
            waitTableViewCell *cell = (waitTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"waitTableViewCell" owner:self options:nil] lastObject];
            }
        }
        //  [cell setData:self.dataSourceDic];
    }
#pragma -----------------------------已完成界面-初始化--------------------------------
    if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"2"])
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"dongCell%ld",indexPath.row];
        if([self.dataSourceDic objectForKey:@"pics"])
        {
            doneBigTableViewCell *cell = (doneBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"doneBigTableViewCell" owner:self options:nil] lastObject];
            }
            //[cell setData:self.dataSourceDic];
        }
        else
        {
            doneTableViewCell *cell = (doneTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"doneTableViewCell" owner:self options:nil] lastObject];
            }
        }
        //  [cell setData:self.dataSourceDic];
    }
#pragma -----------------------------申诉中界面-初始化--------------------------------
    if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"3"])
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"complainCell%ld",indexPath.row];
        complainTableViewCell *cell = (complainTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
        cell.contentView.frame = cell.bounds;
        cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        cell = [[[NSBundle mainBundle] loadNibNamed:@"complainTableViewCell" owner:self options:nil] lastObject];
        }
        //[cell setData:self.dataSourceDic];

    }
#pragma -----------------------------已取消界面-初始化--------------------------------
    if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"4"])
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"cancelCell%ld",indexPath.row];
        if([self.dataSourceDic objectForKey:@"pics"])
        {
            cancelBigTableViewCell *cell = (cancelBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"cancelBigTableViewCell" owner:self options:nil] lastObject];
            }
          //  [cell setData:self.dataSourceDic];
        }
        else
        {
            cancelTableViewCell *cell = (cancelTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"cancelTableViewCell" owner:self options:nil] lastObject];
            }
            //  [cell setData:self.dataSourceDic];
        }
    }
*/
    // Configure the cell.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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