//
//  profilesRootViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/9/22.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "profilesRootViewController.h"
#import "waitTableViewCell.h"
@interface profilesRootViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *rootTableview;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment;
@property (nonatomic) NSMutableArray *waitArray;//等待中数据数组
@property (nonatomic) NSMutableArray *ingArray;//进行中数据数组
@property (nonatomic) NSMutableArray *doneArray;//已完成数据数组
@property (nonatomic) NSMutableArray *commitArray;//申诉中数据数组
@property (nonatomic) NSMutableArray *cancelArray;//已取消数据数组
@end
@implementation profilesRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我发布的";
    self.rootTableview.dataSource=self;
    self.rootTableview.delegate=self;
    // Do any additional setup after loading the view from its nib.
}
-(void)CreateData{
    
}
#pragma ---------------------TableviewDelegate---------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier =[NSString stringWithFormat:@"Cell%ld",indexPath.row];
    waitTableViewCell *cell = (waitTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.backgroundColor=[UIColor whiteColor];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    if (cell == nil) {
        cell.contentView.frame = cell.bounds;
        cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        cell = [[[NSBundle mainBundle] loadNibNamed:@"waitTableViewCell" owner:self options:nil] lastObject];
        
    }
    // Configure the cell.
    return cell;

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
