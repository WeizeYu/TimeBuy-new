//
//  profilesRootViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/9/22.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "profilesRootViewController.h"
#import "myReleaseViewController.h"
@interface profilesRootViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *rootTableview;
@property (nonatomic) NSArray *mytitle;
@end
@implementation profilesRootViewController


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
    self.mytitle=[[NSArray alloc]initWithObjects:@"我发布的",@"我收藏的",@"我****",nil];
    self.rootTableview.dataSource=self;
    self.rootTableview.delegate=self;
    //@{}代表Dictionary
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:24]}];
    self.title=@"我的";
    // Do any additional setup after loading the view from its nib.
}
#pragma ---------------------TableviewDelegate---------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier =[NSString stringWithFormat:@"Cell%ld",indexPath.row];
    UITableViewCell *cell=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, self.view.layer.bounds.size.width, 44)];
    // Configure the cell.
    if(cell==nil)
    {
        cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(5, 3, 100, 30)];
    label.text=[self.mytitle objectAtIndex:indexPath.row];
    [cell addSubview:label];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0)
    {
        myReleaseViewController *vc=[[myReleaseViewController alloc]init];
        [self.navigationController pushViewController:vc animated:true];
        
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
