//
//  GlanceController.m
//  Test0001 WatchKit Extension
//
//  Created by HeQingshan on 15/1/4.
//  Copyright (c) 2015年 何青山. All rights reserved.
//

#import "GlanceController.h"


@interface GlanceController()

@end


@implementation GlanceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
    //init controls data
    [self.myTitle setText:@"请欣赏以下图片"];
    [self.myImage setImageNamed:@"pic7.jpg"];
    
    //Coordinating Handoff Activity
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"pushThreeTest" forKey:@"toController"];
    [self updateUserActivity:@"com.danson.Test0001" userInfo:dic];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



