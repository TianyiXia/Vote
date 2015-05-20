//
//  DataModel.m
//  ExpandingCells
//
//  Created by Li-Wei Tseng on 1/31/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import "DataModel.h"
#import "event.h"

@implementation DataModel

- (id) init
{
    self = [super init];
    
    _event_array = [[NSMutableArray alloc] init];
    
    event *first = [[event alloc] init];
    first.eventName = @"Study at Library";
    first.eventTime = @"8:00am 05/16/2015";
    first.eventPlace = @"Powell Library";
    first.joinPeople = @3;
    first.owner = @"Lei";
    
    [_event_array addObject:first];
    
    event *second = [[event alloc] init];
    second.eventName = @"Go Hiking";
    second.eventTime = @"1:00pm 05/17/2015";
    second.eventPlace = @"Holiwood Sign";
    second.joinPeople = @5;
    second.owner = @"fafa";
    
    [_event_array addObject:second];
    
    event *third = [[event alloc] init];
    third.eventName = @"Go Boiling Crab";
    third.eventTime = @"6:00pm 05/15/2015";
    third.eventPlace = @"Boiling Crab";
    third.joinPeople = @6;
    third.owner = @"PK";
    
    [_event_array addObject:third];
    
    event *fourth = [[event alloc] init];
    fourth.eventName = @"Play dota";
    fourth.eventTime = @"9:00pm 05/15/2015";
    fourth.eventPlace = @"Rieber Hall Lounge";
    fourth.joinPeople = @3;
    fourth.owner = @"Tianyi";
    
    [_event_array addObject:fourth];

    

  
    return self;
}

//- (NSMutableArray *)event_array
//{
//    if(!_event_array)
//    {
//        _event_array = [[NSMutableArray alloc] init];
//        [_event_array addObject:@"Do you want to build a snowman?"];
//        [_event_array addObject:@"IOS or Android?"];
//        [_event_array addObject:@"UCLA or Bruins?"];
//    }
//    return _event_array;
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
