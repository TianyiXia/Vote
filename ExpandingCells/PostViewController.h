//
//  PostViewController.h
//  ExpandingCells
//
//  Created by ShaoLei on 1/31/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "event.h"

@interface PostViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextView *eventName;

@property (retain, nonatomic) IBOutlet UITextView *place;

@property (strong, nonatomic) event *newEvent;


@end
