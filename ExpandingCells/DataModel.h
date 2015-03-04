//
//  DataModel.h
//  ExpandingCells
//
//  Created by Li-Wei Tseng on 1/31/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject


@property (strong, nonatomic) NSMutableArray *question_array;
@property (strong, nonatomic) NSMutableArray *option_left_names;
@property (strong, nonatomic) NSMutableArray *option_left_votes;
@property (strong, nonatomic) NSMutableArray *option_right_names;
@property (strong, nonatomic) NSMutableArray *option_right_votes;

- (id) init;
@end
