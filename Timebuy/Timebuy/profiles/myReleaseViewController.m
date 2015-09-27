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
#define kDuration 0.4  // 动画持续时间(秒)

@interface myReleaseViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *releasetableview;
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UIView *releaseRootview;
@property (strong, nonatomic) IBOutlet UIView *backView;
#pragma -----------------------tableview的字典数组----------------------------
@property (nonatomic) NSMutableDictionary *dataSourceDic;
@property (nonatomic) NSMutableArray *heightArray;
@property (nonatomic) UISwipeGestureRecognizer *singleTap1;
#pragma -----------------------5个segment的字典数组----------------------------
@property (nonatomic) NSMutableDictionary *ingSourceDic;//进行中
@property (nonatomic) NSMutableDictionary *waitSourceDic;//等待中
@property (nonatomic) NSMutableDictionary *doneSourceDic;//已完成
@property (nonatomic) NSMutableDictionary *complainSourceDic;//申诉中
@property (nonatomic) NSMutableDictionary *cancelSourceDic;//已取消
@end

@implementation myReleaseViewController
- (IBAction)click:(id)sender {
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
    [self.view addSubview:_backView];
    [self.releasetableview reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self createData];
    self.releasetableview.delegate=self;
    self.releasetableview.dataSource=self;
    //设置view的点击手势
    _backView.userInteractionEnabled = YES;
    _singleTap1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    _singleTap1.direction=UISwipeGestureRecognizerDirectionLeft;
    [_backView addGestureRecognizer:_singleTap1];
    // Do any additional setup after loading the view from its nib.
}

#pragma ----------------------------tableview数据初始化--------------------------------
-(void)createData{
    
}
#pragma ----------------------------TableviewDelegate---------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;//self.dataSourceDic.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:self.releasetableview cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier =[NSString stringWithFormat:@"ingCell%ld",indexPath.row];
    UITableViewCell *cell=[[UITableViewCell alloc]init];
    cell.backgroundColor=[UIColor lightGrayColor];
    if(indexPath.row==1)
    {
        //NSString *CellIdentifier =[NSString stringWithFormat:@"ingCell%ld",indexPath.row];
        cell = (ingBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell.contentView.frame = cell.bounds;
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ingBigTableViewCell" owner:self options:nil] lastObject];
        }
        
    }
    else
    {
        cell = (ingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell.contentView.frame = cell.bounds;
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ingTableViewCell" owner:self options:nil] lastObject];
        }
        
    }
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
    cell.backgroundColor=[UIColor whiteColor];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
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