//
//  PhotoPicker.h
//  RZT
//
//  Created by yuweize on 15/9/20.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessagePhotoMenuItem.h"
#import "ZYQAssetPickerController.h"
#import "ShowBigViewController.h"
#define kZBMessageShareMenuPageControlHeight 30

@protocol photoPickerDelegate <NSObject>
@optional
-(void)didSelectePhotoMenuItem:(MessagePhotoMenuItem *)shareMenuItem atIndex:(NSInteger)index;
-(void)addPicker:(ZYQAssetPickerController *)picker;          //UIImagePickerController
-(void)addUIImagePicker:(UIImagePickerController *)picker;
-(void)getImageUrl:(NSArray *)imageArray;
@end
@interface PhotoPicker : UIView<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate,MessagePhotoItemDelegate,ZYQAssetPickerControllerDelegate>{
    //下拉菜单
    UIActionSheet *myActionSheet;
    //图片2进制路径
    NSString* filePath;
    BOOL* bigPic;
}
@property(nonatomic,strong) UIScrollView *scrollview;
/**
 *  第三方功能Models
 */
@property (nonatomic, strong) NSMutableArray *photoMenuItems;
@property(nonatomic,strong) NSMutableArray *itemArray;
@property (nonatomic, assign) id <photoPickerDelegate> delegate;
@property (nonatomic) NSInteger curImgNum;
-(void)setBigImage:(BOOL*)pic;
-(void)openMenu;
- (void)reloadData;
@end
