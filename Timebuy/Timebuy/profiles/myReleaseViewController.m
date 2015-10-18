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
#import "HMSegmentedControl.h"
#define kDuration 0.4  // 动画持续时间(秒)

@interface myReleaseViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) HMSegmentedControl *segmentedControl4;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic) UITableView *tableview1;
@property (nonatomic) UITableView *tableview2;
@property (nonatomic) UITableView *tableview3;
@property (nonatomic) UITableView *tableview4;
@property (nonatomic) UITableView *tableview5;
@property (nonatomic) NSInteger pageTag;
#pragma -----------------------tableview的字典数组----------------------------
@property (nonatomic) NSMutableDictionary *dataSourceDic;
@end

@implementation myReleaseViewController
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
    _pageTag=0;
    self.title=@"我的发布";
#pragma -----------------------------segment设置------------------------------------------------
    CGFloat viewWidth = CGRectGetWidth([UIScreen mainScreen].applicationFrame);
    self.segmentedControl4 = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 2, viewWidth, 30)];
    self.segmentedControl4.sectionTitles = @[@"等待中", @"在进行", @"已完成",@"申诉中",@"已取消"];
    self.segmentedControl4.selectedSegmentIndex = 0;
    self.segmentedControl4.backgroundColor = [UIColor whiteColor];
    UIFont* font = [UIFont fontWithName:@"Arial-ItalicMT" size:14.0];
    self.segmentedControl4.titleTextAttributes = @{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor]};
    self.segmentedControl4.selectionIndicatorHeight = 4.0f;
    self.segmentedControl4.selectionIndicatorColor = [UIColor colorWithRed:12.0 / 255.0f green:228.0 / 255.0f blue:225.0 / 255.0f alpha:1];
    self.segmentedControl4.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentedControl4.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
#pragma -----------------------------scrollview设置------------------------------------------
    self.segmentedControl4.tag = 5;
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl4 setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(viewWidth * index, 0, viewWidth, self.view.frame.size.height-90) animated:YES];
    }];
    [self.view addSubview:self.segmentedControl4];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 32, viewWidth, self.view.frame.size.height-60)];
    self.scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(viewWidth * 5, self.view.frame.size.height-60);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, viewWidth, self.view.frame.size.height-60) animated:YES];
    [self.view addSubview:self.scrollView];
#pragma ------------------------------scrollview内容添加------------------------------------
    self.tableview1=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, viewWidth, self.view.frame.size.height-60)];
    [self setApperanceForTableview:_tableview1];
    [self.scrollView addSubview:_tableview1];
    
    self.tableview2=[[UITableView alloc]initWithFrame:CGRectMake(viewWidth, 0, viewWidth, self.view.frame.size.height-60)];
    [self setApperanceForTableview:_tableview2];
    [self.scrollView addSubview:_tableview2];
    
    self.tableview3=[[UITableView alloc]initWithFrame:CGRectMake(viewWidth*2, 0, viewWidth, self.view.frame.size.height-60)];
    [self setApperanceForTableview:_tableview3];
    [self.scrollView addSubview:_tableview3];
    
    self.tableview4=[[UITableView alloc]initWithFrame:CGRectMake(viewWidth*3, 0, viewWidth, self.view.frame.size.height-60)];
    [self setApperanceForTableview:_tableview4];
    [self.scrollView addSubview:_tableview4];
    
    self.tableview5=[[UITableView alloc]initWithFrame:CGRectMake(viewWidth*4, 0, viewWidth, self.view.frame.size.height-60)];
    [self setApperanceForTableview:_tableview5];
    [self.scrollView addSubview:_tableview5];
    //自定义返回按钮
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"箭头9x17px"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem  = backButton;
    // Do any additional setup after loading the view from its nib.
}
- (void)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setApperanceForTableview:(UITableView *)tableview {
    [tableview setRowHeight:106];
    [tableview setSectionHeaderHeight:6];
    [tableview setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableview setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    tableview.delegate=self;
    tableview.dataSource=self;
    [tableview reloadData];
}
#pragma ----------------------------TableviewDelegate---------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;//self.dataSourceDic.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[UITableViewCell alloc];
    if(_pageTag==0)
    {
        cell = [self tableView:self.tableview1 cellForRowAtIndexPath:indexPath];
    }
    else if(_pageTag==1)
    {
        cell = [self tableView:self.tableview2 cellForRowAtIndexPath:indexPath];
    }
    else if(_pageTag==2)
    {
        cell = [self tableView:self.tableview3 cellForRowAtIndexPath:indexPath];
    }
    else if(_pageTag==3)
    {
        cell = [self tableView:self.tableview4 cellForRowAtIndexPath:indexPath];
    }
    else if(_pageTag==4)
    {
        cell = [self tableView:self.tableview5 cellForRowAtIndexPath:indexPath];
    }
    return cell.frame.size.height;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 6)];
    UIImageView *sanjiao=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-31*5)/10+(_pageTag*(self.view.frame.size.width/5))+17-5, 0, 10, 6)];
    [sanjiao setImage:[UIImage imageNamed:@"sanjiao.png"]];
    [view addSubview:sanjiao];
    return view;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]init];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if(indexPath.row==0)
    {
        if(_pageTag==0)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"waitimageCell%ld",(long)indexPath.row];
            waitBigTableViewCell *waitcell = (waitBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (waitcell == nil) {
                waitcell.contentView.frame = waitcell.bounds;
                waitcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                waitcell = [[[NSBundle mainBundle] loadNibNamed:@"waitBigTableViewCell" owner:self options:nil] lastObject];
            }
            cell=waitcell;
        }
        else if(_pageTag==1)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"ingimageCell%ld",(long)indexPath.row];
            ingBigTableViewCell *ingcell = (ingBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            __weak typeof(self) weakSelf = self;
            if (ingcell == nil) {
                ingcell.contentView.frame = ingcell.bounds;
                ingcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                ingcell = [[[NSBundle mainBundle] loadNibNamed:@"ingBigTableViewCell" owner:self options:nil] lastObject];
            }
            ingcell.commitBlock=^{
                NSLog(@"commit block");
                complainDetailViewController *vc=[[complainDetailViewController alloc]init];
                [weakSelf.navigationController pushViewController:vc animated:true];
            };
            cell=ingcell;
        }
        else if(_pageTag==2)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"doneimageCell%ld",(long)indexPath.row];
            doneBigTableViewCell *donecell = (doneBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (donecell == nil) {
                donecell.contentView.frame = donecell.bounds;
                donecell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                donecell = [[[NSBundle mainBundle] loadNibNamed:@"doneBigTableViewCell" owner:self options:nil] lastObject];
            }
            cell=donecell;
        }
        else if(_pageTag==3)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"complainCell%ld",(long)indexPath.row];
            complainTableViewCell *comcell = (complainTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (comcell == nil) {
                comcell.contentView.frame = comcell.bounds;
                comcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                comcell = [[[NSBundle mainBundle] loadNibNamed:@"complainTableViewCell" owner:self options:nil] lastObject];
            }
            cell=comcell;
        }
        else if(_pageTag==4)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"cancelimageCell%ld",(long)indexPath.row];
            cancelBigTableViewCell *cancelcell = (cancelBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cancelcell == nil) {
                cancelcell.contentView.frame = cancelcell.bounds;
                cancelcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cancelcell = [[[NSBundle mainBundle] loadNibNamed:@"cancelBigTableViewCell" owner:self options:nil] lastObject];
            }
            cell=cancelcell;
        }
    }
    else
    {
#pragma -----------------------------进行中界面-初始化--------------------------------
    //if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"1"])
        if(_pageTag==1){
            NSString *CellIdentifier =[NSString stringWithFormat:@"ingCell%ld",(long)indexPath.row];
            __weak typeof(self) weakSelf = self;
            if([self.dataSourceDic objectForKey:@"pics"])
            {
                ingBigTableViewCell *ingcell = (ingBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (ingcell == nil) {
                    ingcell.contentView.frame = ingcell.bounds;
                    ingcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    ingcell = [[[NSBundle mainBundle] loadNibNamed:@"ingBigTableViewCell" owner:self options:nil] lastObject];
                }
                ingcell.commitBlock=^{
                    NSLog(@"commit block");
                    complainDetailViewController *vc=[[complainDetailViewController alloc]init];
                    [weakSelf.navigationController pushViewController:vc animated:true];
                };
                cell=ingcell;
              //  [cell setData:self.dataSourceDic];
            }
            else
            {
                ingTableViewCell *ingcell = (ingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (ingcell == nil) {
                    ingcell.contentView.frame = ingcell.bounds;
                    ingcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    ingcell = [[[NSBundle mainBundle] loadNibNamed:@"ingTableViewCell" owner:self options:nil] lastObject];
                }
                ingcell.commitBlock=^{
                    NSLog(@"commit block");
                    complainDetailViewController *vc=[[complainDetailViewController alloc]init];
                    [weakSelf.navigationController pushViewController:vc animated:true];
                };
                cell=ingcell;
            }
            
            //  [cell setData:self.dataSourceDic];
        }
#pragma -----------------------------等待中界面-初始化--------------------------------
        //if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"0"])
        if(_pageTag==0){
            NSString *CellIdentifier =[NSString stringWithFormat:@"waitCell%ld",(long)indexPath.row];
            if([self.dataSourceDic objectForKey:@"pics"])
                {
                    waitBigTableViewCell *waitcell = (waitBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                    if (waitcell == nil) {
                        waitcell.contentView.frame = waitcell.bounds;
                        waitcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                        waitcell = [[[NSBundle mainBundle] loadNibNamed:@"waitBigTableViewCell" owner:self options:nil] lastObject];
                    }
                    cell=waitcell;
                    //[cell setData:self.dataSourceDic];
                }
                else
                {
                    waitTableViewCell *waitcell = (waitTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                    if (waitcell == nil) {
                        waitcell.contentView.frame = waitcell.bounds;
                        waitcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                        waitcell = [[[NSBundle mainBundle] loadNibNamed:@"waitTableViewCell" owner:self options:nil] lastObject];
                    }
                    cell=waitcell;
                }
            //  [cell setData:self.dataSourceDic];
        }
    #pragma -----------------------------已完成界面-初始化--------------------------------
        //if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"2"])
    if(_pageTag==2)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"dongCell%ld",(long)indexPath.row];
            if([self.dataSourceDic objectForKey:@"pics"]){
                doneBigTableViewCell *donecell = (doneBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (donecell == nil) {
                    donecell.contentView.frame = donecell.bounds;
                    donecell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    donecell = [[[NSBundle mainBundle] loadNibNamed:@"doneBigTableViewCell" owner:self options:nil] lastObject];
                }
                cell=donecell;
                //[cell setData:self.dataSourceDic];
            }
            else
            {
                doneTableViewCell *donecell = (doneTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (donecell == nil) {
                    donecell.contentView.frame = donecell.bounds;
                    donecell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    donecell = [[[NSBundle mainBundle] loadNibNamed:@"doneTableViewCell" owner:self options:nil] lastObject];
                }
                cell=donecell;
            }
            //  [cell setData:self.dataSourceDic];
        }
#pragma -----------------------------申诉中界面-初始化--------------------------------
        //if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"3"])
    if(_pageTag==3)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"complainCell%ld",(long)indexPath.row];
            complainTableViewCell *comcell = (complainTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (comcell == nil) {
            comcell.contentView.frame = comcell.bounds;
            comcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            comcell = [[[NSBundle mainBundle] loadNibNamed:@"complainTableViewCell" owner:self options:nil] lastObject];
            }
            cell=comcell;
            //[cell setData:self.dataSourceDic];

        }
#pragma -----------------------------已取消界面-初始化--------------------------------
        //if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"4"])
    if(_pageTag==4)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"cancelCell%ld",(long)indexPath.row];
            if([self.dataSourceDic objectForKey:@"pics"])
            {
                cancelBigTableViewCell *cancelcell = (cancelBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cancelcell == nil) {
                    cancelcell.contentView.frame = cancelcell.bounds;
                    cancelcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cancelcell = [[[NSBundle mainBundle] loadNibNamed:@"cancelBigTableViewCell" owner:self options:nil] lastObject];
                }
                cell=cancelcell;
              //  [cell setData:self.dataSourceDic];
            }
            else
            {
                cancelTableViewCell *cancelcell = (cancelTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cancelcell == nil) {
                    cancelcell.contentView.frame = cancelcell.bounds;
                    cancelcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cancelcell = [[[NSBundle mainBundle] loadNibNamed:@"cancelTableViewCell" owner:self options:nil] lastObject];
                }
                cell=cancelcell;
                //  [cell setData:self.dataSourceDic];
            }
        }
    }
    return cell;
    // Configure the cell.
}
#pragma mark ------------------------ UIScrollViewDelegate----------------------------
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    _pageTag=page;
    if(_pageTag==0)
    {
        [self.tableview1 reloadData];
    }
    else if(_pageTag==1)
    {
        [self.tableview2 reloadData];
    }
    else if(_pageTag==2)
    {
        [self.tableview3 reloadData];
    }
    else if(_pageTag==3)
    {
        [self.tableview4 reloadData];
    }
    else if(_pageTag==4)
    {
        [self.tableview5 reloadData];
    }
    [self.segmentedControl4 setSelectedSegmentIndex:page animated:YES];
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