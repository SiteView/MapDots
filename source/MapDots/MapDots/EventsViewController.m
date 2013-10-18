//
//  EventsViewController.m
//  MapDots
//
//  Created by siteview_mac on 13-10-15.
//  Copyright (c) 2013年 chenwei. All rights reserved.
//

#import "EventsViewController.h"
#import "AppDelegate.h"
#import "PlaceAnnotation.h"

@interface EventsViewController ()

@end

@implementation EventsViewController
{
    BOOL isViewPosition_;
    UIView *viewPosition_;
    UIView *viewEvents_;
    
    // viewPosition_
    CGFloat zoom_;
#ifdef BAIDU_MAPS
    BMKMapView *mapView_;
#endif
    
    PlaceAnnotation *eventAnnotation_;
    CLLocationManager *locationManager;
    CLLocationCoordinate2D position_;
    UIBarButtonItem *createEventButton_;

    
    UIBarButtonItem *flipMapButton_;
    UIBarButtonItem *flipListButton_;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =
    [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];

    float controlTop = 0;
    float navigationTop = 0;
    float bottomHeight = 0;
    float bottom = 0;
    
    if ([self appDelegate].isiOS7) {
        if ([self appDelegate].isiPAD)
        {
            controlTop = STATUS_BAR_HEIGHT;
            navigationTop = NAVIGATION_BAR_HEIGHT;
            bottomHeight = TAB_BAR_HEIGHT + 8;
        } else {
            controlTop = STATUS_BAR_HEIGHT;
            navigationTop = NAVIGATION_BAR_HEIGHT - 8;
            bottomHeight = TAB_BAR_HEIGHT;
            bottom = 10;
        }
    }
    
    zoom_ = 14;
    if ([self appDelegate].isiPAD)
    {
        zoom_ = 15;
    }
    CGRect rect = CGRectMake(0, controlTop, self.view.bounds.size.width, self.view.bounds.size.height - controlTop - bottomHeight);
    
    // viewEvents_
    viewEvents_ = [[UIView alloc] initWithFrame:rect];
    CGRect rectContext = CGRectMake(0, navigationTop, rect.size.width, rect.size.height - navigationTop);
    
    flipListButton_ = [[UIBarButtonItem alloc] initWithTitle:@"List"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(flipView)];
    flipMapButton_ = [[UIBarButtonItem alloc] initWithTitle:@"Map"
                                                   style:UIBarButtonItemStyleBordered
                                                  target:self
                                                  action:@selector(flipView)];
    
    // viewPosition_
    viewPosition_ = [[UIView alloc] initWithFrame:rect];
#ifdef BAIDU_MAPS
    mapView_ = [[BMKMapView alloc] initWithFrame:rectContext];
    mapView_.zoomLevel = zoom_;
    NSLog(@"zoom: %.1f", zoom_);
//    mapView_.compassPosition = CGPointMake(10, 10);
    mapView_.zoomEnabled = YES;
    //实现旋转、俯视的3D效果
    mapView_.rotation = 90;
    mapView_.overlooking = -30;
#endif
    
    locationManager = [[CLLocationManager alloc] init];
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位不可用");
    } else {
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        // Set the optional distance filter
//        locationManager.distanceFilter = 5.0f;
        
        [locationManager startUpdatingLocation];
        
    }

    [viewPosition_ addSubview:mapView_];
    
    [self.view addSubview:viewPosition_];
    
    isViewPosition_ = YES;
    
    [self.navigationItem setLeftBarButtonItem:createEventButton_];
    [self.navigationItem setRightBarButtonItem:flipListButton_];
}

- (void)viewWillAppear:(BOOL)animated
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshRoom
{
}

- (void)flipView
{
    // Start Animation Block
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    
    NSInteger list = [[self.view subviews] indexOfObject:viewEvents_];
    NSInteger map = [[self.view subviews] indexOfObject:viewPosition_];
    
    // Animations
    [self.view exchangeSubviewAtIndex:list withSubviewAtIndex:map];
    
    // commit Animation Block
    [UIView commitAnimations];
    
    if (isViewPosition_) {
        isViewPosition_ = NO;
        
        [self refreshRoom];
        
//        [self.navigationItem setLeftBarButtonItem:nil];
        [self.navigationItem setRightBarButtonItem:flipMapButton_];
    } else {
        isViewPosition_ = YES;
//        [self.navigationItem setLeftBarButtonItem:nil];
        
        [self.navigationItem setRightBarButtonItem:flipListButton_];
    }
}
#ifdef BAIDU_MAPS

#pragma mark - BAIDU_MAPS

- (void)mapView:(BMKMapView *)mapView didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    CLLocationCoordinate2D coordinate;
    coordinate = [userLocation coordinate];
    
    position_ = coordinate;
    
    BMKCoordinateSpan span;
    span.latitudeDelta = 0.05;
    span.longitudeDelta = 0.05;
    
//    BMKCoordinateRegion region = {coordinate, span};
//    [mapView_ setRegion:[mapView_ regionThatFits:region]];
    mapView_.showsUserLocation = YES;
    mapView_.zoomLevel = zoom_;
    NSLog(@"%s: %.1f", __FUNCTION__, zoom_);

}

- (void)mapView:(BMKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    
}

- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view
{
    PlaceAnnotation *annotation = view.annotation;
/*
    [[self appDelegate].xmppRoomList_ enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        XMPPRoom *rm = obj;
        if ([rm.roomName isEqualToString:annotation.title]) {
            [self joinEvents:[rm.roomJID full]];
            *stop = YES;
        }
    }];
*/    
}

- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    zoom_ = mapView_.zoomLevel;
    NSLog(@"%s: %.1f", __FUNCTION__, zoom_);
    
    mapView_.showsUserLocation = YES;

}

- (void)mapView:(BMKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    mapView_.showsUserLocation = NO;
}

- (void)mapview:(BMKMapView *)mapView onLongClick:(CLLocationCoordinate2D)coordinate
{
    // 长按地图，发起事件
    if (eventAnnotation_ == nil) {
        eventAnnotation_ = [[PlaceAnnotation alloc] init];
    }
    eventAnnotation_.coordinate = coordinate;
//    placeAnnotation.title = [NSString stringWithFormat:@"%@", room.roomName];
    
    [mapView_ addAnnotation:eventAnnotation_];
/*
    if (createRoomViewController == nil) {
        createRoomViewController = [[CreateEventViewController alloc] init];
    }
    createRoomViewController.coordinate = coordinate;
    createRoomViewController.isPoint = YES;
    
    [createRoomViewController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:createRoomViewController animated:YES];
*/
}
#endif
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark Accessors
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//取得当前程序的委托
-(AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
#pragma mark -
#pragma mark IBAction

- (void)CreateRoom
{
}
@end
