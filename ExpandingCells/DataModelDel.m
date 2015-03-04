//
//  DataModelDel.m
//  ExpandingCells
//
//  Created by Li-Wei Tseng on 1/31/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import "DataModelDel.h"
static DataModel* _myModel = nil;
@implementation DataModelDel

+(void) load
{
    if (!_myModel) {
        _myModel = [[DataModel alloc] init];
    }
}

+(DataModel *)update:(DataModel *)newModel
{
    _myModel = newModel;
    return _myModel;
}

+ (DataModel *)myModel
{
    return _myModel;
}
@end
