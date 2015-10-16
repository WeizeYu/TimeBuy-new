//
//  InfoViewController.m
//  Timebuy
//
//  Created by He yang on 15/10/14.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "InfoViewController.h"
#import "SexController.h"
#import "iconCell.h"
#import "OtherCell.h"
#import "MTConst.h"
#import "SignatureController.h"
#import "ConmonController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

@interface InfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *infoTableView;

@property(copy,nonatomic) NSArray *leftAry;
@property(strong,nonatomic)NSMutableArray *rightArray;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.infoTableView.dataSource = self;
    self.infoTableView.delegate = self;
//    [self judgeTheData];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"箭头9x17px"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem  = backButton;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sexChanged:) name:SexDidChangedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(signChanged:) name:SignatureDidChangedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(commonChange:) name:CommonDidChangeNotification object:nil];
    // Do any additional setup after loading the view from its nib.
}

-(void)commonChange:(NSNotification *)notification{
    NSNumber *number = notification.userInfo[CellTag];
     NSInteger HYTag = [number integerValue];
    NSString *commonStr = notification.userInfo[CommenKey];
    OtherCell *cell =(OtherCell *)[self.infoTableView viewWithTag:HYTag];
    cell.name2Label.text = commonStr;
    if (HYTag < 10) {
       NSInteger index = HYTag - 1;
        
        NSMutableArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];
          NSMutableArray *array2 = [NSMutableArray arrayWithArray:array];
       [array2 replaceObjectAtIndex:index withObject:commonStr];
        [self saveData:array2];
       }else{
       NSInteger index = HYTag - 5;
           NSMutableArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];
           NSMutableArray *array2 = [NSMutableArray arrayWithArray:array];

           [array2 replaceObjectAtIndex:index withObject:commonStr];
           [self saveData:array2];
}
    
    
}


-(void)saveData:(NSMutableArray *)array2{
    [[NSUserDefaults standardUserDefaults] setObject:array2 forKey:@"rightArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)signChanged:(NSNotification *)notificatin{
    NSString *signStr = notificatin.userInfo[SignKey];
    
    NSMutableArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];
    NSMutableArray *array2 = [NSMutableArray arrayWithArray:array];

    [array2 replaceObjectAtIndex:6 withObject:signStr];
//    NSLog(@" 111---  %@ ---111",self.rightArray );
    
    [self saveData:array2];
}


-(void)sexChanged:(NSNotification *)notification{
    NSString *sexStr = notification.userInfo[SexKey];
    NSMutableArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];
    
    NSMutableArray *array2 = [NSMutableArray arrayWithArray:array];
    [array2 replaceObjectAtIndex:1 withObject:sexStr];
//    NSLog(@" 111---  %@ ---111",self.rightArray );

    [self saveData:array2];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}



-(NSArray *)leftAry{
    if (!_leftAry) {
        _leftAry = [NSArray arrayWithObjects:@"姓名",@"性别",@"年龄",@"职业",@"故乡",@"账号",@"个性签名", nil];
    }
    return  _leftAry;
}

-(NSMutableArray *)rightArray{
    
    
    _rightArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];
//    NSLog(@" 111---  %lu ---111",(unsigned long)_rightArray.count );

    return _rightArray;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.infoTableView reloadData];
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
        return 6;
    }
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        iconCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"iconCell" owner:nil options:nil] lastObject];
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconData"];
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            cell.iconView.image = image;
        }
        cell.iconView.layer.cornerRadius = cell.iconView.bounds.size.width /2 ;
        cell.iconView.layer.masksToBounds = YES;
        return cell;
    }
    else if(indexPath.section == 0 && indexPath.row > 0)
    {
        OtherCell *cell2 = [[[NSBundle mainBundle] loadNibNamed:@"OtherCell" owner:nil options:nil] lastObject];
        cell2.name1Label.text = self.leftAry[indexPath.row - 1];
        if (indexPath.row == 2) {
            NSString *str = self.rightArray[indexPath.row - 1];
            
            if ([str isEqualToString:@"0"]) {
                cell2.name2Label.text = @"男";
            }else{
                cell2.name2Label.text = @"女";
            }
        }else{
            cell2.name2Label.text = self.rightArray[indexPath.row - 1];
        }
        
        NSString *strTag = [NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
        NSInteger tag = [strTag integerValue];
        cell2.tag = tag;
        return cell2;
    }
    else if (indexPath.section == 1 ){
        OtherCell *cell3 = [[[NSBundle mainBundle] loadNibNamed:@"OtherCell" owner:nil options:nil] lastObject];
        cell3.name1Label.text = self.leftAry[indexPath.row + 5];

        cell3.name2Label.text = self.rightArray[indexPath.row + 5];
        NSString *strTag = [NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
        NSInteger tag = [strTag integerValue];
        cell3.tag = tag;
        return cell3;
    }
    return nil;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 &&indexPath.section == 0) {
        return 107;
    }
    
    return 47;
}

#pragma 选中cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self showActionSheet];
    }else if (indexPath.section == 0 && indexPath.row == 2){
        SexController *VC = [[SexController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.section == 1 &&indexPath.row == 1){
        SignatureController *VC = [[SignatureController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
        
    }else {
        ConmonController *VC = [[ConmonController alloc] init];
                NSString *strTag = [NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
                  NSInteger tag = [strTag integerValue];
         OtherCell *cell = (OtherCell *)[self.infoTableView viewWithTag:tag];
             VC.TBTitle = cell.name1Label.text;
          VC.TBTag = tag;
           [self.navigationController pushViewController:VC animated:YES];
    }
}


-(void)showActionSheet{
     UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self                                    cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册中选择",nil];
 
   
    [actionSheet showInView:self.infoTableView];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        NSLog(@" 111---   ---111" );
        [self takePhotp];
    }
    else if (buttonIndex == 1){
        [self localPhotos];
    }
}

-(void) takePhotp{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
       
        [self presentViewController:picker animated:YES completion:nil];
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

-(void)localPhotos{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{    [MBProgressHUD showHUDAddedTo:self.infoTableView animated:YES];
    [self postTheIcon:info];
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
       
                //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:nil];
        
     
    
}
}


-(void)postTheIcon:(NSDictionary *)info{
   
    
    
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"rightArray"];

    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];

        params[@"userId"] =array[7];
    NSLog(@" 111---  %@ ---111",array[7] );

        params[@"nickName"] = array[0];
        params[@"sex"] = array[1];
        params[@"birthDay"] = array[9];
        params[@"profession"] = array[3];
        params[@"signature"] = array[6];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:@"%@user/update",timebuyUrl];
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
       
        NSData *data = UIImageJPEGRepresentation(image, 1.0);
         [formData appendPartWithFileData:data name:@"headIcon" fileName:@"21323827163.jpg" mimeType:@"image/jpeg"];
//        NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconData"];

//         [formData appendPartWithFileData:data name:@"pic" fileName:@"test.jpg" mimeType:@"image/jpeg"];
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [MBProgressHUD hideHUDForView:self.infoTableView animated:YES];
        NSLog(@" 111---  %@ ---111",responseObject );
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil)
        {
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        else
        {
            data = UIImagePNGRepresentation(image);
        }
        
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"iconData"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.infoTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@" 111---  %@ ---111",error );
        
    }];
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
//    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:nil];
}



@end
