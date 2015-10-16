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
  [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
      
      //        NSData *data = UIImageJPEGRepresentation(image, 1.0);
      //        [formData appendPartWithFileData:data name:@"pic" fileName:@"test.jpg" mimeType:@"image/jpeg"];
      
      
  } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
      NSLog(@" 111---  %@ ---111",responseObject );

  } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
      
  }];

    NSNumber *number = [NSNumber numberWithInteger:self.TBTag];
    [[NSNotificationCenter defaultCenter] postNotificationName:CommonDidChangeNotification object:nil userInfo:@{CommenKey : self.txtView.text,CellTag : number}];
    
}
    // 参数:
//    userId   int
//    nickName   String
//    sex      int
//    birthday  date
//    profession String
//    signature String
    
//    // 1.请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    // 2.拼接请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"access_token"] = [HWAccountTool account].access_token;
//    params[@"status"] = self.textView.fullText;
//
//    // 3.发送请求
//    [mgr POST:@"https://upload.api.weibo.com/2/statuses/upload.json" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        // 拼接文件数据
//        UIImage *image = [self.photosView.photos firstObject];
//        NSData *data = UIImageJPEGRepresentation(image, 1.0);
//        [formData appendPartWithFileData:data name:@"pic" fileName:@"test.jpg" mimeType:@"image/jpeg"];
//    } success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
//        [MBProgressHUD showSuccess:@"发送成功"];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [MBProgressHUD showError:@"发送失败"];
//    }];
//}

-(NSDictionary *)appendingTheParams{
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];
  
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (self.TBTag == 1) {
        params[@"userId"] = array[7];
        params[@"nickName"] = self.txtView.text;
        params[@"sex"] = array[1];
        params[@"birthDay"] = array[9];
        params[@"profession"] = array[3];
        params[@"signature"] = @"123";
    }else if (self.TBTag == 4){
        params[@"userId"] = array[7];
        params[@"nickName"] = array[0];
        params[@"sex"] = array[1];
        params[@"birthDay"] = array[9];
        params[@"profession"] = self.txtView.text;
        params[@"signature"] = @"123";
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
