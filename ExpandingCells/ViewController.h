//
//  ViewController.h
//  ExpandingCells
//
//  Created by work on 1/7/13.
//  Copyright (c) 2013 sbyrd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"
#import "DLPieChart.h"
#import "DataModel.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
	NSArray*	dataSource;
	Cell*		selectedCell;
}

@property (nonatomic, retain) NSArray*	dataSource;
@property (nonatomic, retain) Cell*		selectedCell;
@property (nonatomic, retain) IBOutlet DLPieChart *pieChartView;
@property (nonatomic, strong) DataModel *dataModel;

@property (nonatomic, strong) NSString *new_question;
@property (nonatomic, strong) NSString *new_left_option;
@property (nonatomic, strong) NSString *new_right_option;
@property BOOL test;
@end
