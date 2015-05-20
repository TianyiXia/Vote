//
//  event.h
//  ExpandingCells
//
//  Created by ShaoLei on 5/17/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface event : NSObject

@property (strong, nonatomic) NSString *eventName;
@property (strong, nonatomic) NSString *eventTime;
@property (strong, nonatomic) NSString *eventPlace;
@property (strong, nonatomic) NSNumber *joinPeople;
@property (strong, nonatomic) NSString *owner;

@end
