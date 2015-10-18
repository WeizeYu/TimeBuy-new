//
//  SexController.m
//  Timebuy
//
//  Created by He yang on 15/10/14.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "SexController.h"
#import "MTConst.h"
#import "AFHTTPRequestOperationManager.h"

@interface SexController ()
@property (weak, nonatomic) IBOutlet UIView *manView;
@property (weak, nonatomic) IBOutlet UIView *womenView;
@property(nonatomic,copy)NSString *selectedSex;

@end

@implementation SexController

-(void)setSelectedSex:(NSString *)selectedSex{
    _selectedSex = selectedSex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manLabel.text = @"男";
    self.womanLabel.text = @"女";
    self.womanMarkView.hidden = YES;
    self.selectedSex = self.manLabel.text;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicked:)];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicked:)];
    [self.manView addGestureRecognizer:tap];
    [self.womenView addGestureRecognizer:tap1];
    self.view.backgroundColor = [UIColor colorWithRed:240 green:239 blue:244 alpha:1];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"箭头9x17px"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem  = backButton;
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(confirm)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    // Do any additional setup after loading the view from its nib.
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)confirm{
    NSDictionary *params = [self appendingTheParams];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:@"%@user/update",timebuyUrl];
//        [manager POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//             NSLog(@" 111---  %@ ---111",responseObject );
//        } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
//    
//        }];
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconData"];
        [formData appendPartWithFileData:data name:@"headIcon" fileName:@"123321213.jpg" mimeType:@"image/jpeg"];
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@" 111---  %@ ---111",responseObject );
        
        [[NSNotificationCenter defaultCenter] postNotificationName:SexDidChangedNotification object:nil userInfo:@{SexKey : _selectedSex}];
      
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
    }];
//
   
 

    
}


-(void)clicked:(UIGestureRecognizer *)gesture{
    
    if (gesture.view == self.manView) {
        self.womanMarkView.hidden = YES;
        self.manMarkView.hidden = NO;
        self.selectedSex = @"男";
//        NSLog(@" 111---  %@ ---111",self.manLabel.text );

    }else{
        self.womanMarkView.hidden = NO;
        self.manMarkView.hidden = YES;
        self.selectedSex = @"女";
//        NSLog(@" 111---  %@ ---111",self.womanLabel.text);


    }
    
}

-(NSDictionary *)appendingTheParams{
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];
    NSString *sex;
    if ([self.selectedSex isEqualToString:@"男"]) {
        sex = @"0";
    }else{
        sex = @"1";
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
 
        params[@"userId"] = array[7];
        params[@"nickName"] = array[0];
        params[@"sex"] = sex;
        params[@"birthDay"] = array[9];
        params[@"profession"] = array[3];
        params[@"signature"] = array[6];
 ;
    
    return params;
    
    
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
