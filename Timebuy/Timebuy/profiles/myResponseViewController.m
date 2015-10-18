//
//  myResponseViewController.m
//  Timebuy
//
//  Created by yuweize on 15/10/9.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "myResponseViewController.h"
#import "HMSegmentedControl.h"
#import "RcancelTableViewCell.h"
#import "RcomplainTableViewCell.h"
#import "RingTableViewCell.h"
#import "RdoneTableViewCell.h"
#import "RcomplainTableViewCell.h"
#import "RingBigTableViewCell.h"
#import "RcancelBigTableViewCell.h"
#import "RdoneBigTableViewCell.h"
#import "MJRefresh.h"
@interface myResponseViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) HMSegmentedControl *segmentedControl4;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic) UITableView *tableview1;
@property (nonatomic) UITableView *tableview2;
@property (nonatomic) UITableView *tableview3;
@property (nonatomic) UITableView *tableview4;
@property (nonatomic) NSInteger pageTag;
@property (nonatomic) NSInteger refreshTag;
#pragma -----------------------tableview的字典数组----------------------------
@property (nonatomic) NSMutableDictionary *dataSourceDic;
@end

@implementation myResponseViewController
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
#pragma mark 下拉刷新数据
- (void)loadData
{
    NSLog(@"下拉");
    CGFloat pageWidth = _scrollView.frame.size.width;
    NSInteger page = _scrollView.contentOffset.x / pageWidth;
    _pageTag=page;
    _refreshTag=1;
    //结束刷新
    //[self.tableview1.header endRefreshing];
    if(_pageTag==0)
    {
        [self.tableview1 headerEndRefreshing];
        [self.tableview1 reloadData];
    }
    else if(_pageTag==1)
    {
        [self.tableview2 headerEndRefreshing];
        [self.tableview2 reloadData];
    }
    else if(_pageTag==2)
    {
        [self.tableview3 headerEndRefreshing];
        [self.tableview3 reloadData];
    }
    else if(_pageTag==3)
    {
        [self.tableview4 headerEndRefreshing];
        [self.tableview4 reloadData];
    }
    //[self.segmentedControl4 setSelectedSegmentIndex:_pageTag animated:YES];
//    CGFloat pageWidth = _scrollView.frame.size.width;
//    NSInteger page = _scrollView.contentOffset.x / pageWidth;
//    _pageTag=page;
//    [self.tableview1 reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _pageTag=0;
    _refreshTag=0;
    self.title=@"我的响应";
#pragma -----------------------------segment设置------------------------------------------------
    CGFloat viewWidth = CGRectGetWidth([UIScreen mainScreen].applicationFrame);
    self.segmentedControl4 = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 2, viewWidth, 30)];
    self.segmentedControl4.sectionTitles = @[@"在进行", @"已完成", @"申诉中",@"已取消"];
    self.segmentedControl4.selectedSegmentIndex = 0;
    self.segmentedControl4.backgroundColor = [UIColor whiteColor];
    UIFont* font = [UIFont fontWithName:@"Arial-ItalicMT" size:14.0];
    self.segmentedControl4.titleTextAttributes = @{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor]};
    self.segmentedControl4.selectionIndicatorHeight = 4.0f;
    self.segmentedControl4.selectionIndicatorColor = [UIColor colorWithRed:12.0 / 255.0f green:228.0 / 255.0f blue:225.0 / 255.0f alpha:1];
    self.segmentedControl4.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentedControl4.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
#pragma -----------------------------scrollview设置------------------------------------------
    //self.segmentedControl4.tag = 3;
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl4 setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(viewWidth * index, 0, viewWidth, self.view.frame.size.height-90) animated:YES];
    }];
    [self.view addSubview:self.segmentedControl4];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 32, viewWidth, self.view.frame.size.height-70)];
    self.scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(viewWidth * 4, self.view.frame.size.height-70);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, viewWidth, self.view.frame.size.height-70) animated:YES];
    [self.view addSubview:self.scrollView];
#pragma ------------------------------scrollview内容添加------------------------------------
     self.tableview1=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, viewWidth, self.view.frame.size.height-70)];
    [self setApperanceForTableview:_tableview1 WithIndex:0];
    [self.scrollView addSubview:_tableview1];
    
    self.tableview2=[[UITableView alloc]initWithFrame:CGRectMake(viewWidth, 0, viewWidth, self.view.frame.size.height-70)];
    [self setApperanceForTableview:_tableview2 WithIndex:1];
    [self.scrollView addSubview:_tableview2];
    
    self.tableview3=[[UITableView alloc]initWithFrame:CGRectMake(viewWidth*2, 0, viewWidth, self.view.frame.size.height-70)];
    [self setApperanceForTableview:_tableview3 WithIndex:2];
    [self.scrollView addSubview:_tableview3];
    
    self.tableview4=[[UITableView alloc]initWithFrame:CGRectMake(viewWidth*3, 0, viewWidth, self.view.frame.size.height-70)];
    [self setApperanceForTableview:_tableview4 WithIndex:3];
    [self.scrollView addSubview:_tableview4];
    //自定义返回按钮
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"箭头9x17px"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem  = backButton;
    // Do any additional setup after loading the view from its nib.
}
- (void)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setApperanceForTableview:(UITableView *)tableview
                           WithIndex:(NSInteger)index {
    [tableview setRowHeight:106];
    [tableview setSectionHeaderHeight:6];
    [tableview setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableview setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    tableview.delegate=self;
    tableview.dataSource=self;
    [tableview addHeaderWithTarget:self action:@selector(loadData)];
    //_pageTag=index;
    //[tableview reloadData];
    //CGFloat pageWidth = _scrollView.frame.size.width;
    //NSInteger page = _scrollView.contentOffset.x / pageWidth;
    //_pageTag=page;
}
#pragma mark ------------------------ UIScrollViewDelegate----------------------------
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if(_refreshTag==0)
    {
        CGFloat pageWidth = scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / pageWidth;
        _pageTag=page;
        
    }
    _refreshTag=0;
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
    [self.segmentedControl4 setSelectedSegmentIndex:_pageTag animated:YES];
}
#pragma ----------------------------TableviewDelegate---------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;//self.dataSourceDic.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[UITableViewCell alloc];
    if(tableView==self.tableview1)
    {
        cell = [self tableView:self.tableview1 cellForRowAtIndexPath:indexPath];
    }
    else if(tableView==self.tableview2)
    {
        cell = [self tableView:self.tableview2 cellForRowAtIndexPath:indexPath];
    }
    else if(tableView==self.tableview3)
    {
        cell = [self tableView:self.tableview3 cellForRowAtIndexPath:indexPath];
    }
    else if(tableView==self.tableview4)
    {
        cell = [self tableView:self.tableview4 cellForRowAtIndexPath:indexPath];
    }
    return cell.frame.size.height;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(tableView==self.tableview1)
    {
        _pageTag=0;
    }
    else if(tableView==self.tableview2)
    {
        _pageTag=1;
    }
    else if(tableView==self.tableview3)
    {
        _pageTag=2;
    }
    else if(tableView==self.tableview4)
    {
        _pageTag=3;
    }
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 6)];
    UIImageView *sanjiao=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-41*4)/8+(_pageTag*(self.view.frame.size.width/4))+20-5, 0, 10, 6)];
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
        if(tableView==self.tableview1)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"RingimageCell%ld",(long)indexPath.row];
            RingBigTableViewCell *ingcell = (RingBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            //__weak typeof(self) weakSelf = self;
            if (ingcell == nil) {
                ingcell.contentView.frame = ingcell.bounds;
                ingcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                ingcell = [[[NSBundle mainBundle] loadNibNamed:@"RingBigTableViewCell" owner:self options:nil] lastObject];
            }
            cell=ingcell;
        }
        else if(tableView==self.tableview2)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"RdoneimageCell%ld",(long)indexPath.row];
            RdoneBigTableViewCell *donecell = (RdoneBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (donecell == nil) {
                donecell.contentView.frame = donecell.bounds;
                donecell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                donecell = [[[NSBundle mainBundle] loadNibNamed:@"RdoneBigTableViewCell" owner:self options:nil] lastObject];
            }
            cell=donecell;
        }
        else if(tableView==self.tableview3)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"RcomplainCell%ld",(long)indexPath.row];
            RcomplainTableViewCell *comcell = (RcomplainTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (comcell == nil) {
                comcell.contentView.frame = comcell.bounds;
                comcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                comcell = [[[NSBundle mainBundle] loadNibNamed:@"RcomplainTableViewCell" owner:self options:nil] lastObject];
            }
            cell=comcell;
        }
        else if(tableView==self.tableview4)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"RcancelCell%ld",(long)indexPath.row];
            RcancelBigTableViewCell *cancelcell = (RcancelBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cancelcell == nil) {
                cancelcell.contentView.frame = cancelcell.bounds;
                cancelcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cancelcell = [[[NSBundle mainBundle] loadNibNamed:@"RcancelBigTableViewCell" owner:self options:nil] lastObject];
            }
            cell=cancelcell;
        }
    }
    else
    {
#pragma -----------------------------进行中界面-初始化--------------------------------
        //if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"1"])
        if(tableView==self.tableview1){
            NSString *CellIdentifier =[NSString stringWithFormat:@"RingCell%ld",(long)indexPath.row];
            //__weak typeof(self) weakSelf = self;
            if([self.dataSourceDic objectForKey:@"pics"])
            {
                RingBigTableViewCell *ingcell = (RingBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (ingcell == nil) {
                    ingcell.contentView.frame = ingcell.bounds;
                    ingcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    ingcell = [[[NSBundle mainBundle] loadNibNamed:@"RingBigTableViewCell" owner:self options:nil] lastObject];
                }
//                ingcell.commitBlock=^{
//                    NSLog(@"commit block");
//                    complainDetailViewController *vc=[[complainDetailViewController alloc]init];
//                    [weakSelf.navigationController pushViewController:vc animated:true];
//                };
                cell=ingcell;
                //  [cell setData:self.dataSourceDic];
            }
            else
            {
                RingTableViewCell *ingcell = (RingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (ingcell == nil) {
                    ingcell.contentView.frame = ingcell.bounds;
                    ingcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    ingcell = [[[NSBundle mainBundle] loadNibNamed:@"RingTableViewCell" owner:self options:nil] lastObject];
                }
//                ingcell.commitBlock=^{
//                    NSLog(@"commit block");
//                    complainDetailViewController *vc=[[complainDetailViewController alloc]init];
//                    [weakSelf.navigationController pushViewController:vc animated:true];
//                };
                cell=ingcell;
            }
            
            //  [cell setData:self.dataSourceDic];
        }
#pragma -----------------------------已完成界面-初始化--------------------------------
        //if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"2"])
        if(tableView==self.tableview2)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"RdongCell%ld",(long)indexPath.row];
            if([self.dataSourceDic objectForKey:@"pics"]){
                RdoneBigTableViewCell *donecell = (RdoneBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (donecell == nil) {
                    donecell.contentView.frame = donecell.bounds;
                    donecell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    donecell = [[[NSBundle mainBundle] loadNibNamed:@"RdoneBigTableViewCell" owner:self options:nil] lastObject];
                }
                cell=donecell;
                //[cell setData:self.dataSourceDic];
            }
            else
            {
                RdoneTableViewCell *donecell = (RdoneTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (donecell == nil) {
                    donecell.contentView.frame = donecell.bounds;
                    donecell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    donecell = [[[NSBundle mainBundle] loadNibNamed:@"RdoneTableViewCell" owner:self options:nil] lastObject];
                }
                cell=donecell;
            }
            //  [cell setData:self.dataSourceDic];
        }
#pragma -----------------------------申诉中界面-初始化--------------------------------
        //if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"3"])
        if(tableView==self.tableview3)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"complainCell%ld",(long)indexPath.row];
            RcomplainTableViewCell *comcell = (RcomplainTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (comcell == nil) {
                comcell.contentView.frame = comcell.bounds;
                comcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                comcell = [[[NSBundle mainBundle] loadNibNamed:@"RcomplainTableViewCell" owner:self options:nil] lastObject];
            }
            cell=comcell;
            //[cell setData:self.dataSourceDic];
        }
#pragma -----------------------------已取消界面-初始化--------------------------------
        //if([[self.dataSourceDic objectForKey:@"tag"] isEqual:@"4"])
        if(tableView==self.tableview4)
        {
            NSString *CellIdentifier =[NSString stringWithFormat:@"cancelCell%ld",(long)indexPath.row];
            if([self.dataSourceDic objectForKey:@"pics"])
            {
                RcancelBigTableViewCell *cancelcell = (RcancelBigTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cancelcell == nil) {
                    cancelcell.contentView.frame = cancelcell.bounds;
                    cancelcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cancelcell = [[[NSBundle mainBundle] loadNibNamed:@"RcancelBigTableViewCell" owner:self options:nil] lastObject];
                }
                cell=cancelcell;
                //  [cell setData:self.dataSourceDic];
            }
            else
            {
                RcancelTableViewCell *cancelcell = (RcancelTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cancelcell == nil) {
                    cancelcell.contentView.frame = cancelcell.bounds;
                    cancelcell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cancelcell = [[[NSBundle mainBundle] loadNibNamed:@"RcancelTableViewCell" owner:self options:nil] lastObject];
                }
                cell=cancelcell;
                //  [cell setData:self.dataSourceDic];
            }
        }
    }
    return cell;
    // Configure the cell.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
