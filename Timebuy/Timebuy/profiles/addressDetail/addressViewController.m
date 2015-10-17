//
//  adressViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/19.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "addressViewController.h"

@interface addressViewController ()
@property (weak, nonatomic) IBOutlet UITableView *addressTableview;

@end

@implementation addressViewController

@synthesize address;
-(void) getState
{
    //加载数据
    self.area = [[NSMutableArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area.plist" ofType:nil]];
    //self.provinces = [[self.area objectAtIndex:0] objectForKey:@"state"];
}
-(NSMutableArray*) getCities:(NSInteger)index{
    return [[self.area objectAtIndex:index] objectForKey:@"cities"];
}
-(void)viewDidLoad {
    [super viewDidLoad];
    self.addressTableview.dataSource=self;
    self.addressTableview.delegate=self;
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"故乡";
    [self getState];
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recModify:) name:@"passModify" object:nil];

}
//设置cell的点击和数据的返回
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==1)
    {
        NSMutableArray *cities=[self getCities:indexPath.row];
        if(cities!=nil)
        {
            addressDetailViewController *addressDetailVC = [[addressDetailViewController alloc] init];
            addressDetailVC.cities = cities;
            addressDetailVC.province=[[self.area objectAtIndex:indexPath.row] objectForKey:@"state"];
            [self.navigationController pushViewController:addressDetailVC animated:YES];
        }
    }
}
//设置tableview的cell和数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 1;
    }
    else
    {
        return self.area.count;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"Cell%ld",indexPath.row] ;
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        // Configure the cell.
        cell.backgroundColor=[UIColor whiteColor];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 40)];
        UIImageView *dingimage=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 30, 30)];
        dingimage.layer.masksToBounds=true;
        [dingimage setImage:[UIImage imageNamed:@"dingwei1.png"]];
        [view addSubview:dingimage];
        UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(40, 0,335, 40)];
        lable.text=@"杭州";
        [view addSubview:lable];
        [cell.contentView addSubview:view];
        return cell;
    }
    else if(indexPath.section==1)
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"Cell2%ld",indexPath.row] ;
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.backgroundColor=[UIColor whiteColor];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell.textLabel.text=[[self.area objectAtIndex:indexPath.row] objectForKey:@"state"];
        return cell;
    }
    return nil;
}
//设置uiviewtableheader样式
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *sectiontile=[self tableView:tableView titleForHeaderInSection:section];
    if(sectiontile==nil)
    {
        return nil;
    }
    else
    {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(15, 20, 200, 14)];
        label.text=sectiontile;
        label.textColor=[UIColor lightGrayColor];
        label.font=[UIFont fontWithName:@"Heiti TC" size:12];
        UIView *sectionview=[[UIView alloc]initWithFrame:CGRectMake(0,0, 375, 40)];
        //[sectionview setBackgroundColor:[UIColor lightGrayColor]];
        [sectionview addSubview:label];
        return sectionview;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
        
        return @"定位到的位置";
    }
    else if(section==1)
    {
        return @"全部";
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{   return 1;
}
//去掉UItableview headerview黏性
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.addressTableview)
    {
        CGFloat sectionHeaderHeight = 40;
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}

#pragma mark - TextField delegate
//点击return取消键盘
/*- (BOOL)textFieldShouldReturn:(UITextField *) textField {
    
    [textField resignFirstResponder];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passModify"
                                                        object:self
                                                      userInfo:@{@"type":@"address",@"value":self.addressText .text}];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

// 点击编辑区以外的地方 取消键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self.addressText isExclusiveTouch]) {
        [self.addressText  resignFirstResponder];
    }
}*/

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
