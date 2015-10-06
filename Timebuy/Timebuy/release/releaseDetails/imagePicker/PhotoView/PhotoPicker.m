//
//  PhotoPicker.m
//  RZT
//
//  Created by yuweize on 15/9/20.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "PhotoPicker.h"
#import "ZYQAssetPickerController.h"
// 每行有4个
#define kZBMessageShareMenuPerRowItemCount 4
#define kZBMessageShareMenuPerColum 2
#define kZBShareMenuItemIconSize 60
#define KZBShareMenuItemHeight 80
#define MaxItemCount 10
#define ItemWidth 94
#define ItemHeight 94

@interface PhotoPicker (){
    UILabel *lblNum;
}
/**
 *  这是背景滚动视图
 */
@property(nonatomic,strong) UIScrollView *photoScrollView;
@property (nonatomic, weak) UIScrollView *shareMenuScrollView;
@property (nonatomic, weak) UIPageControl *shareMenuPageControl;
@property(nonatomic,weak)UIButton *btnviewphoto;
@end
@implementation PhotoPicker
@synthesize photoMenuItems;

-(void)setBigImage:(BOOL*)pic{
    bigPic=pic;
}
-(void)openMenu{
    //bigPic=false;
    //在这里呼出下方菜单按钮项
    myActionSheet = [[UIActionSheet alloc]
                     initWithTitle:nil
                     delegate:self
                     cancelButtonTitle:@"取消"
                     destructiveButtonTitle:nil
                     otherButtonTitles:@"打开照相机",@"从手机相册获取", nil];
    //刚才少写了这一句
    [myActionSheet showInView:self.window];
}
//下拉菜单的点击响应事件
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == myActionSheet.cancelButtonIndex){
        NSLog(@"取消");
    }
    switch (buttonIndex) {
        case 0:
            [self takePhoto];
            break;
        case 1:
            [self localPhoto];
            break;
        default:
            break;
    }
}
//开始拍照
-(void)takePhoto{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self.delegate addUIImagePicker:picker];
    }else{
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}
/*
 新加的另外的方法
 */
////////////////////////////////////////////////////////////
//打开相册，可以多选
-(void)localPhoto{
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc]init];
    //修改可以选择最大图片的位置
    picker.maximumNumberOfSelection = 3;
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.showEmptyGroups = NO;
    picker.delegate = self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject,NSDictionary *bindings){
        if ([[(ALAsset *)evaluatedObject valueForProperty:ALAssetPropertyType]isEqual:ALAssetTypeVideo]) {
            NSTimeInterval duration = [[(ALAsset *)evaluatedObject valueForProperty:ALAssetPropertyDuration]doubleValue];
            return duration >= 5;
        }else{
            return  YES;
        }
    }];
    if([self.delegate respondsToSelector:@selector(addPicker:)])
    {
        [self.delegate addPicker:picker];
    }
}
#pragma  mark   -ZYQAssetPickerController Delegate
/*
 得到选中的图片
 */
#pragma mark - ZYQAssetPickerController Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    [self.scrollview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSLog(@"self.itemArray is %@",self.photoMenuItems);
    NSLog(@"assets is %@",assets);
    if([self.delegate respondsToSelector:@selector(getImageUrl:)])
    {
        [self.delegate getImageUrl:assets];
    }
    //跳转到显示大图的页面
    if(bigPic)
    {
        ShowBigViewController *big = [[ShowBigViewController alloc]init];
        big.arrayOK = [NSMutableArray arrayWithArray:assets];
        self.photoMenuItems = [NSMutableArray arrayWithArray:assets];
        [picker pushViewController:big animated:YES];
    }
    else
    {
        NSLog(@"结束");
        [picker dismissViewControllerAnimated:true completion:nil];
    }
}
//选择某张照片之后
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //当选择的类型是图片
    if([type isEqualToString:@"public.image"]){
        //先把图片转成NSData
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
      //  [self reloadDataWithImage:image];
        NSData *datas;
        if(UIImagePNGRepresentation(image)==nil){
            datas = UIImageJPEGRepresentation(image, 1.0);
        }else{
            datas = UIImagePNGRepresentation(image);
        }
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
        NSString *DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //把刚才图片转换的data对象拷贝至沙盒中,并保存为image.png
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:datas attributes:nil];
        //得到选择后沙盒中图片的完整路径
        filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,@"/image.png"];
        NSLog(@"照片路径  %@",filePath);
        //创建一个选择后图片的图片放在scrollview中
        //加载scrollview中
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)reloadData {
}
- (void)dealloc {
    //self.shareMenuItems = nil;
   // self.photoScrollView.delegate = self;
    self.shareMenuScrollView.delegate = self;
    self.shareMenuScrollView = nil;
    self.shareMenuPageControl = nil;
}
#pragma mark - MessagePhotoItemDelegate
-(void)messagePhotoItemView:(MessagePhotoMenuItem *)messagePhotoItemView didSelectDeleteButtonAtIndex:(NSInteger)index{
    [self.photoMenuItems removeObjectAtIndex:index];
    //[self initlizerScrollView:self.photoMenuItems];
}
#pragma mark - UIScrollView delegate
/*- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //每页宽度
    CGFloat pageWidth = scrollView.frame.size.width;
    //根据当前的坐标与页宽计算当前页码
    NSInteger currentPage = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1;
    [self.shareMenuPageControl setCurrentPage:currentPage];
}*/
@end
