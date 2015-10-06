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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
        
        [cell addSubview:titleImageView];
        
    } else {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
        }
    }
    
    //cell.textLabel.text = @"Hello";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
