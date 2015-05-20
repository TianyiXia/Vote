//
//  PostViewController.m
//  ExpandingCells
//
//  Created by ShaoLei on 1/31/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import "PostViewController.h"
#import "ViewController.h"
#import "DataModelDel.h"
#import <pop/POP.h>
#import "event.h"


@interface PostViewController ()


@end

@implementation PostViewController


- (event*)newEvent
{
    if(_newEvent == nil)
    {
        _newEvent = [[event alloc] init];
    }
    
    return _newEvent;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.eventName resignFirstResponder];
    [self.place resignFirstResponder];
    
    return YES;
}



- (IBAction)selectDate:(id)sender {
    if ([self.view viewWithTag:9]) {
        return;
    }
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height-216-44, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height-216, 320, 216);
    
    UIView *darkView = [[[UIView alloc] initWithFrame:self.view.bounds] autorelease];
    darkView.alpha = 0;
    darkView.backgroundColor = [UIColor blackColor];
    darkView.tag = 9;
    UITapGestureRecognizer *tapGesture = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDatePicker:)] autorelease];
    [darkView addGestureRecognizer:tapGesture];
    [self.view addSubview:darkView];
    
    UIDatePicker *datePicker = [[[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height+44, 320, 216)] autorelease];
    datePicker.tag = 10;
    [datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:datePicker];
    
    UIToolbar *toolBar = [[[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, 44)] autorelease];
    toolBar.tag = 11;
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *spacer = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
    UIBarButtonItem *doneButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDatePicker:)] autorelease];
    [toolBar setItems:[NSArray arrayWithObjects:spacer, doneButton, nil]];
    [self.view addSubview:toolBar];
    
    [UIView beginAnimations:@"MoveIn" context:nil];
    toolBar.frame = toolbarTargetFrame;
    datePicker.frame = datePickerTargetFrame;
    darkView.alpha = 0.5;
    [UIView commitAnimations];
}

- (void)changeDate:(UIDatePicker *)sender {
    NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
     NSString *formatedDate = [dateFormatter stringFromDate:sender.date];
    self.newEvent.eventTime = formatedDate;

    NSLog(@"New Date: %@", sender.date);
}

- (void)removeViews:(id)object {
    [[self.view viewWithTag:9] removeFromSuperview];
    [[self.view viewWithTag:10] removeFromSuperview];
    [[self.view viewWithTag:11] removeFromSuperview];
}

- (void)dismissDatePicker:(id)sender {

    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height+44, 320, 216);
    [UIView beginAnimations:@"MoveOut" context:nil];
    [self.view viewWithTag:9].alpha = 0;
    [self.view viewWithTag:10].frame = datePickerTargetFrame;
    [self.view viewWithTag:11].frame = toolbarTargetFrame;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeViews:)];
    [UIView commitAnimations];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.eventName.delegate=self;
    self.place.delegate=self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.opaque = NO;
    
    UIView *backgroud = [[UIView alloc] initWithFrame:self.view.bounds];
    backgroud.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"greenBack"]];
    backgroud.contentMode = UIViewContentModeScaleAspectFill;
    
    backgroud.autoresizingMask =
    ( UIViewAutoresizingFlexibleBottomMargin
     | UIViewAutoresizingFlexibleHeight
     | UIViewAutoresizingFlexibleLeftMargin
     | UIViewAutoresizingFlexibleRightMargin
     | UIViewAutoresizingFlexibleTopMargin
     | UIViewAutoresizingFlexibleWidth );
    
    [self.view insertSubview:backgroud atIndex:0];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self == [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
           }
    
    return self;
}

-(IBAction)onClick:(id)sender
{
    
    self.newEvent.eventName = [NSString stringWithFormat:self.eventName.text];
    
    self.newEvent.eventPlace = [NSString stringWithFormat:self.place.text];
    
   
    
    self.newEvent.owner = @"Lei";
    
    self.newEvent.joinPeople = @1;
    
    ViewController *original = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    
    [DataModelDel load];
    DataModel *newModel = [DataModelDel myModel];
    
    [newModel.event_array addObject:self.newEvent];
    
        UIViewController *sourceViewController = (UIViewController*)self;
    UIViewController *destinationController = (UIViewController*)original;
    
    
    CALayer *layer = destinationController.view.layer;
    [layer pop_removeAllAnimations];
    
    POPSpringAnimation *xAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    POPSpringAnimation *sizeAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    
    xAnim.fromValue = @(320);
    xAnim.springBounciness = 16;
    xAnim.springSpeed = 10;
    
    sizeAnim.fromValue = [NSValue valueWithCGSize:CGSizeMake(64, 114)];
    
    xAnim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"Working");
    };
    
    [layer pop_addAnimation:xAnim forKey:@"position"];
    [layer pop_addAnimation:sizeAnim forKey:@"size"];
    
    [sourceViewController.navigationController pushViewController:destinationController animated:NO];
    
    
    //[self.navigationController pushViewController:original animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)cancel:(id)sender {
    
     ViewController *original = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    
    UIViewController *sourceViewController = (UIViewController*)self;
    UIViewController *destinationController = (UIViewController*)original;
    
    
    CALayer *layer = destinationController.view.layer;
    [layer pop_removeAllAnimations];
    
    POPSpringAnimation *xAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    POPSpringAnimation *sizeAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    
    xAnim.fromValue = @(320);
    xAnim.springBounciness = 16;
    xAnim.springSpeed = 10;
    
    sizeAnim.fromValue = [NSValue valueWithCGSize:CGSizeMake(64, 114)];
    
    xAnim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"Working");
    };
    
    [layer pop_addAnimation:xAnim forKey:@"position"];
    [layer pop_addAnimation:sizeAnim forKey:@"size"];
    
    [sourceViewController.navigationController pushViewController:destinationController animated:NO];
    

}

- (void)dealloc {
    [_eventName release];
    [_place release];
    [_newEvent release];
    [super dealloc];
}
@end
