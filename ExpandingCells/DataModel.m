//
//  DataModel.m
//  ExpandingCells
//
//  Created by Li-Wei Tseng on 1/31/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (id) init
{
    self = [super init];
    
    _question_array = [[NSMutableArray alloc] init];
    [_question_array addObject:@"What should I buy?"];
    [_question_array addObject:@"Who will win the SuperBowl?"];
    [_question_array addObject:@"Which school rules LA?"];
    
    _option_left_names = [[NSMutableArray alloc] init];
    [_option_left_names addObject:@"Windows!"];
    [_option_left_names addObject:@"Patriots!"];
    [_option_left_names addObject:@"UCLA!"];
    
    _option_left_votes = [[NSMutableArray alloc] init];
    int x = 10;
    NSNumber* xWrapped = [NSNumber numberWithInt:x];
    [_option_left_votes addObject:xWrapped];
    x = 3;
    xWrapped = [NSNumber numberWithInt:x];
    [_option_left_votes addObject:xWrapped];
    x = 4;
    xWrapped = [NSNumber numberWithInt:x];
    [_option_left_votes addObject:xWrapped];

    _option_right_names = [[NSMutableArray alloc] init];
    [_option_right_names addObject:@"Android!"];
    [_option_right_names addObject:@"Seahawks!"];
    [_option_right_names addObject:@"USC!"];
    
    _option_right_votes = [[NSMutableArray alloc] init];
    x = 5;
    xWrapped = [NSNumber numberWithInt:x];
    [_option_right_votes addObject:xWrapped];
    x = 3;
    xWrapped = [NSNumber numberWithInt:x];
    [_option_right_votes addObject:xWrapped];
    x = 2;
    xWrapped = [NSNumber numberWithInt:x];
    [_option_right_votes addObject:xWrapped];

    return self;
}

//- (NSMutableArray *)question_array
//{
//    if(!_question_array)
//    {
//        _question_array = [[NSMutableArray alloc] init];
//        [_question_array addObject:@"Do you want to build a snowman?"];
//        [_question_array addObject:@"IOS or Android?"];
//        [_question_array addObject:@"UCLA or Bruins?"];
//    }
//    return _question_array;
//}
//- (NSMutableArray *)option_left_names
//{
//    if(!_option_left_names)
//    {
//        _option_left_names = [[NSMutableArray alloc] init];
//        [_option_left_names addObject:@"yes!"];
//        [_option_left_names addObject:@"IOS!"];
//        [_option_left_names addObject:@"UCLA!"];
//    }
//    return _option_left_names;
//
//}
//- (NSMutableArray *)option_left_votes
//{
//    if(!_option_left_votes)
//    {
//        _option_left_votes = [[NSMutableArray alloc] init];
//        [_option_left_votes addObject:2];
//        [_option_left_votes addObject:3];
//        [_option_left_votes addObject:5];
//    }
//    return _option_left_votes;
//}
//- (NSMutableArray *)option_right_names
//{
//    if(!_option_right_names)
//    {
//        _option_right_names = [[NSMutableArray alloc] init];
//        [_option_right_names addObject:@"No!"];
//        [_option_right_names addObject:@"Android!"];
//        [_option_right_names addObject:@"Bruins!"];
//    }
//    return _option_right_names;
//}
//- (NSMutableArray *)option_right_votes
//{
//    if(!_option_right_votes)
//    {
//        _option_right_votes = [[NSMutableArray alloc] init];
//        [_option_right_votes addObject:1];
//        [_option_right_votes addObject:2];
//        [_option_right_votes addObject:3];
//    }
//    return _option_right_votes;
//}

@end
