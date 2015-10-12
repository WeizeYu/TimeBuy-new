//
//  releaseMainViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/9/26.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "releaseRootViewController.h"

@interface releaseRootViewController ()

@end

@implementation releaseRootViewController

@synthesize releaseTableView;
@synthesize datePicker;
@synthesize location;
@synthesize locationName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"发布";
    
    /*
     UIBarButtonItem *registerButton = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(send:)];
     self.navigationItem.rightBarButtonItem = registerButton;
     //self.navigationItem.rightBarButtonItem.enabled = NO;
     */
    
    myRow = -1;
    
    placeStr = @"杭州小和山";
    timeStr = @"请确定合适开始和结束";
    priceStr = @"输入价格";
    phone = @"18767122229";
    
    shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 275 + 64)];
    shadowView.backgroundColor = [UIColor blackColor];
    shadowView.alpha = 0.45f;
    //[self.navigationController.view addSubview:shadowView];
    
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actiondo:)];
    
    [shadowView addGestureRecognizer:tapGesture];
    
    releaseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    releaseTableView.tag = 0;
    
    UIView *sendView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 64, [UIScreen mainScreen].bounds.size.width, 64)];
    sendView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:sendView];
    
    sendButton = [[UIButton alloc] initWithFrame:CGRectMake(13, 12, [UIScreen mainScreen].bounds.size.width - 13 * 2, 40)];
    [sendButton setTitle:@"确定发布" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendButton setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:80.0 / 255.0f green:227.0 / 255.0f blue:194.0 / 255.0f alpha:1] size:sendButton.bounds.size] forState:UIControlStateNormal];
    [sendButton setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor] size:sendButton.bounds.size] forState:UIControlStateDisabled];
    
    [sendButton addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
    [sendView addSubview:sendButton];
    sendButton.layer.masksToBounds = YES;
    sendButton.layer.cornerRadius = 3;
    
    [sendButton setEnabled:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recModifyInRelease:) name:@"passModifyInRelease" object:nil];
    
    //定位地址名称
    //placeStr = locationName;
    
}

- (void)recModifyInRelease:(NSNotification *)notification {
    NSDictionary *getDic = [notification userInfo];
    NSString *getType = [getDic objectForKey:@"type"];
    NSString *getValue = [getDic objectForKey:@"value"];
    
    if ([getType isEqualToString:@"price"]) {
        NSString *str = @"￥";
        priceStr = getValue;
        
        priceTableViewCell *cell= (priceTableViewCell *)[releaseTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
        cell.priceLabel.text = [str stringByAppendingString:getValue];
    }  else if ([getType isEqualToString:@"time"]) {
        
        timeStr = getValue;
        
        selectTimeTableViewCell *cell= (selectTimeTableViewCell *)[releaseTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
        cell.timeLabel.text = timeStr;
    }
    
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)send:(id)sender {
    //[self sendMgs];
    confirmViewController *confirmVC = [[confirmViewController alloc] init];
    [self presentViewController:confirmVC animated:YES completion:nil];
    
    titleTextField = (UITextField *)[releaseTableView viewWithTag:1];
    NSLog(@"get text = %@",titleTextField.text);
    
    detailsTextView = (UITextView *)[releaseTableView viewWithTag:2];
    NSLog(@"get text from textview = %@", detailsTextView.text);
    releaseDetailsTableViewCell *cell =(releaseDetailsTableViewCell*)[releaseTableView viewWithTag:108];
    confirmVC.pics = cell.getImageArray;
    confirmVC.money = priceStr;
    confirmVC.phone = phone;
    confirmVC.news = detailsTextView.text;
//    NSLog(@"  1111-- %@--1111",confirmVC.news );

}

//点击阴影取消事件
-(void)Actiondo:(id)sender{
    [shadowView removeFromSuperview];
    [datePicker removeFromSuperview];
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 1;
            break;
        default:
            return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 4.0f;
    } else if (section == 1) {
        return 6.0f;
    } else {
        return 60.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 1.0f;
    } else {
        return 1.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            return 235.0f;
            break;
        }
        default:
            return 48.0f;
    }
    
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    if (section == 0) {
        view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 4);
    } else if (section == 1) {
        view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 6);
    } else {
        view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60);
    }
    
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellTableIdentifier=[[NSString alloc] initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)indexPath.row];
    
    switch (indexPath.section) {
        case 0:
        {
            releaseDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"releaseDetailsTableViewCell" owner:self options:nil] lastObject];
                cell.tag = 108;

            }
            
            [cell.placeButton setTitle:placeStr forState:UIControlStateNormal];
            return cell;
            
            break;
        }
        case 1:
        {
            if (indexPath.row == 0) {
                
                priceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"priceTableViewCell" owner:self options:nil] lastObject];
                }
                cell.priceLabel.text = priceStr;
                
                return cell;
                
            } else if (indexPath.row == 1) {
                selectTimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"selectTimeTableViewCell" owner:self options:nil] lastObject];
                }
                
                cell.timeLabel.text = timeStr;
                
                return cell;
                
            } else if (indexPath.row == 2) {

                labelsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"labelsTableViewCell" owner:self options:nil] lastObject];
                }
                
                return cell;
                
            }
            break;
        }
        case 2:
        {
            urgentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"urgentTableViewCell" owner:self options:nil] lastObject];
            }
            
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
    myRow = indexPath.row;
    mySection = indexPath.section;
    
    switch (mySection) {
        case 1:
        {
            if (myRow == 0) {

                priceViewController *priceVC = [[priceViewController alloc] init];
                priceVC.price = priceStr;
                
                //[self.navigationController pushViewController:priceVC animated:YES];
                [self presentViewController:priceVC animated:YES completion:nil];
                
            } else if (myRow == 1) {
                selectTimeViewController *selectTimeVC = [[selectTimeViewController alloc] init];
                
                //[self.navigationController pushViewController:selectTimeVC animated:YES];
                [self presentViewController:selectTimeVC animated:YES completion:nil];
            } else if (myRow == 2) {
                labelsViewController *labelsVC = [[labelsViewController alloc] init];
                
                [self presentViewController:labelsVC animated:YES completion:nil];
            }
            break;
        }
        case 2:
        {
            
            break;
        }
        default:
            break;
    }
    
}

// 点击编辑区以外的地方 取消键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([shadowView isExclusiveTouch]) {
        NSLog(@"hello");
    }
}

- (void)sendMgs
{
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.delegate = self;
    
    //上传至服务器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"d6089681f79c7627bbac829307e041a7" forHTTPHeaderField:@"x-timebuy-sid"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //2.设置登录参数
    NSDictionary *dict = @{ @"userid":[userConfiguration getStringValueForConfigurationKey:@"userId"],
                            @"pic":@"123",
                            @"phone":phone,
                            @"news":@"测试内容",
                            @"starttime":timeStr,
                            //@"finishtime":finishTimeStr,
                            @"label":@"测试label",
                            @"money":priceStr,
                            @"coordname":placeStr,
                            @"coordx":@"30.124546",
                            @"coordy":@"120.214126"};
    
    /*
     NSDictionary *dict = @{ @"userId":@"27",
     @"headIcon":@"123",
     @"nickName":@"oj",
     @"sex":@"0",
     @"birthDay":@"2011-10-2",
     @"profession":@"123",
     @"address":@"111",
     @"phone":@"18767122229",
     @"signature":@"hello"};
     */
    //3.请求
    NSString *url = [NSString stringWithFormat:@"%@%@",timebuyUrl,@"news/info"];
    [manager GET:url parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"GET --> %@", responseObject); //自动返回主线程
        
        [HUD hide:YES];
        NSString *getStatus = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"success"]];
        NSString *getCode = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"code"]];
        if ([getStatus isEqualToString:@"1"] && [getCode isEqualToString:@"1000"]) {
            
            HUDinSuccess = [[MBProgressHUD alloc] initWithView:self.view];
            [self.view addSubview:HUDinSuccess];
            HUDinSuccess.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
            HUDinSuccess.mode = MBProgressHUDModeCustomView;
            HUDinSuccess.delegate = self;
            HUDinSuccess.labelText = @"发布成功";
            [HUDinSuccess show:YES];
            [HUDinSuccess hide:YES afterDelay:1];
            
        } else if ([getStatus isEqualToString:@"0"] && [getCode isEqualToString:@"2005"]) {
            [self showErrorWithTitle:@"发布失败" WithMessage:@"错误"];
        } else {
            [self showErrorWithTitle:@"发布失败" WithMessage:@"系统错误"];
        }
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        [HUD hide:YES];
        [self showErrorWithTitle:@"发布失败" WithMessage:@"网络连接失败，请检查网络设置"];
    }];
}

#pragma mark - MBProgressHUDDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [hud removeFromSuperview];
    
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
