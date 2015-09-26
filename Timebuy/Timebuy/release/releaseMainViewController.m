//
//  releaseInfoViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "releaseMainViewController.h"

@interface releaseMainViewController ()

@end

@implementation releaseMainViewController

@synthesize releaseTableView;
@synthesize datePicker;
@synthesize location;

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recModify:) name:@"passModifyInRelease" object:nil];
    
    myRow = -1;
    
    placeStr = @"杭州小和山";
    startTimeStr = @"";
    finishTimeStr = @"";
    priceStr = @"0.0";
    phoneStr = @"18767122229";
    
    shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 275 + 64)];
    shadowView.backgroundColor = [UIColor blackColor];
    shadowView.alpha = 0.45f;
    //[self.navigationController.view addSubview:shadowView];
    
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actiondo:)];
    
    [shadowView addGestureRecognizer:tapGesture];
    
    releaseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    releaseTableView.tag = 0;
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 275, [UIScreen mainScreen].bounds.size.width, 275)];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.minuteInterval = 30;
    datePicker.backgroundColor = [UIColor whiteColor];
    NSDate *minDate = [NSDate date];
    datePicker.minimumDate = minDate;
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
    //[shadowView addSubview:datePicker];
    
    //UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    //testView.backgroundColor = [UIColor blackColor];
    
    //[datePicker addSubview:testView];
    UIView *sendView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 64 - 64, [UIScreen mainScreen].bounds.size.width, 64)];
    sendView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:sendView];
    
    sendButton = [[UIButton alloc] initWithFrame:CGRectMake(13, 12, [UIScreen mainScreen].bounds.size.width - 13 * 2, 40)];
    [sendButton setTitle:@"确定发布" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[sendButton setBackgroundColor:[UIColor colorWithRed:80.0 / 255.0f green:227.0 / 255.0f blue:194.0 / 255.0f alpha:1]];
    //[sendButton setTintColor:[UIColor colorWithRed:80.0 / 255.0f green:227.0 / 255.0f blue:194.0 / 255.0f alpha:1]];
    [sendButton setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:80.0 / 255.0f green:227.0 / 255.0f blue:194.0 / 255.0f alpha:1] size:sendButton.bounds.size] forState:UIControlStateNormal];
    [sendButton setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor] size:sendButton.bounds.size] forState:UIControlStateDisabled];
    
    [sendButton addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
    [sendView addSubview:sendButton];
    sendButton.layer.masksToBounds = YES;
    sendButton.layer.cornerRadius = 3;
    
    [sendButton setEnabled:YES];
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

- (void)send:(id)sender {
    //[self sendMgs];
    
    titleTextField = (UITextField *)[releaseTableView viewWithTag:1];
    NSLog(@"get text = %@",titleTextField.text);
    
    detailsTextView = (UITextView *)[releaseTableView viewWithTag:2];
    NSLog(@"get text from textview = %@", detailsTextView.text);
}

- (void)dateChanged:(id)sender {
    UIDatePicker* control = (UIDatePicker*)sender;
    NSDate* date = control.date;
    //NSLog(@"%@",date);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *curDateTime = [formatter stringFromDate:date];
    
    if (myRow == 2) {
        startTimeStr = curDateTime;
        
        /*
        detailsTableViewCell *cell= (detailsTableViewCell *)[releaseTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
        cell.timeLabel.text = curDateTime;
        */
        
    } else {
        finishTimeStr = curDateTime;
        
        /*
        detailsTableViewCell *cell= (detailsTableViewCell *)[releaseTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
        cell.timeLabel.text = curDateTime;
        */
    }
    
}

- (void)recModify:(NSNotification *)notification
{
    NSDictionary *getDic = [notification userInfo];
    NSString *getType = [getDic objectForKey:@"type"];
    NSString *getValue = [getDic objectForKey:@"value"];
    
    if ([getType isEqualToString:@"place"]) {
        
        placeStr = getValue;
        
        //placeTableViewCell *cell= (placeTableViewCell *)[releaseTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        //[cell.placeButton setTitle:getValue forState:UIControlStateNormal];
        
    } else if ([getType isEqualToString:@"price"]) {
        NSString *str = @"￥";
        priceStr = getValue;
        
        priceTableViewCell *cell= (priceTableViewCell *)[releaseTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
        cell.priceLabel.text = [str stringByAppendingString:getValue];

    } else if ([getType isEqualToString:@"time"]) {
        
        NSString *getValue2 = [getDic objectForKey:@"value2"];
        
        startTimeStr = getValue;
        finishTimeStr = getValue2;
        
        phoneStr = getValue;
        
        /*
        details2TableViewCell *cell= (details2TableViewCell *)[releaseTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0]];
        cell.myDetailLabel.text = getValue;
        */
    }
    //self.navigationItem.rightBarButtonItem.enabled = YES;
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
            return 2;
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
    } else
    {
        return 6.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 67.0f;
    } else {
        return 1.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0) {
                return 48.0f;
            } else {
                return 235.0f;
            }
            break;
        }
        default:
            return 48.0f;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellTableIdentifier=[[NSString alloc] initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)indexPath.row];

    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0) {
                releaseTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"releaseTitleTableViewCell" owner:self options:nil] lastObject];
                }
                
                return cell;
            } else {
                releaseDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"releaseDetailsTableViewCell" owner:self options:nil] lastObject];
                }
                
                return cell;
            }
            break;
        }
        case 1:
        {
            if (indexPath.row == 0) {
                changePriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"changePriceTableViewCell" owner:self options:nil] lastObject];
                }
                
                cell.myTableView = releaseTableView;
                
                return cell;
                
            } else if (indexPath.row == 1) {
                priceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"priceTableViewCell" owner:self options:nil] lastObject];
                }
                
                NSString *str = @"￥";
                cell.priceLabel.text = [str stringByAppendingString:priceStr];
                
                return cell;
                
            } else if (indexPath.row == 2) {
                selectTimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"selectTimeTableViewCell" owner:self options:nil] lastObject];
                }
                
                return cell;
            }
            break;
        }
        case 2:
        {
            labelsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"labelsTableViewCell" owner:self options:nil] lastObject];
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
                
                //NSLog(@"get %d",changePriceSwitch.on);
                
            } else if (myRow == 1) {
                
                UISwitch *changePriceSwitch = (UISwitch *)[releaseTableView viewWithTag:3];
                if (changePriceSwitch.on == 0) {
                    priceViewController *priceVC = [[priceViewController alloc] init];
                    priceVC.price = priceStr;
                    
                    [self.navigationController pushViewController:priceVC animated:YES];
                }
                
            } else if (myRow == 2) {
                selectTimeViewController *selectTimeVC = [[selectTimeViewController alloc] init];
                
                [self.navigationController pushViewController:selectTimeVC animated:YES];
                break;
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
    
    /*
    switch (row) {
        case 1:
        {
            placeViewController *placeVC = [[placeViewController alloc] init];
            placeVC.place = @"杭州小和山";
            
            [self.navigationController pushViewController:placeVC animated:YES];
            break;
        }
        case 2:
        {
            [self.view addSubview:datePicker];
            [self.navigationController.view addSubview:shadowView];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            //NSString *curDateTime = [formatter stringFromDate:[NSDate date]];
            
            break;
        }
        case 3:
        {
            [self.view addSubview:datePicker];
            [self.navigationController.view addSubview:shadowView];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            //NSString *curDateTime = [formatter stringFromDate:[NSDate date]];
            
            break;
        }
        case 4:
        {
            priceViewController *priceVC = [[priceViewController alloc] init];
            priceVC.price = priceStr;
            
            [self.navigationController pushViewController:priceVC animated:YES];
            break;
        }
        case 5:
        {
            phoneViewController *phoneVC = [[phoneViewController alloc] init];
            phoneVC.phone = phoneStr;
            [self.navigationController pushViewController:phoneVC animated:YES];
                        
            break;
        }
        default:
            break;
    }
    */
    
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
                            @"phone":phoneStr,
                            @"news":@"测试内容",
                            @"starttime":startTimeStr,
                            @"finishtime":finishTimeStr,
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
    [manager GET:@"http://192.168.8.102:8080/timebuy/news/info" parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
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
