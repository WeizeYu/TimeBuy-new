//
//  ConmonController.m
//  Timebuy
//
//  Created by He yang on 15/10/14.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "ConmonController.h"
#import "MTConst.h"
#import "AFNetworking.h"

@interface ConmonController ()
@property (weak, nonatomic) IBOutlet UITextField *txtView;

@end

@implementation ConmonController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.TBTitle;
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"箭头9x17px"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem  = backButton;
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(sure)];
    self.navigationItem.rightBarButtonItem = editButton;

    // Do any additional setup after loading the view from its nib.
}


-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)sure{
    
     NSDictionary *params = [self appendingTheParams];
   
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:@"%@user/update",timebuyUrl];
//    [manager POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//         NSLog(@" 111---  %@ ---111",responseObject );
//    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
//        
//    }];
  [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
      
      NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconData"];
              [formData appendPartWithFileData:data name:@"headIcon" fileName:@"123321213.jpg" mimeType:@"image/jpeg"];
      
      
  } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
      NSLog(@" 111---  %@ ---111",responseObject );
      NSNumber *number = [NSNumber numberWithInteger:self.TBTag];
      [[NSNotificationCenter defaultCenter] postNotificationName:CommonDidChangeNotification object:nil userInfo:@{CommenKey : self.txtView.text,CellTag : number}];

      [self.navigationController popViewControllerAnimated:YES];
  } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
      
  }];

   
    
}


-(NSDictionary *)appendingTheParams{
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];
  
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (self.TBTag == 1) {
        params[@"userId"] = array[7];
        params[@"nickName"] = self.txtView.text;
        params[@"sex"] = array[1];
        params[@"birthDay"] = array[9];
        params[@"profession"] = array[3];
        params[@"signature"] = array[6];
    }else if (self.TBTag == 4){
        params[@"userId"] = array[7];
        params[@"nickName"] = array[0];
        params[@"sex"] = array[1];
        params[@"birthDay"] = array[9];
        params[@"profession"] = self.txtView.text;
        params[@"signature"] = array[6];
    }else if (self.TBTag == 3){
        params[@"userId"] = array[7];
        params[@"nickName"] = array[0];
        params[@"sex"] = array[1];
        params[@"birthDay"] = self.txtView.text;
        params[@"profession"] = array[3];
        params[@"signature"] =  array[6];
    }
    
//    NSLog(@" 111---  %@ ---111",params );

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
