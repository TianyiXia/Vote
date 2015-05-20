//
//  DataModelDel.h
//  ExpandingCells
//
//  Created by Li-Wei Tseng on 1/31/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModel.h"

@interface DataModelDel : NSObject

+(void) load;

+(DataModel *)myModel;
+(DataModel *)update:(DataModel *)newModel;
@end
