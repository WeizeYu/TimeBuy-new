//
//  findingsRootViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/9/22.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "findingsMainViewController.h"
#import "paoTuiViewController.h"
@interface findingsMainViewController ()

@end

@implementation findingsMainViewController

@synthesize findingsTableView;
@synthesize imageArray;
@synthesize titleArray;
@synthesize titileDetailArray;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    self.tabBarController.tabBar.hidden = NO;
    
    for (UIView *v in self.tabBarController.view.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            v.hidden = NO;
        }
    }
    
    NSLog(@"Hello findings");
    NSLog(@"findings tabbar = %@",self.tabBarController.tabBar);
    
    self.tabBarController.tabBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 42, 20)];
    UIImageView *logoImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 42, 20)];
    logoImgView.image = [UIImage imageNamed:@"导航字体"];
    [titleView addSubview:logoImgView];
    [self.navigationItem setTitleView:titleView];
    
    imageArray        = [[NSMutableArray alloc] initWithObjects:@"help",@"hardworking",@"accompany",@"welfare", nil];
    titleArray        = [[NSMutableArray alloc] initWithObjects:@"跑腿",@"学霸",@"陪伴",@"公益", nil];
    titileDetailArray = [[NSMutableArray alloc] initWithObjects:@"随手而递 魔鬼步伐~",@"如此这般走进学霸的世界~",@"当你孤单的时候你会想起谁~",@"用你我的时间创造不一样的未来~", nil];
    
    self.hidesBottomBarWhenPushed = YES;
}

#pragma mark - tableViewdelgate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [imageArray count] + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 153.0f;
    } else {
        return 64.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row=[indexPath row];
    
    //需要对每个cell进行标识，不然刷新会有问题
    NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    
    if (row == 0) {
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
        
        }
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 153)];
        imageView.image = [UIImage imageNamed:@"跑腿(1).png"];
        
        [cell addSubview:imageView];
        
    } else {
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellTableIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        UIImageView *titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12,7,50,50)];
        titleImageView.image = [UIImage imageNamed:[imageArray objectAtIndex:row-1]];
        [cell addSubview:titleImageView];
        
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(70,17,50,20)];
        titleLabel.text      = [titleArray objectAtIndex:row-1];
        titleLabel.font      = [UIFont systemFontOfSize:18.0f];
        titleLabel.textColor = [UIColor blackColor];
        
        UILabel *detailTitleLabel  = [[UILabel alloc] initWithFrame:CGRectMake(70, 44, 200, 10)];
        detailTitleLabel.text      = [titileDetailArray objectAtIndex:row -1 ];
        detailTitleLabel.font      = [UIFont systemFontOfSize:12.0f];
        detailTitleLabel.textColor = [UIColor lightGrayColor];
        
        [cell addSubview:titleLabel];
        [cell addSubview:detailTitleLabel];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    
    //点击后灰色消失
    [findingsTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (row) {
        case 0:
            break;
        case 1:
        {
            paoTuiViewController *vc=[[paoTuiViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
        {
            welfareViewController *welfareVC = [[welfareViewController alloc] init];
            [self.navigationController pushViewController:welfareVC animated:YES];
            break;
        }
        default:
            break;
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
