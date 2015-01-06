//
//  WKInterfaceController+MapController.m
//  Test0001
//
//  Created by HeQingshan on 15/1/5.
//  Copyright (c) 2015年 何青山. All rights reserved.
//

#import "WKInterfaceController+MapController.h"

@interface MapController()
@property (strong, nonatomic) IBOutlet WKInterfaceMap *myMap;

@end

@implementation MapController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
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
