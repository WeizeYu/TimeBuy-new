//
//  welfarePayViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/10/8.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "welfarePaymentViewController.h"

@interface welfarePaymentViewController ()

@end

@implementation welfarePaymentViewController
@synthesize welfarePayTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    welfarePayTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *sendView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 64 - 64, [UIScreen mainScreen].bounds.size.width, 64)];
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

- (void)send:(id)sender {
    //[self sendMgs];
}

#pragma mark - tableViewDelege
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 2;
    } else {
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==  0) {
        switch (indexPath.row) {
            case 0:
                return 170.0f;
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
                payDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"payDetailsTableViewCell" owner:self options:nil] lastObject];
                }
                
                cell.endNumber = 960;
                
                return cell;
                break;
            }
            case 1: {
                welfarePriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"welfarePriceTableViewCell" owner:self options:nil] lastObject];
                }
                
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
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            welfareChangePriceViewController *welfareChangePriceVC = [[welfareChangePriceViewController alloc] init];
            [self.navigationController pushViewController:welfareChangePriceVC animated:YES];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 1) {
            UIImageView *mywalletImgView = (UIImageView *)[welfarePayTableView viewWithTag:101];
            UIImageView *alipayImgView = (UIImageView *)[welfarePayTableView viewWithTag:102];
            
            mywalletImgView.hidden = NO;
            alipayImgView.hidden = YES;
        } else if (indexPath.row == 2) {
            UIImageView *mywalletImgView = (UIImageView *)[welfarePayTableView viewWithTag:101];
            UIImageView *alipayImgView = (UIImageView *)[welfarePayTableView viewWithTag:102];
            
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
