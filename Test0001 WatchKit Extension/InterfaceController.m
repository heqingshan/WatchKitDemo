//
//  InterfaceController.m
//  Test0001 WatchKit Extension
//
//  Created by HeQingshan on 15/1/4.
//  Copyright (c) 2015年 何青山. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
- (IBAction)pushTest;
- (IBAction)pushesTest;
- (IBAction)otherTest;
- (IBAction)openParentAppTest;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    //Add Menu Test
    [self addMenuItemWithItemIcon:WKMenuItemIconInfo title:@"信息" action:@selector(tapInfo:)];
    [self addMenuItemWithItemIcon:WKMenuItemIconAdd title:@"添加" action:@selector(tapInfo:)];
//    [self addMenuItemWithImageNamed:@"pic1.jpg" title:@"测试" action:@selector(tapInfo:)];
//    [self addMenuItemWithItemIcon:WKMenuItemIconTrash title:@"回收站" action:@selector(tapInfo:)];
    
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

//Menu Item Handle Aciton Method
-(void)tapInfo:(id)obj{
    [self clearAllMenuItems];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

//presentControllerWithName Test
- (IBAction)pushTest {
    [self presentControllerWithName:@"pushsTest" context:nil];
    //[self pushControllerWithName:@"pushsTest" context:nil];
}

//presentControllerWithNames Test
- (IBAction)pushesTest {
    NSArray *array = [NSArray arrayWithObjects:@"pushOneTest",@"pushTwoTest",@"pushThreeTest", nil];
    [self presentControllerWithNames:array contexts:nil];
}

//TextInputController Test
- (IBAction)otherTest {
    NSArray *array = [NSArray arrayWithObjects:@"One",@"Two",@"Three",@"Four",@"Five",@"One",@"Two",@"Three",@"Four",@"Five", nil];
    [self presentTextInputControllerWithSuggestions:array allowedInputMode:WKTextInputModePlain completion:^(NSArray *results) {
        NSLog(@"%@",results);
    }];
}

//openParentApplication method test
- (IBAction)openParentAppTest {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"openParentAppTest" forKey:@"action"];
    [WKInterfaceController openParentApplication:dic reply:^(NSDictionary *replyInfo, NSError *error) {
        NSLog(@"error:%@", error);
        NSLog(@"replyInfo:%@",replyInfo);
    }];
}

//Coordinating Handoff Activity
- (NSString *)actionForUserActivity:(NSDictionary *)userActivity context:(id *)context
{
    return [userActivity objectForKey:@"toController"];
}

//Responding to Notifications
- (void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)remoteNotification // when the app is launched from a notification. If launched from app icon in notification UI, identifier will be empty
{
    NSLog(@"identifier :%@",identifier);
//    [self presentControllerWithName:identifier context:nil];
    [self pushControllerWithName:identifier context:nil];
}

- (void)handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)localNotification
{
    NSLog(@"identifier :%@",identifier);
}

@end
