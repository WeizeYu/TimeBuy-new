//
//  homeRootViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/9/22.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "homeMainViewController.h"
#import "ImageCellModal.h"

@interface homeMainViewController ()
@property(nonatomic,strong)ImageCellModal *imageCellModal;

@end

@implementation homeMainViewController

@synthesize button;
@synthesize homeTableView;


-(ImageCellModal *)imageCellModal{
    if (_imageCellModal == nil) {
        _imageCellModal = [[ImageCellModal alloc] init];
    }
    return _imageCellModal;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
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
    // Do any additional setup after loading the view from its nib.
    /*
    UIBarButtonItem *registerButton = [[UIBarButtonItem alloc] initWithTitle:@"进入" style:UIBarButtonItemStylePlain target:self action:@selector(enter:)];
    self.navigationItem.rightBarButtonItem = registerButton;
    //self.navigationItem.rightBarButtonItem.enabled = NO;
    */
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 42, 20)];
    UIImageView *logoImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 42, 20)];
    logoImgView.image = [UIImage imageNamed:@"导航字体"];
    [titleView addSubview:logoImgView];
    [self.navigationItem setTitleView:titleView];
    
    self.hidesBottomBarWhenPushed = YES;
    
    homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    homeTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
//    __weak __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
//    homeTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [weakSelf loadNewData];
//    }];
    [homeTableView addHeaderWithTarget:self action:@selector(loadNewData)];
    // 马上进入刷新状态
    //[homeTableView.header beginRefreshing];
    
    [self getAllNews];
    
    /*
    AFNetNewsBusi *test = [[AFNetNewsBusi alloc] init];
    test.delegate = self;
    [test go];
    */
}

/*
- (void)newsSuccess:(id)user
{
    NSLog(@"hello %@",user);
}
*/

- (void)enter:(id)sender {
    homeDetailsViewController *homeDetailsVC = [[homeDetailsViewController alloc] init];
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:homeDetailsVC animated:YES];
    //隐藏中间的button
    for (UIView *v in self.tabBarController.view.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            v.hidden = YES;
        }
    }

}

#pragma mark - 数据处理相关
#pragma mark 下拉刷新数据
- (void)loadNewData
{
    NSLog(@"下拉");
    //结束刷新
//    [homeTableView.header endRefreshing];
    [homeTableView headerEndRefreshing];
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
            return 188.f;
            break;
        case 2:
            return 80.0f;
            break;
        default:
            return 182.0f;
            break;
    }
    
    return 0.0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row=[indexPath row];
    
    //需要对每个cell进行标识，不然刷新会有问题
    NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
    
    switch (row) {
        case 0:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            if (cell == nil) {
                
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
                
            }
            
            //自动推送图片
            JScrollView_PageControl_AutoScroll *view = [[JScrollView_PageControl_AutoScroll alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 188)];
            view.autoScrollDelayTime = 5.0f;
            view.delegate = self;
            
            UIImageView *pageImgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 188)];
            pageImgView1.image = [UIImage imageNamed:@"推送.png"];
            
            UIImageView *pageImgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 188)];
            pageImgView2.image = [UIImage imageNamed:@"zisu10.1.png"];
            
            UIImageView *pageImgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 188)];
            pageImgView3.image = [UIImage imageNamed:@"3首页-07.png"];
            
            NSMutableArray *viewsArray = [[NSMutableArray alloc] initWithObjects:pageImgView3,pageImgView1,pageImgView2, nil];
            [view setViewsArray:viewsArray];
            
            [cell addSubview:view];
            [view shouldAutoShow:YES];
            
            return cell;
            break;
        }
        case 1:
        {
            homeImageDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"homeImageDetailsTableViewCell" owner:self options:nil] lastObject];
            }
            
            cell.portraitImgView.layer.masksToBounds = YES;
            cell.portraitImgView.layer.cornerRadius = cell.portraitImgView.bounds.size.height / 2;
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            //self.imageCellModal.image_url = [NSArray arrayWithObjects:@"showImg",@"showImg2",@"showImg3",nil];
            //cell.imageCellModal = self.imageCellModal;
            
            return cell;
            
            break;
        }
        case 2:
        {
            
            homeTextDetailsTableViewCell *cell = (homeTextDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"homeTextDetailsTableViewCell" owner:self options:nil] lastObject];
            }
            
            cell.portraitImgView.layer.masksToBounds = YES;
            cell.portraitImgView.layer.cornerRadius = cell.portraitImgView.bounds.size.height / 2;
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
            
            break;
        }
        default:
        {
            
            homeImageDetailsTableViewCell *cell = (homeImageDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"homeImageDetailsTableViewCell" owner:self options:nil] lastObject];
            }
            
            cell.portraitImgView.image = [UIImage imageNamed:@"portrait2.png"];
            cell.portraitImgView.layer.masksToBounds = YES;
            cell.portraitImgView.layer.cornerRadius = cell.portraitImgView.bounds.size.height / 2;
            cell.nicknameLabel.text = @"黄小名";
            cell.priceLabel.text = @"￥10";
            cell.detailsLabel.text = @"求帮拿快递，地址在顺丰快递门口";
            
            //[cell.showImgButton1 setImage:[UIImage imageNamed:@"showImg4.png"] forState:UIControlStateNormal];
            //cell.showImgButton2.hidden = YES;
            //cell.showImgButton3.hidden = YES;
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

            
            return cell;
            
            break;
        }
    }
    
    return nil;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //testViewController *testVC = [[testViewController alloc] init];
    //[self.navigationController pushViewController:testVC animated:YES];
    switch (indexPath.row) {
        case 1:
        {
            homeDetailsViewController *showDetailsVC=[[homeDetailsViewController alloc]init];
            [self.navigationController pushViewController:showDetailsVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - AFNet get all news
- (void)getAllNews
{
    NSDate *curDate = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *curDateTime = [formatter stringFromDate:curDate];
    
    //上传至服务器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"d6089681f79c7627bbac829307e041a7" forHTTPHeaderField:@"x-timebuy-sid"];
    
    //2.设置登录参数
    NSDictionary *dict = @{ //@"usrId":[userConfiguration getStringValueForConfigurationKey:@"userId"],
                            @"timeNow":curDateTime,
                            @"coordx":@"1",
                            @"coordy":@"1",
                            @"currentPage":@"1",
                            //@"did":[[[UIDevice currentDevice] identifierForVendor] UUIDString],   //获得设备标志
                            };
    
    //3.请求
    NSString *url = [NSString stringWithFormat:@"%@%@",timebuyUrl,@"news/online"];
    [manager GET:url parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"GET --> %@", responseObject); //自动返回主线程
        
        NSString *getStatus = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"success"]];
        NSString *getCode = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"code"]];
        if ([getStatus isEqualToString:@"1"] && [getCode isEqualToString:@"1000"]) {
            
            //[SVProgressHUD show];
            //[SVProgressHUD dismissWithSuccess:@"加载成功" afterDelay:1.0];
            [SVProgressHUD showSuccessWithStatus:@"加载成功"];
            [SVProgressHUD dismissWithDelay:1.0f];
            
            NSData *getData = [[NSData alloc] init];
            getData = [responseObject objectForKey:@"data"];
            
            //NSLog(@"address = %@",[getData valueForKey:@"address"]);
            //self.taskModel.taskAcceptUserid =
            
            // 将得到的数据存在本地
            //getData = [responseObject objectForKey:@"data"];
            //用户的信息存入本地
            //[userConfiguration setStringValueForConfigurationKey:@"phone" withValue:telephoneTextField.text];
            
            /*
             //利用SDWenImage下载图片
             NSString *headIdStr = [userConfiguration getStringValueForConfigurationKey:@"headIcon"];
             NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.8.102:8080/timebuy/upload/%@",headIdStr]];
             SDWebImageManager *manager = [SDWebImageManager sharedManager];
             [manager downloadImageWithURL:url options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
             // progression tracking code
             } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
             if (error) {
             NSLog(@"头像下载出错error %@",error);
             } else {
             if (image) {
             NSLog(@"头像下载成功！");
             //将图片数据存入NSUserDefaults中
             [userConfiguration setDataValueForConfigurationKey:@"portrait" withValue:UIImagePNGRepresentation(image)];
             
             }
             }
             }];
             */
            
        } else if ([getStatus isEqualToString:@"0"] && [getCode isEqualToString:@"2003"]) {
            
            [SVProgressHUD showSuccessWithStatus:@"加载成功"];
            
        } else if ([getStatus isEqualToString:@"0"] && [getCode isEqualToString:@"2004"]) {
            //[self showErrorWithTitle:@"首页加载失败" WithMessage:@"密码错误"];
            [SVProgressHUD showErrorWithStatus:@"首页加载失败" ];
        } else {
            //[self showErrorWithTitle:@"首页加载失败" WithMessage:@"系统错误"];
            [SVProgressHUD showErrorWithStatus:@"首页加载失败" ];
        }
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        
        [SVProgressHUD showErrorWithStatus:error.description];
    }];
}

-(void)showErrorWithTitle:(NSString *)titile WithMessage:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:titile message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
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
