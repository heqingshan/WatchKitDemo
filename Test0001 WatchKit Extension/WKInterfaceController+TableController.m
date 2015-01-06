//
//  WKInterfaceController+TableController.m
//  Test0001
//
//  Created by HeQingshan on 15/1/5.
//  Copyright (c) 2015年 何青山. All rights reserved.
//

#import "WKInterfaceController+TableController.h"
#import "mainRowType.h"

@interface TableController(){
    NSArray *data;
    //currentValue is to save the slider's last value
    float currentValue;
    int rowNum;
}
@property (strong, nonatomic) IBOutlet WKInterfaceSlider *mySlider;
@property (strong, nonatomic) IBOutlet WKInterfaceTable *myTable;
- (IBAction)tapSlider:(float)value;

@end

@implementation TableController

- (instancetype)init
{
    self = [super init];
    if (self) {
        rowNum = 8;
        data = [NSArray arrayWithObjects:@"Apple",@"Pear",@"Fruit",@"Egg",@"Pig",@"Dog",@"People",@"Something", nil];
        //Watchkit don't have delegate,so at the init method have to init all the numbers
        [_myTable setNumberOfRows:rowNum withRowType:@"MainRowType"];
        for (int i = 0; i < rowNum; i++) {
            MainRowType *type = [_myTable rowControllerAtIndex:i];
            long randomNum = random()%rowNum;
            type.rowDescription.text = [data objectAtIndex:randomNum];
            [type.rowIcon setImageNamed:[NSString stringWithFormat:@"pic%ld",randomNum+1]];
        }
        
        //this value must the same with storyboard value
        currentValue = data.count;
    }
    return self;
}

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

//slider's tapped method
//value:current slider's value
- (IBAction)tapSlider:(float)value {
    if (value < 0 || value > rowNum) {
        return;
    }
    if (value < currentValue) {
        //删除第一行
        NSIndexSet *iset = [NSIndexSet indexSetWithIndex:0];
        [_myTable removeRowsAtIndexes:iset];
        
        currentValue = value;
    }
    else if(value > currentValue) {
        //在前面增加一行
        long randomNum = random()%rowNum;
        NSIndexSet *iset = [NSIndexSet indexSetWithIndex:0];
        [_myTable insertRowsAtIndexes:iset withRowType:@"MainRowType"];
        MainRowType *type = [_myTable rowControllerAtIndex:0];
        type.rowDescription.text = [data objectAtIndex:randomNum];
        [type.rowIcon setImageNamed:[NSString stringWithFormat:@"pic%ld",randomNum+1]];
        
        currentValue = value;
        
        if (currentValue == 8) {
            [self performSelector:@selector(toRoll:) withObject:[NSNumber numberWithInt:7] afterDelay:0.3];
        }
    }
    return;
}

//roll to a row
-(void)toRoll:(NSNumber*)row{
    [_myTable scrollToRowAtIndex:[row intValue]];
}

//when click table's row,will call this method,then you can do all the things in here
- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    NSLog(@"You select the row : %ld", rowIndex + 1);
}

@end
