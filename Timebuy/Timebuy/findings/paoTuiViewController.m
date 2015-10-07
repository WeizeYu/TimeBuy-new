//
//  paoTuiViewController.m
//  Timebuy
//
//  Created by yuweize on 15/10/7.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "paoTuiViewController.h"
#import "paoTuiTableViewCell.h"
@interface paoTuiViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *paoTuiTableView;

@end

@implementation paoTuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"跑腿";
    self.paoTuiTableView.delegate=self;
    self.paoTuiTableView.dataSource=self;
    // Do any additional setup after loading the view from its nib.
}
#pragma ----------------------------TableviewDelegate---------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;//self.dataSourceDic.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier =[NSString stringWithFormat:@"paotuiCell%ld",(long)indexPath.row];
    paoTuiTableViewCell *paocell = (paoTuiTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (paocell == nil) {
        paocell.contentView.frame = paocell.bounds;
        paocell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        
        paocell = [[[NSBundle mainBundle] loadNibNamed:@"paoTuiTableViewCell" owner:self options:nil] lastObject];
    }
    [paocell setAccessoryType:UITableViewCellAccessoryNone];
    [paocell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return paocell;
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
