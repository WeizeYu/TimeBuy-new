//
//  profilesRootViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/9/22.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//
#import "ProfileDetailCell.h"
#import "profilesRootViewController.h"
#import "myReleaseViewController.h"
#import "myResponseViewController.h"
#import "ProfileDetailModal.h"
#import "mySettingViewController.h"
@interface profilesRootViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *rootTableview;
@property (nonatomic,strong) NSArray *mytitle;
@property(nonatomic,strong)ProfileDetailModal *profileModal;

@end
@implementation profilesRootViewController


-(ProfileDetailModal *)profileModal{
    if (_profileModal == nil) {
        _profileModal = [[ProfileDetailModal alloc] init];
        _profileModal.phoneStr = @"12321312";
        _profileModal.nameStr = @"张三";
    }
    return _profileModal;
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
    self.mytitle=[[NSArray alloc]initWithObjects:@"我的钱包",@"我的发布",@"我的响应",@"我的公益",@"我的设置",nil];
    self.rootTableview.dataSource=self;
    self.rootTableview.delegate=self;
    self.rootTableview.backgroundColor = [UIColor colorWithRed:240 green:240 blue:240 alpha:1];
    //@{}代表Dictionary
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:24]}];
    self.title=@"我的";
    // Do any additional setup after loading the view from its nib.
    
    self.hidesBottomBarWhenPushed = YES;
    
}
#pragma ---------------------TableviewDelegate---------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"ID";
    if (indexPath.row == 0 && indexPath.section == 0) {
        ProfileDetailCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ProfileDetailCell" owner:nil options:nil] lastObject];
//        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.profileModal = self.profileModal;
         return cell;
    }
        
        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell2 == nil){
            cell2 = [[UITableViewCell alloc] init];
        cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell2.textLabel.text = self.mytitle[indexPath.row];
    }
            return cell2;
   
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}


//
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    if (section == 0) {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 10)];
//        view.backgroundColor = [UIColor grayColor];
//        return view;
//    }
//    else{
//        return nil;
//    }
//        
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    if (section == 0) {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 10)];
//        view.backgroundColor = [UIColor grayColor];
//        return view;
//    }else{
//        return nil;
//    }
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==1)
    {
        if(indexPath.row==1)
        {
            myReleaseViewController *vc=[[myReleaseViewController alloc]init];
            [self.navigationController pushViewController:vc animated:true];
        }
        else if(indexPath.row==1)
        {
            myReleaseViewController *vc=[[myReleaseViewController alloc]init];
            [self.navigationController pushViewController:vc animated:true];
        }
        else if(indexPath.row==2)
        {
            myResponseViewController *vc=[[myResponseViewController alloc]init];
            [self.navigationController pushViewController:vc animated:true];
        }
        else if(indexPath.row==4)
        {
            mySettingViewController *vc=[[mySettingViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 && indexPath.section == 0) {
        return 99;
    }
    else{
        return 49;
    }
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
