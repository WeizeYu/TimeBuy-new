//
//  programDetailsTableViewCell.m
//  Timebuy
//
//  Created by Mr.OJ on 15/10/9.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "payDetailsTableViewCell.h"

@implementation payDetailsTableViewCell
@synthesize numberView;
@synthesize textLayer;
@synthesize endNumber;

- (void)layoutSubviews
{
    //设置动态增长数字动画
    textLayer = [[CACustomTextLayer alloc] init];
    textLayer.string = @"0";
    textLayer.frame = CGRectMake(0, 0, 146, 62);
    textLayer.position = CGPointMake(146 / 2, 62 / 2);
    textLayer.fontSize = 60.0f;
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.backgroundColor = [UIColor whiteColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentCenter;
    [numberView.layer addSublayer:textLayer];
    
    [textLayer jumpNumberWithDuration:1 fromNumber:0 toNumber:endNumber];
}

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
