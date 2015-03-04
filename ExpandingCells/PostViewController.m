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


@interface PostViewController ()


@end

@implementation PostViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.choice2 resignFirstResponder];
    [self.choice1 resignFirstResponder];
    
    return YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.choice1.delegate=self;
    self.choice2.delegate=self;
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
    NSString *content = [NSString stringWithFormat:self.question.text];
    NSString *firstChoice = [NSString stringWithFormat:self.choice1.text];
    NSString *secondChoice =[ NSString stringWithFormat:self.choice2.text];
    
    ViewController *original = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    original.test = true;
    
    [DataModelDel load];
    DataModel *newModel = [DataModelDel myModel];
    
    int x = 1;
    NSNumber* xWrapped = [NSNumber numberWithInt:x];
    
    [newModel.question_array addObject:content];
    [newModel.option_left_names addObject:firstChoice];
    [newModel.option_right_names addObject:secondChoice];
    [newModel.option_left_votes addObject:xWrapped];
    [newModel.option_right_votes addObject:xWrapped];
    
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

@end
