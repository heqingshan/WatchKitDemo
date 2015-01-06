//
//  mainRowType.h
//  Test0001
//
//  Created by HeQingshan on 15/1/5.
//  Copyright (c) 2015年 何青山. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface MainRowType : NSObject

@property (weak, nonatomic) IBOutlet WKInterfaceLabel* rowDescription;
@property (weak, nonatomic) IBOutlet WKInterfaceImage* rowIcon;

@end
