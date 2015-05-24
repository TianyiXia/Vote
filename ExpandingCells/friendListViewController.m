//
//  friendListViewController.m
//  ExpandingCells
//
//  Created by ShaoLei on 5/20/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import "friendListViewController.h"
#import "ProfileViewController.h"
#import "LoginViewController.h"
@interface friendListViewController ()

@end

@implementation friendListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Back:(id)sender {
    ProfileViewController *profile =
    [[[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil] autorelease];
    
    [self.navigationController pushViewController:profile animated:YES];
    
    

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
