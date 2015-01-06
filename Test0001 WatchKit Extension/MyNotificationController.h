//
//  MyNotificationController.h
//  Test0001
//
//  Created by HeQingshan on 15/1/6.
//  Copyright (c) 2015年 何青山. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface MyNotificationController : WKUserNotificationInterfaceController

//define interface controller control various
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *day;
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *time;
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *location;
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *message;

@end
