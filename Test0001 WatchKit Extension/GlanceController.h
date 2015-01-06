//
//  GlanceController.h
//  Test0001 WatchKit Extension
//
//  Created by HeQingshan on 15/1/4.
//  Copyright (c) 2015年 何青山. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface GlanceController : WKInterfaceController
//define glace interface controls
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *myTitle;
@property (strong, nonatomic) IBOutlet WKInterfaceImage *myImage;

@end
