//
//  EventsViewController.h
//  MapDots
//
//  Created by siteview_mac on 13-10-15.
//  Copyright (c) 2013年 chenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsViewController : UIViewController<
#ifdef BAIDU_MAPS
BMKMapViewDelegate
#endif
, CLLocationManagerDelegate
>
@end
