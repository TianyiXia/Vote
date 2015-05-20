//
//  ProfileViewController.m
//  ExpandingCells
//
//  Created by ShaoLei on 1/31/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import "ProfileViewController.h"
#import "AskedViewController.h"
@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _Name.text = @"LeiShao";
    _Description.text = @"ID";
    _Images.image = [UIImage imageNamed: @"meizi.png"];

    
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)onClick:(id)sender
{
   
    AskedViewController *asked = [[[AskedViewController alloc] initWithNibName:@"AskedViewController" bundle:nil] autorelease];
    
    
    [self.navigationController pushViewController:asked animated:YES];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self == [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        
        //Setting the selected cell value to this blank instance of the custom cell great simplifies the heightForRowAtIndexPath
        //function and lets us avoid needing to hard code any values -- now the height is derived from a nib. This blank instance
        //will go away the first time a cell is selected for real.
        
        
        //set the title for the tab
        self.title = @"Profile";
        //set the image icon for the tab
        self.tabBarItem.image = [UIImage imageNamed:@"2.png"];
        
    }
    
    return self;
}




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.opaque = NO;
    
    UIView *backgroud = [[UIView alloc] initWithFrame:self.view.bounds];
    backgroud.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBack.png"]];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
