//
//  EditStatusViewController.m
//  MapDots
//
//  Created by siteview_mac on 13-10-10.
//  Copyright (c) 2013年 drogranflow. All rights reserved.
//

#import "EditStatusViewController.h"
#import "UserProperty.h"

@interface EditStatusViewController ()

@end

@implementation EditStatusViewController
{
    UITableView *tView;
}

@synthesize status;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    
    tView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,
                                                          self.view.bounds.size.width,
                                                          self.view.bounds.size.height)
                                         style:UITableViewStyleGrouped];
    
    
    tView.delegate = self;
    tView.dataSource = self;
    
    [self.view addSubview:tView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setEditFinish:(id)target callback:(SEL)selector
{
    m_target_edit = target;
    m_selector_edit = selector;
}


#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == tView) {
        return @"Please select your status";
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = AVAILABLE;
            break;
        case 1:
            cell.textLabel.text = UNAVAILABLE;
            break;
            
        default:
            break;
    }
    
    // Set cell checkmark
    if ([status isEqualToString:cell.textLabel.text]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    switch (row) {
        case 0:
        {
            status = AVAILABLE;
        }
            break;
        case 1:
        {
            status = UNAVAILABLE;
        }
            break;
            
        default:
            break;
    }
    [m_target_edit performSelector:m_selector_edit withObject:status];
    
    [tableView reloadData];
}


@end
