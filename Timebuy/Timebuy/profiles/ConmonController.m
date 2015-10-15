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
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];
    NSString *userId = array[7];
    NSString *sex = array[1];
   
  
   
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"userId"] = userId;
    params[@"nickName"] = self.txtView.text;
    params[@"sex"] = sex;
    params[@"birthDay"] = array[9];
    params[@"profession"] = array[3];
    params[@"signature"] = @"123";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:@"%@user/update",timebuyUrl];
   [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
       
   } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
       NSLog(@" 111---  %@ ---111",responseObject );
   

   } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
       NSLog(@" 111---  %@ ---111",error );

   }];

    NSNumber *number = [NSNumber numberWithInteger:self.TBTag];
    [[NSNotificationCenter defaultCenter] postNotificationName:CommonDidChangeNotification object:nil userInfo:@{CommenKey : self.txtView.text,CellTag : number}];
    [self.navigationController popViewControllerAnimated:YES];
    
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


    
    
  
    



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
