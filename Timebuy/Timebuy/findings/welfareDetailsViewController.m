//
//  welfareDetailsViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/10/6.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "welfareDetailsViewController.h"

@interface welfareDetailsViewController ()

@end

@implementation welfareDetailsViewController

@synthesize welfareDetailsTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    welfareDetailsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"公益详情";
    
    UIView *sendView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 64 - 64, [UIScreen mainScreen].bounds.size.width, 64)];
    sendView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:sendView];
    
    sendButton = [[UIButton alloc] initWithFrame:CGRectMake(13, 12, [UIScreen mainScreen].bounds.size.width - 13 * 2, 40)];
    [sendButton setTitle:@"我要购买" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendButton setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:80.0 / 255.0f green:227.0 / 255.0f blue:194.0 / 255.0f alpha:1] size:sendButton.bounds.size] forState:UIControlStateNormal];
    [sendButton setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor] size:sendButton.bounds.size] forState:UIControlStateDisabled];
    
    [sendButton addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
    [sendView addSubview:sendButton];
    sendButton.layer.masksToBounds = YES;
    sendButton.layer.cornerRadius = 3;
    
    [sendButton setEnabled:YES];
    
    for (UIView *v in self.tabBarController.view.subviews) {
        if ([v isKindOfClass:[UIButton class]] || [v isKindOfClass:[UITabBar class]]) {
            v.hidden = YES;
        }
    }
    self.tabBarController.tabBar.hidden = YES;
}

- (void)send:(id)sender {
    //[self sendMgs];
}

#pragma mark - tableViewdelgate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    
    switch (row) {
        case 0:
        {
            if (cell == nil) {
                
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
                
            }
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 183)];
            imageView.image = [UIImage imageNamed:@"sucai.png"];
            
            [cell addSubview:imageView];
            return cell;
            break;
        }
        case 1:
        {
            welfareProgressTableViewCell *cell = (welfareProgressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"welfareProgressTableViewCell" owner:self options:nil] lastObject];
            }
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
            break;
        }
        case 2:
        {
            programInfoTableViewCell *cell = (programInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"programInfoTableViewCell" owner:self options:nil] lastObject];
            }
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
            break;
        }
        case 3:
        {
            programDetailsTableViewCell *cell = (programDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"programDetailsTableViewCell" owner:self options:nil] lastObject];
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
