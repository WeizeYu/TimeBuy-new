//
//  waitTableViewCell.m
//  Timebuy
//
//  Created by yuweize on 15/9/23.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "ingTableViewCell.h"
#import "KLCPopup.h"
@implementation ingTableViewCell

- (void)awakeFromNib {
    [self.superView.layer setCornerRadius:8];
    [self.callButton.layer setCornerRadius:3];
    [self.makesureButton.layer setCornerRadius:3];
    [self.commitButton.layer setCornerRadius:3];
    

    // Initialization code
}
- (IBAction)callClick:(id)sender {
    UIView *callview=[[UIView alloc]initWithFrame:CGRectMake(29, 108, 317, 77)];
    callview.backgroundColor=[UIColor whiteColor];
    [callview.layer setCornerRadius:5];
    UIImageView *head=[[UIImageView alloc]initWithFrame:CGRectMake(16, 12, 26, 26)];
    [head setImage:[UIImage imageNamed:@"个人设置1.png"]];
    [callview addSubview:head];
    UILabel *name=[[UILabel alloc]initWithFrame:CGRectMake(45, 11, 42, 13)];
    name.textColor=[UIColor blueColor];
    name.font=[UIFont fontWithName:@"Arial" size:13.f];
    name.text=@"朱丽叶";
    [callview addSubview:name];
    UIImageView *sex=[[UIImageView alloc]initWithFrame:CGRectMake(47, 28, 30, 11)];
    UIImage *boypic=[UIImage imageNamed:@"男符号1"];
    [sex setImage:boypic];
    [callview addSubview:sex];
    UILabel *age=[[UILabel alloc]initWithFrame:CGRectMake(59, 28, 39, 13)];
    age.textColor=[UIColor whiteColor];
    age.font=[UIFont fontWithName:@"Arial" size:11.f];
    age.text=@"11";
    [callview addSubview:age];
    UILabel *type=[[UILabel alloc]initWithFrame:CGRectMake(80,26, 26, 13)];
    type.textColor=[UIColor lightGrayColor];
    type.text=@"学生";
    type.font=[UIFont fontWithName:@"Arial" size:13];
    [callview addSubview:type];
    UILabel *phone=[[UILabel alloc]initWithFrame:CGRectMake(16, 48, 120, 19)];
    phone.textColor=[UIColor lightGrayColor];
    phone.text=@"18767122389";
    phone.font=[UIFont fontWithName:@"Arial" size:18];
    [callview addSubview:phone];
    UILabel *time=[[UILabel alloc]initWithFrame:CGRectMake(218, 11, 87, 13)];
    time.textColor=[UIColor orangeColor];
    time.text=@"已开始2分50秒";
    time.font=[UIFont fontWithName:@"Arial" size:13];
    [callview addSubview:time];
    UIImageView *phonepic=[[UIImageView alloc]initWithFrame:CGRectMake(262, 42, 26, 26)];
    UIImage *pic=[UIImage imageNamed:@"phone"];
    [phonepic setImage:pic];
    [callview addSubview:phonepic];
    KLCPopup *popup =[KLCPopup popupWithContentView:callview showType:KLCPopupShowTypeGrowIn dismissType:KLCPopupDismissTypeGrowOut maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:true dismissOnContentTouch:false];
    [popup show];
}
- (IBAction)sureClick:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"响应方已完成了您发布的任务，您要确认达成吗？" message:@"" delegate:self cancelButtonTitle:@"取消"  otherButtonTitles:nil ];
    // optional - add more buttons:
    [alert addButtonWithTitle:@"确定"];
    [alert show];
}
- (IBAction)commitClick:(id)sender {
    if(self.commitBlock)
    {
        self.commitBlock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setData:(NSMutableDictionary *)ingDic{
    
}
@end
