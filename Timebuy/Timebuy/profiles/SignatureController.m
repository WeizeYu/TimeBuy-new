//
//  SignatureController.m
//  Timebuy
//
//  Created by He yang on 15/10/14.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "SignatureController.h"
#import "MTConst.h"
#import "AFHTTPRequestOperationManager.h"
@interface SignatureController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *txtView;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation SignatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtView.delegate = self;
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
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
        params[@"userId"] = array[7];
        params[@"nickName"] = array[0];
        params[@"sex"] = array[1];
        params[@"birthDay"] = array[9];
        params[@"profession"] = array[3];
        params[@"signature"] = self.txtView.text;
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:@"%@user/update",timebuyUrl];
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconData"];
//        UIImage* image = [UIImage imageWithData:data];
//        
//        NSData *data2;
//        if (UIImagePNGRepresentation(image) == nil) {
//            
//            data2 = UIImageJPEGRepresentation(image, 1);
//            
//        } else {
//            
//            data2 = UIImagePNGRepresentation(image);
//        }
//
//        [formData appendPartWithFileData:data2 name:@"headIcon" fileName:@"2332232333434.jpg" mimeType:@"image/jpeg"];
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@" 111---  %@ ---111",responseObject );
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
    }];

    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SignatureDidChangedNotification object:nil userInfo:@{SignKey : self.txtView.text}];
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (self.txtView.text.length == 30) {
        return NO;
    }
    
    return YES;
}

-(void)textViewDidChange:(UITextView *)textView{
    NSUInteger count = 30 - textView.text.length;
    if (count == 0) {
        self.countLabel.hidden = YES;

    }
    else
    {
        self.countLabel.text =[NSString stringWithFormat:@"%lu",(unsigned long)count];
        self.countLabel.hidden = NO;
    }
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
