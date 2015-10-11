//
//  teamDetailsViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/10/11.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "teamDetailsViewController.h"

@interface teamDetailsViewController ()

@end

@implementation teamDetailsViewController
@synthesize teamDetailsTableView;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    for (UIView *v in self.tabBarController.view.subviews) {
        if ([v isKindOfClass:[UIButton class]] || [v isKindOfClass:[UITabBar class]]) {
            v.hidden = YES;
        }
    }
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    teamDetailsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - tableViewdelgate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return 183.0f;
            break;
        case 1:
            return 64.0f;
            break;
        case 2:
            return 80.0f;
            break;
        case 3:
            return 210.0f;
            break;
        case 4:
            return 220.0f;
            break;
        default:
            break;
    }
    return 0.0f;
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
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    
    switch (row) {
        case 0:
        {
            teamTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"teamTitleTableViewCell" owner:self options:nil] lastObject];
            }
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            cell.teamLogoImageView.layer.masksToBounds = YES;
            cell.teamLogoImageView.layer.cornerRadius = cell.teamLogoImageView.bounds.size.height / 2;
            
            return cell;
            break;
        }
        case 1:
        {
            teamDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"teamDetailsTableViewCell" owner:self options:nil] lastObject];
            }
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
            break;
        }
        case 2:
        {
            teamInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"teamInfoTableViewCell" owner:self options:nil] lastObject];
            }
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
            break;
        }
        case 3:
        {
            experienceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"experienceTableViewCell" owner:self options:nil] lastObject];
            }
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
            break;
        }
        case 4:
        {
            teamMemberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"teamMemberTableViewCell" owner:self options:nil] lastObject];
            }
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
            break;
        }
        default:
            break;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    switch (row) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
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
