//
//  MessageCell.m
//  ChatTest
//
//  Created by siteview_mac on 13-7-12.
//  Copyright (c) 2013年 siteview_mac. All rights reserved.
//

#import "MessageContextCell.h"

@implementation MessageContextCell

@synthesize senderAndTimeLabel;
@synthesize messageContentView;
@synthesize bgImageView;
@synthesize headImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        }
        
        // 头像
        headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, 30, 30)];
        [self.contentView addSubview:headImageView];
        
        //日期标签
        senderAndTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 5, self.bounds.size.width - 75, 20)];
        //居中显示
        senderAndTimeLabel.textAlignment = NSTextAlignmentCenter;
        senderAndTimeLabel.font = [UIFont systemFontOfSize:11.0];
        //文字颜色
        senderAndTimeLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:senderAndTimeLabel];
        
        //背景图
        bgImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:bgImageView];
        
        //聊天信息
        messageContentView = [[UITextView alloc] init];
        messageContentView.backgroundColor = [UIColor clearColor];
        //不可编辑
        messageContentView.editable = NO;
        messageContentView.scrollEnabled = NO;
        [messageContentView sizeToFit];
        [self.contentView addSubview:messageContentView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
