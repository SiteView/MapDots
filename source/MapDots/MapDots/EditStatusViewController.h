//
//  EditStatusViewController.h
//  MapDots
//
//  Created by siteview_mac on 13-10-10.
//  Copyright (c) 2013年 drogranflow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditStatusViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    id m_target_edit;
    SEL m_selector_edit;
}

@property (nonatomic, strong) NSString *status;

- (void)setEditFinish:(id)target callback:(SEL)selector;

@end
