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
    
    self.taskModel = [[taskModel alloc] init];
    self.taskModel.taskCoordx = [NSString stringWithFormat:@"%f",self.location.latitude];
    self.taskModel.taskCoordy = [NSString stringWithFormat:@"%f",self.location.longitude];
    self.taskModel.taskUserCoordx = [NSString stringWithFormat:@"%f",self.userLocation.coordinate.latitude];
    self.taskModel.taskUserCoordy = [NSString stringWithFormat:@"%f",self.userLocation.coordinate.longitude];
    self.taskModel.taskCoordname = @"杭州小和山";
    //self.taskModel.taskCoordname = self.locationName;
    self.taskModel.taskMoney = @"请输入价格";
    
    timeStr = @"请确定合适开始和结束";
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
    
//    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
//    [releaseTableView addGestureRecognizer:tapGestureRecognizer];
    
    //定位地址名称
    //self.taskModel.taskCoordname = locationName;
    
}

- (void)recModifyInRelease:(NSNotification *)notification {
    NSDictionary *getDic = [notification userInfo];
    NSString *getType = [getDic objectForKey:@"type"];
    NSString *getValue = [getDic objectForKey:@"value"];
    
    if ([getType isEqualToString:@"price"])
    {
        NSString *str = @"￥";
        self.taskModel.taskMoney = getValue;
        
        priceTableViewCell *cell= (priceTableViewCell *)[releaseTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
        cell.priceLabel.text = [str stringByAppendingString:getValue];
    }  else if ([getType isEqualToString:@"time"])
    {
        
        timeStr = getValue;
        
        selectTimeTableViewCell *cell= (selectTimeTableViewCell *)[releaseTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
        cell.timeLabel.text = timeStr;
        
        self.taskModel.taskStarttime  = [getDic objectForKey:@"startTime"];
        self.taskModel.taskFinishtime = [getDic objectForKey:@"endTime"];
    }
    
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)send:(id)sender {
    //[self sendMgs];
    
    if ([self.taskModel.taskMoney isEqualToString:@"请输入价格"] || [timeStr isEqualToString:@"请输入价格"] || [self.taskModel.taskNews isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入相应内容"];
    } else {
        [self sendMgs];
    }
    
//    confirmViewController *confirmVC = [[confirmViewController alloc] init];
//    [self presentViewController:confirmVC animated:YES completion:nil];
//    
//    detailsTextView = (UITextView *)[releaseTableView viewWithTag:1102];
//    
//    if (![detailsTextView.text isEqualToString:@""]) {
//        
//        self.taskModel.taskNews = detailsTextView.text;
//        
////        releaseDetailsTableViewCell *cell =(releaseDetailsTableViewCell*)[releaseTableView viewWithTag:108];
////        confirmVC.pics = cell.getImageArray;
////        confirmVC.money = self.taskModel.taskMoney;
////        confirmVC.phone = phone;
////        confirmVC.news = detailsTextView.text;
////        //NSLog(@"  1111-- %@--1111",confirmVC.news );
//    } else {
//        
//    }

}

//点击阴影取消事件
-(void)Actiondo:(id)sender{
    [shadowView removeFromSuperview];
    [datePicker removeFromSuperview];
}

#pragma mark - tap view
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    detailsTextView = (UITextView *)[releaseTableView viewWithTag:1102];
    
    if (![tap.view isEqual:detailsTextView]) {
        [detailsTextView resignFirstResponder];
    }
    
    //[textFiled resignFirstResponder];
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
            
            [cell.placeButton setTitle:self.taskModel.taskCoordname forState:UIControlStateNormal];
            
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
                cell.priceLabel.text = self.taskModel.taskMoney;
                
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
    
    //点击后灰色消失
    [releaseTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (mySection) {
        case 1:
        {
            if (myRow == 0) {

                priceViewController *priceVC = [[priceViewController alloc] init];
                
                if (![self.taskModel.taskMoney isEqual:@"请输入价格"]) {
                    priceVC.price = self.taskModel.taskMoney;
                }
                
                //[self.navigationController pushViewController:priceVC animated:YES];
                [self presentViewController:priceVC animated:YES completion:nil];
                
            } else if (myRow == 1) {
                selectTimeViewController *selectTimeVC = [[selectTimeViewController alloc] init];
                selectTimeVC.startTimeStr = self.taskModel.taskStarttime;
                selectTimeVC.endTimeStr   = self.taskModel.taskFinishtime;
                
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
    
    detailsTextView = (UITextView *)[releaseTableView viewWithTag:1102];
    
    [detailsTextView resignFirstResponder];
}

- (void)sendMgs
{
    //获取
    NSDate *curDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *curDateTime = [formatter stringFromDate:curDate];
    
    //上传至服务器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"d6089681f79c7627bbac829307e041a7" forHTTPHeaderField:@"x-timebuy-sid"];
    
    //2.设置登录参数
    NSDictionary *dict = @{ @"userid":[userConfiguration getStringValueForConfigurationKey:@"userId"],
                            @"phone":phone,
                            @"news":@"测试内容",
                            @"starttime":self.taskModel.taskStarttime,
                            @"finishtime":self.taskModel.taskFinishtime,
                            @"label":@"1",   // 需要返回数字
                            @"money":self.taskModel.taskMoney,
                            @"coordname":self.taskModel.taskCoordname,
                            @"coordx":@"30.124546",
                            @"coordy":@"120.214126",
                            @"timeNow":curDateTime,
                            @"coordnameNow":@"测试当前用户地点",
                            @"coordxNow":@"30.12122",
                            @"coordyNow":@"120.12122",
                            @"worry":@"0"
                            };
    
    [SVProgressHUD showWithStatus:@"发布中..."];
    
    //3.请求
    NSString *url = [NSString stringWithFormat:@"%@%@",timebuyUrl,@"news/info"];
    
    NSData *data1 = UIImagePNGRepresentation([UIImage imageNamed:@"showImg.png"]);
    //NSData *data2 = UIImagePNGRepresentation([UIImage imageNamed:@"showImg2.png"]);
    //NSData *data3 = UIImagePNGRepresentation([UIImage imageNamed:@"showImg3.png"]);
    
    [manager POST:url parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:data1 name:@"pics" fileName:@"1230" mimeType:@"image/png"];
        //[formData appendPartWithFileData:data2 name:@"pics" fileName:@"1231" mimeType:@"image/png"];
        //[formData appendPartWithFileData:data3 name:@"pics" fileName:@"1232" mimeType:@"image/png"];
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"POST --> %@", responseObject); //自动返回主线程
        NSString *getStatus = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"success"]];
        NSString *getCode = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"code"]];
        NSString *getMsg = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"msg"]];
        
        if ([getStatus isEqualToString:@"1"] && [getCode isEqualToString:@"1000"]) {
            //[SVProgressHUD dismiss];
            
            [SVProgressHUD showSuccessWithStatus:@"发布成功"];

        } else {
            [SVProgressHUD showErrorWithStatus:getMsg];
        }
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        //[SVProgressHUD show];
        //[SVProgressHUD dismissWithError:error.description afterDelay:1.0];
        [SVProgressHUD showErrorWithStatus:error.description];
    }];
    
}

-(void)showErrorWithTitle:(NSString *)titile WithMessage:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:titile message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

# pragma mark - image background
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
