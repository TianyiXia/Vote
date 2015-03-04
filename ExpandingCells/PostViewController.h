//
//  PostViewController.h
//  ExpandingCells
//
//  Created by ShaoLei on 1/31/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextView *question;
@property (strong, nonatomic) IBOutlet UITextField *choice1;
@property (strong, nonatomic) IBOutlet UITextField *choice2;

@end
