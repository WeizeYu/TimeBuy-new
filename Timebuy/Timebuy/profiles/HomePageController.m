//
//  HomePageController.m
//  Timebuy
//
//  Created by He yang on 15/10/14.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//
#import "ImageCell.h"
#import "HomePageController.h"
#import "HeaderCell.h"
#import "InfoViewController.h"

@interface HomePageController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *homePageTableView;

@end

@implementation HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.homePageTableView.dataSource = self;
    self.homePageTableView.delegate = self;
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"箭头9x17px"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem  = backButton;
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editing)];
    self.navigationItem.rightBarButtonItem = editButton;
    self.hidesBottomBarWhenPushed=YES;

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.homePageTableView reloadData];
}

-(void)editing{
    
    InfoViewController *infoVC = [[InfoViewController alloc] init];
    [self.navigationController pushViewController:infoVC animated:YES];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        HeaderCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"HeaderCell" owner:nil options:nil] lastObject];
        cell.backgroundColor = [UIColor blueColor];
        cell.iconView.layer.cornerRadius = cell.iconView.bounds.size.width /2 ;
        cell.iconView.layer.masksToBounds = YES;
        [self cellWithData:cell];
        return cell;
    }
    static NSString *ID = @"ID";
    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ImageCell" owner:nil options:nil] lastObject];
        
    }
    return cell;
}


-(void)cellWithData:(HeaderCell *)cell{
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconData"];
    if (data) {
        UIImage *image = [UIImage imageWithData:data];
        cell.iconView.image = image;
    }
    cell.nameLabel.text = array[0];
    cell.ageLabel.text = array[2];
    cell.identifierLabel.text = array[3];

    
}



//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 312;
//}
//
//
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil] lastObject];
//    return view;
//}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 312;
    }
    return 226;
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
