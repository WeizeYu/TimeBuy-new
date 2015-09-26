//
//  changePriceTableViewCell.m
//  TimeBuy
//
//  Created by CraftDream on 15/9/12.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "changePriceTableViewCell.h"

@implementation changePriceTableViewCell

@synthesize backgroudView;
@synthesize changePriceSwitch;
@synthesize myTableView;

- (void)drawRect:(CGRect)rect
{
    CGSize mainSize = [UIScreen mainScreen].bounds.size;
    changePriceSwitch = [[ZJSwitch alloc] initWithFrame:CGRectMake((mainSize.width - 120) / 2, 7, 120, 28)];
    changePriceSwitch.backgroundColor = [UIColor clearColor];
    [changePriceSwitch addTarget:self action:@selector(switchEvent:) forControlEvents:UIControlEventValueChanged];
    changePriceSwitch.tintColor = [UIColor orangeColor];
    changePriceSwitch.on = NO;
    changePriceSwitch.onText = @"谈感情";
    changePriceSwitch.offText = @"出个价";
    changePriceSwitch.tag = 3;
    [backgroudView addSubview:changePriceSwitch];
}

- (void)switchEvent:(id)sender
{
    UISwitch *mySwitch = (UISwitch *)sender;
    
    //NSLog(@"%d",  mySwitch.on);
    
    NSString *str = @"￥";
    NSString *priceStr = @"0.0";
    
    priceTableViewCell *cell= (priceTableViewCell *)[myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
    
    if (mySwitch.on == 1) {

        cell.priceLabel.text = [str stringByAppendingString:priceStr];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
