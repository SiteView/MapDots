//
//  XMPPMessageDelegate.h
//  ChatTest
//
//  Created by siteview_mac on 13-7-12.
//  Copyright (c) 2013年 siteview_mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XMPPMessageDelegate <NSObject>

-(void)newMessageReceived:(NSDictionary *)messageContent;

@end
