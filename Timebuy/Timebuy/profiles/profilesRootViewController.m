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
#import "HomePageController.h"
#import "AFNetworking.h"
#import "MJExtension.h"

#import "TBNetLoginBusi.h"
#import "UserModel.h"
@interface profilesRootViewController ()<UITableViewDataSource,UITableViewDelegate,TBNetLoginBusiDelegate>

@property (strong, nonatomic) IBOutlet UITableView *rootTableview;
@property (nonatomic,strong) NSArray *mytitle;
@property(nonatomic,strong)ProfileDetailModal *profileModal;
@property(nonatomic) TBNetLoginBusi *tbNetLoginBusi;
@end
@implementation profilesRootViewController


//-(ProfileDetailModal *)profileModal{
//    if (_profileModal == nil) {
//        _profileModal = [[ProfileDetailModal alloc] init];
//        NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];
//        if (array) {
//            _profileModal.phone = array[5];
//            _profileModal.nickName = array[0];
//        }
//        else{ _profileModal.phone = @"未填写";
//            _profileModal.nickName = @"未填写";
//       
//        }}
//    return _profileModal;
//}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    for (UIView *v in self.tabBarController.view.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            v.hidden = NO;
        }
    }
    self.tabBarController.tabBar.hidden = NO;
    [self.rootTableview reloadData];
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
    self.hidesBottomBarWhenPushed = YES;
    [self getInfo];
    // Do any additional setup after loading the view from its nib.
    
}


-(void)getInfo{
//    /user/info
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//     [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    NSDictionary *params  = @{@"phone":@"18767122223"};
    NSString *url = [NSString stringWithFormat:@"%@%@",timebuyUrl,@"user/info"];
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
    ProfileDetailModal *modal = [ProfileDetailModal objectWithKeyValues:responseObject[@"data"]];
        
//        NSLog(@" 111---  %@ ---111",responseObject );
        self.profileModal = modal;
//        NSLog(@" 111---  %@ ---111",self.profileModal );

        NSString *timeStr = [responseObject[@"data"] objectForKey:@"birthDay"] ;
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStr doubleValue] / 1000];
        modal.birthDay = date;
        NSTimeInterval dateDiff = [date timeIntervalSinceNow];
        
        int age=trunc(dateDiff/(60*60*24))/365;
        modal.age = age;
       [self saveData:modal];
   
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@" 111---  %@ ---111",error );

    }];
    
    self.hidesBottomBarWhenPushed = YES;
    //__strong typeof(self) strongSelf = self;
    self.tbNetLoginBusi =[[TBNetLoginBusi alloc]initWithDelegate:self username:@"13758240890" password:@"1"];
    [self.tbNetLoginBusi start];
}

#pragma mark - JYCNetLoginBusiDelegate
-(void)loginSuccess:(UserModel *)user{
    NSLog(@"usermodel");
    //[SVProgressHUD dismissWithSuccess:@"登录成功"];
    //UserModel *usermodel=[[UserModel alloc] initWithLogin:user.user_id token:user.token];
    //[[UserDBLogic sharedInstance] deleteCurrentUser];
    //[[UserDBLogic sharedInstance] insertOneUser:usermodel];
//    if ([self.loginDelegate respondsToSelector:@selector(loginSuccess)]) {
//        [self.loginDelegate loginSuccess];
//    }
}

-(void)loginFail:(NSError *)error{
    if ([ErrorHandleUtil handleError:error]) {
        if (error.code == -1) {
            [SVProgressHUD dismissWithError:@"用户名或密码错误，请重试" afterDelay:AlertTime];
        }else{
            [SVProgressHUD dismissWithError:@"服务器繁忙，请重试" afterDelay:AlertTime];
        }
    }
}

-(void)saveData:(ProfileDetailModal *)modal{
    
    
    NSString *ageStr = [NSString stringWithFormat:@"%d",modal.age];
    
    NSString *phone = modal.phone;
    NSString *nickName = modal.nickName;
    NSString *profession = modal.profession;
    NSString *address = modal.address;
    NSString *sex = modal.sex;
    NSString *userId = modal.userId;
   
   
//    NSArray *path1=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSLog(@" 111---  %@ ---111",path1 );
    
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];
    if (array) {
        NSMutableArray *array2 = [NSMutableArray arrayWithArray:array];
        [array2 replaceObjectAtIndex:0 withObject:nickName];
        [array2 replaceObjectAtIndex:1 withObject:sex];
        [array2 replaceObjectAtIndex:2 withObject:ageStr];
        [array2 replaceObjectAtIndex:3 withObject:profession];
        [array2 replaceObjectAtIndex:5 withObject:phone];
        [array2 replaceObjectAtIndex:7 withObject:userId];
        [array2 replaceObjectAtIndex:8 withObject:address];
        [array2 replaceObjectAtIndex:9 withObject:modal.birthDay];

        [[NSUserDefaults standardUserDefaults] setObject:array2 forKey:@"rightArray"];
    }else{
        NSMutableArray *array2 = [NSMutableArray arrayWithObjects:@"未填写",@"未填写",@"未填写",@"未填写",@"未填写",@"未填写",@"未填写",@"userId",@"address",@"birthDay", nil];
        [array2 replaceObjectAtIndex:0 withObject:nickName];
        [array2 replaceObjectAtIndex:1 withObject:sex];
        [array2 replaceObjectAtIndex:2 withObject:ageStr];
        [array2 replaceObjectAtIndex:3 withObject:profession];
        [array2 replaceObjectAtIndex:5 withObject:phone];
        [array2 replaceObjectAtIndex:7 withObject:userId];
        [array2 replaceObjectAtIndex:8 withObject:address];
        [array2 replaceObjectAtIndex:9 withObject:modal.birthDay];
        
        //            [array2 addObject:userId];
        //            [array2 addObject:address];
        
        [[NSUserDefaults standardUserDefaults] setObject:array2 forKey:@"rightArray"];
        
    }

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
//        NSLog(@" 111---  %@ ---111",cell.profileModal );

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
    else{
        HomePageController *pageController = [[HomePageController alloc] init];
        [self.navigationController pushViewController:pageController animated:YES];
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
