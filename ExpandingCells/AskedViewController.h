//
//  AskedViewController.h
//  ExpandingCells
//
//  Created by ShaoLei on 1/31/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"
#import "DLPieChart.h"

@interface AskedViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray*	dataSource;
    Cell*		selectedCell;
}

@property (nonatomic, retain) NSArray*	dataSource;
@property (nonatomic, retain) Cell*		selectedCell;

@end
