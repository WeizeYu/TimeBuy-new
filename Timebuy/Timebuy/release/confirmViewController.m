//
//  confirmViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/10/4.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "confirmViewController.h"
#import "AFNetworking.h"
#import "userConfiguration.h"

@interface confirmViewController ()<MBProgressHUDDelegate>

@end

@implementation confirmViewController

@synthesize confirmTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    confirmTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *sendView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 64, [UIScreen mainScreen].bounds.size.width, 64)];
    sendView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:sendView];
    
    sendButton = [[UIButton alloc] initWithFrame:CGRectMake(13, 12, [UIScreen mainScreen].bounds.size.width - 13 * 2, 40)];
    [sendButton setTitle:@"确定支付" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendButton setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:80.0 / 255.0f green:227.0 / 255.0f blue:194.0 / 255.0f alpha:1] size:sendButton.bounds.size] forState:UIControlStateNormal];
    [sendButton setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor] size:sendButton.bounds.size] forState:UIControlStateDisabled];
    
    [sendButton addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
    [sendView addSubview:sendButton];
    sendButton.layer.masksToBounds = YES;
    sendButton.layer.cornerRadius = 3;
    
    [sendButton setEnabled:YES];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)send:(id)sender {
    //[self sendMgs];
}

-(void)sendMgs{
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
    
    //  NSDictionary *params = [NSMutableDictionary dictionary];
//    NSLog(@"   %lu",(unsigned long)self.phone );
    
    NSDictionary *dict = @{ @"userid":@"27",
                            @"pics":self.pics,
                            @"phone":self.phone,
                            @"news":self.news,
                            @"starttime":@"2014-5-5 14",
                            //@"finishtime":finishTimeStr,
                            @"label":@"测试label",
                            @"money":self.money,
                            @"coordname":@"小和山",
                            @"coordx":@"30.124546",
                            @"coordy":@"120.214126"};
    
    
    //         NSDictionary *dict = @{ @"userId":@"27",
    //         @"news":@"123",
    //         @"nickName":@"oj",
    //         @"sex":@"0",
    //         @"birthDay":@"2011-10-2",
    //         @"profession":@"123",
    //         @"address":@"111",
    //         @"phone":@"18767122229",
    //         @"signature":@"hello"};
    
    //3.请求
    [manager GET:@"http://192.168.8.102:8080/timebuy/news/info" parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"GET --> %@", responseObject); //自动返回主线程
        
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

-(void)showErrorWithTitle:(NSString *)titile WithMessage:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:titile message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - tableViewDelege
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 4;
    } else {
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==  0) {
        switch (indexPath.row) {
            case 0:
                return 35.0f;
                break;
            case 1:
                return 190.0f;
                break;
            default:
                return 44.0f;
                break;
        }
    } else {
        switch (indexPath.row) {
            case 0:
                return 35.0f;
                break;
                
            default:
                return 44.0f;
                break;
        }
    }
    
    return 0.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row=[indexPath row];
    
    //需要对每个cell进行标识，不然刷新会有问题
    NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
    
    if (indexPath.section ==  0) {
        switch (indexPath.row) {
            case 0: {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                
                NSString *payID = @"201509221112312";
                NSString *payTitle = @"订单号：";
                cell.textLabel.text = [payTitle stringByAppendingString:payID];
                cell.textLabel.font = [UIFont systemFontOfSize:12.0f];
                cell.textLabel.textColor = [UIColor lightGrayColor];
                
                return cell;
                
                break;
            }
            case 1: {
                confirmDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"confirmDetailsTableViewCell" owner:self options:nil] lastObject];
                }
                //cell.priceLabel.text = priceStr;
                //cell.textLabel.text = @"Hello";
                
                return cell;
                break;
            }
            case 2: {
                confirmTimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"confirmTimeTableViewCell" owner:self options:nil] lastObject];
                }
                //cell.priceLabel.text = priceStr;
                //cell.textLabel.text = @"Hello";
                
                return cell;
                break;
            }
            case 3: {
                confirmPriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"confirmPriceTableViewCell" owner:self options:nil] lastObject];
                }
                //cell.priceLabel.text = priceStr;
                //cell.textLabel.text = @"Hello";
                return cell;
                break;
            }
            default:
                break;
        }
    } else {
        switch (indexPath.row) {
            case 0: {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                
                cell.textLabel.text = @"支付方式";
                cell.textLabel.font = [UIFont systemFontOfSize:18.0f];
                cell.textLabel.textColor = [UIColor blackColor];
                
                return cell;
                break;
            }
            case 1: {
                myWalletTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"myWalletTableViewCell" owner:self options:nil] lastObject];
                }
                //cell.priceLabel.text = priceStr;
                //cell.textLabel.text = @"Hello";
                return cell;
                break;
            }
            case 2: {
                alipayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"alipayTableViewCell" owner:self options:nil] lastObject];
                }
                //cell.priceLabel.text = priceStr;
                //cell.textLabel.text = @"Hello";
                return cell;
                break;
            }
            default: {
                
                break;
            }
        }
    }
    
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == 1) {
            UIImageView *mywalletImgView = (UIImageView *)[confirmTableView viewWithTag:101];
            UIImageView *alipayImgView = (UIImageView *)[confirmTableView viewWithTag:102];
            
            mywalletImgView.hidden = NO;
            alipayImgView.hidden = YES;
        } else if (indexPath.row == 2) {
            UIImageView *mywalletImgView = (UIImageView *)[confirmTableView viewWithTag:101];
            UIImageView *alipayImgView = (UIImageView *)[confirmTableView viewWithTag:102];
            
            mywalletImgView.hidden = YES;
            alipayImgView.hidden = NO;
        }
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
