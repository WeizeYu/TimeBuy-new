//
//  welfareViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/10/6.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "welfareViewController.h"

@interface welfareViewController ()

@end

@implementation welfareViewController

@synthesize welfareTableView;
@synthesize segmentedControl;

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
    welfareTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"公益";
    
    //自定义返回按钮
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"箭头9x17px"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem  = backButton;
    
    //welfareTableView.hidden = YES;
    
    _tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    _tapGr.cancelsTouchesInView = NO;
    _tapGr.numberOfTapsRequired = 1;
    _tapGr.delegate = self;
    [self.tabBarController.view addGestureRecognizer:_tapGr];
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
    
    for (UIView *v in self.tabBarController.view.subviews) {
        //v.hidden = YES;
        
        if ([v isKindOfClass:[UIButton class]] || [v isKindOfClass:[UITabBar class]]) {
            v.hidden = NO;
        }
        NSLog(@"v = %@",v);
    }
}

-(void)viewTapped:(UITapGestureRecognizer*)tapGr
{
    
}

- (void)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - tabelview Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1.0f;
    } else {
        return 40.0f;
    }
    
    return 0.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 238.0f;
    } else {
        return 288.0f;
    }
    
    return 0.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    } else {
        return 10;
    }
    
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"64个项目", @"55个团队", @"32000小时"]];
        [segmentedControl setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        segmentedControl.selectionIndicatorHeight = 4.0f;
        segmentedControl.backgroundColor = [UIColor whiteColor];
        segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
        segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:12.0 / 255.0f green:228.0 / 255.0f blue:225.0 / 255.0f alpha:1];
        segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        segmentedControl.selectedSegmentIndex = HMSegmentedControlNoSegment;
        segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        segmentedControl.shouldAnimateUserSelection = NO;
        segmentedControl.tag = 2;
        //[self.view addSubview:segmentedControl];
        
        segmentedControl.selectedSegmentIndex = 0;
        
        [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
        return segmentedControl;
    }
    
    return nil;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger row=[indexPath row];
    NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    
    if (indexPath.section == 0) {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
        }
        
        UIImageView *titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 238.0)];
        titleImageView.image = [UIImage imageNamed:@"111.png"];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 230) / 2, 138, 230, 50)];
        titleLabel.text = @"时贝公益计划";
        titleLabel.font = [UIFont fontWithName:@"Hanzipen TC" size:36.0f];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 230) / 2, 196, 230, 18)];
        detailLabel.text = @"用你我的时间创造不一样的未来！";
        detailLabel.textAlignment = NSTextAlignmentCenter;
        detailLabel.font = [UIFont fontWithName:@"Hanzipen TC" size:14.0f];
        detailLabel.textColor = [UIColor whiteColor];
        
        [cell addSubview:titleImageView];
        [cell addSubview:titleLabel];
        [cell addSubview:detailLabel];
        
        
    } else {
        welfareTableViewCell *cell = (welfareTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
        
        if (cell == nil) {
            
            cell.contentView.frame = cell.bounds;
            cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"welfareTableViewCell" owner:self options:nil] lastObject];
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
        return cell;
    }
    
    //cell.textLabel.text = @"Hello";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    welfareDetailsViewController *welfareDetailsVC = [[welfareDetailsViewController alloc] init];
    [self.navigationController pushViewController:welfareDetailsVC animated:YES];
    
}

#pragma mark - segementCotoll button
- (void)segmentedControlChangedValue:(HMSegmentedControl *)sc {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)sc.selectedSegmentIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*c
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
