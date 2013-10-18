//
//  HomeViewController.m
//  MapDots
//
//  Created by siteview_mac on 13-10-11.
//  Copyright (c) 2013年 drogranflow. All rights reserved.
//

#import "HomeViewController.h"
#import "PreferencesViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
{
    UIImageView *bgImageView;
    UIImageView *spImageView;
    UIImageView *calendarImageView;
    UIImageView *headImageView;
    UIImageView *positionImageView;
    UILabel *positionLabel;
    UILabel *nameLabel;
    UIButton *friendsBtn;
    UIImageView *eventsImageView;
    UIImageView *navigaterImageView;
    UIImageView *navigaterImageView2;
    UIImageView *preferenceImageView;
    UIImageView *preferenceBgImageView;
    UIImageView *jumpImageView;
    
    UITableView *tblView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat bgBottom = 156;
    bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 327, bgBottom)];
    bgImageView.image = [UIImage imageNamed:@"bg1.png"];
    [self.view addSubview:bgImageView];
//    self.view = bgImageView;
    
    spImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 176/2, 320, 3)];
    spImageView.image = [UIImage imageNamed:@"分割线.png"];
    [self.view addSubview:spImageView];
    
    calendarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(250, 176/2 + 15, 30, 30)];
    calendarImageView.image = [UIImage imageNamed:@"日历.png"];
    [self.view addSubview:calendarImageView];
    
    headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, bgBottom - 25, 100, 100)];
    headImageView.image = [UIImage imageNamed:@"头像.png"];
    [self.view addSubview:headImageView];
    
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 + 100 + 10, bgBottom - 25, 540, 20)];
    nameLabel.text = @"王小二";
    // 加粗
    [nameLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    nameLabel.textColor = [UIColor whiteColor];
    
    [self.view addSubview:nameLabel];
    
    positionImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 100 + 10, bgBottom + 5, 30, 30)];
    positionImageView.image = [UIImage imageNamed:@"导航条标记.png"];
    [self.view addSubview:positionImageView];
    
    
    positionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 + 100 + 10 + 30, bgBottom + 5, 240, 20)];
    positionLabel.text = @"长沙市天心区劳动西路";
    [self.view addSubview:positionLabel];
    
    friendsBtn = [[UIButton alloc] initWithFrame:CGRectMake(10 + 100 + 10, bgBottom + 5 + 30 + 5, 180, 30)];
    friendsBtn.backgroundColor = [UIColor yellowColor];
    friendsBtn.titleLabel.text = @"我的好友";
    friendsBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    friendsBtn.titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:friendsBtn];
  
    CGFloat eventsTop = bgBottom + 90;
    eventsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, eventsTop, 300, 57)];
    eventsImageView.image = [UIImage imageNamed:@"框_话题.png"];
    [self.view addSubview:eventsImageView];

    UILabel *eventsLabel;
    eventsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 + 10 + 30, eventsTop + 5, 57, 57)];
    eventsLabel.text = @"话题";
    [eventsLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:24]];
    [self.view addSubview:eventsLabel];
    
    navigaterImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, eventsTop + 57, 150, 57)];
    navigaterImageView.image = [UIImage imageNamed:@"button_left_nor.png"];
    [self.view addSubview:navigaterImageView];
    navigaterImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 150, eventsTop + 57, 150, 57)];
    navigaterImageView2.image = [UIImage imageNamed:@"button_right_nor.png"];
    [self.view addSubview:navigaterImageView2];
    
    UIImageView *navImage;
    navImage = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 20, eventsTop + 57 + 10, 32, 32)];
    navImage.image = [UIImage imageNamed:@"导航_.png"];
    [self.view addSubview:navImage];
    UILabel *navigaterLabel;
    navigaterLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 + 10 + 32,eventsTop + 57 + 10, 64, 32)];
    navigaterLabel.text = @"导航";
    [navigaterLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [self.view addSubview:navigaterLabel];

    UIImageView *trackImage;
    trackImage = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 20 + 150, eventsTop + 57 + 10, 32, 32)];
    trackImage.image = [UIImage imageNamed:@"追踪_.png"];
    [self.view addSubview:trackImage];
    UILabel *trackLabel;
    trackLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 + 10 + 32 + 150,eventsTop + 57 + 10, 64, 32)];
    trackLabel.text = @"追踪";
    [trackLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [self.view addSubview:trackLabel];

    CGFloat preferenceTop = eventsTop + 57 + 57 + 5;
/*
    preferenceBgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, preferenceTop, 300, 50)];
    preferenceBgImageView.image = [UIImage imageNamed:@"框_设置.png"];
    [self.view addSubview:preferenceBgImageView];
    preferenceImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 5 + 5, preferenceTop + 8, 32, 32)];
    preferenceImageView.image = [UIImage imageNamed:@"设置.png"];
    [self.view addSubview:preferenceImageView];
    UILabel *preferenceLabel;
    preferenceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 + 10 + 32, preferenceTop + 10, 64, 32)];
    preferenceLabel.text = @"设置";
    [preferenceLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [self.view addSubview:preferenceLabel];
    
    jumpImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300 - 10 - 10, preferenceTop + 10, 10, 20)];
    jumpImageView.image = [UIImage imageNamed:@"跳转符.png"];
    [self.view addSubview:jumpImageView];
*/
    tblView =[[UITableView alloc] initWithFrame:CGRectMake(0, preferenceTop, self.view.bounds.size.width, 40)];
    tblView.dataSource = self;
    tblView.delegate = self;
    tblView.autoresizesSubviews = YES;
    tblView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    tblView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:tblView];
}

- (void)viewWillAppear:(BOOL)animated
{
//    [self.navigationController setNavigationBarHidden:YES ];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = @"设置";
    cell.imageView.image = [UIImage imageNamed:@"设置.png"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PreferencesViewController *preferencesViewController = [[PreferencesViewController alloc] init];
    [self.navigationController pushViewController:preferencesViewController animated:YES];

}

@end
