//
//  MyNotificationController.m
//  Test0001
//
//  Created by HeQingshan on 15/1/6.
//  Copyright (c) 2015年 何青山. All rights reserved.
//

#import "MyNotificationController.h"


@interface MyNotificationController()

@end


@implementation MyNotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

////Responding to Notifications
- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    //call initControl method to init all glance interface controller
    //call this method after,will call main controller's handleActionWithIdentifier
    [self initControl];
    
    //
    // After populating your dynamic notification interface call the completion block.
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}

////Responding to Notifications
- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    //call initControl method to init all glance interface controller
    //call this method after,will call main controller's handleActionWithIdentifier
    [self initControl];
    
    //
    // After populating your dynamic notification interface call the completion block.
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}

- (NSDictionary *)dataString{
    //manual compose data with a dictionary
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    double date = [[NSDate date] timeIntervalSince1970];
    [dic setValue:[NSNumber numberWithDouble:date] forKey:@"date"];
    [dic setValue:@"北京" forKey:@"location"];
    [dic setValue:@"Something will happen soon,please get ready!" forKey:@"note"];
    
    return dic;
}

- (void)initControl{
    NSDictionary *dic = [self dataString];
    
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[[dic objectForKey:@"date"] doubleValue]];
    
    //format a date to yyyy-MM-dd
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *formattedDateString = [fmt stringFromDate:date];
    
    //format a date to HH:mm:ss
    fmt.dateFormat = @"HH:mm:ss";
    NSString *formattedTimeString = [fmt stringFromDate:date];
    
    [self.day setText:formattedDateString];
    [self.time setText:formattedTimeString];
    
    [self.location setText:[dic objectForKey:@"location"]];
    
    [self.message setText:[dic objectForKey:@"note"]];
}

@end



