//
//  xueBaTableViewController.m
//  Timebuy
//
//  Created by yuweize on 15/10/7.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "xueBaViewController.h"
#import "xueBaTableViewCell.h"
@interface xueBaViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *xueBaTableView;
@end

@implementation xueBaViewController
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
    self.xueBaTableView.delegate=self;
    self.xueBaTableView.dataSource=self;
    self.title=@"学霸";
    //自定义返回按钮
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"箭头9x17px"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem  = backButton;
    // Do any additional setup after loading the view from its nib.
}
- (void)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma ----------------------------TableviewDelegate---------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;//self.dataSourceDic.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 238.0f;
    } else {
        return 182.f;
    }
    return 0.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier =[NSString stringWithFormat:@"xueCell%ld",(long)indexPath.row];
    if(indexPath.row==0)
    {
        UIImageView *paoImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 238)];
        [paoImage setImage:[UIImage imageNamed:@"学霸.png"]];
        UITableViewCell *cell=[[UITableViewCell alloc]init];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        [cell addSubview:paoImage];
        return cell;
    }
    
    xueBaTableViewCell *xuecell = (xueBaTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (xuecell == nil) {
        xuecell.contentView.frame = xuecell.bounds;
        xuecell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        xuecell = [[[NSBundle mainBundle] loadNibNamed:@"xueBaTableViewCell" owner:self options:nil] lastObject];
    }
    [xuecell setAccessoryType:UITableViewCellAccessoryNone];
    [xuecell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return xuecell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
