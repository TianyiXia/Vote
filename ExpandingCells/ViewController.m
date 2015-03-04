//
//  ViewController.m
//  ExpandingCells
//
//  Created by work on 1/7/13.
//  Copyright (c) 2013 sbyrd. All rights reserved.
//

#import "ViewController.h"
#import "PostViewController.h"
#import "DataModelDel.h"
#import <pop/POP.h>


@implementation ViewController


@synthesize dataSource;
@synthesize selectedCell;


static Cell* blankCell = nil;


#pragma mark Data Source Delegate Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataModel *current_data_model = [DataModelDel myModel];
//    
//    for (NSString *str in current_data_model.question_array) {
//                 NSLog(@"%@", str);
//                }

    [self setDataSource:[NSArray arrayWithArray:current_data_model.question_array]];
    Cell*		cell		= [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    NSString*	cellName	= [[self dataSource] objectAtIndex:[indexPath row]];
    
//    for (NSString *str in self.dataSource) {
//                         NSLog(@"%@", str);
//                        }
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ExpandingCell" owner:self options:nil] objectAtIndex:0];
    }
    
    [cell setIndex:[indexPath row]];
    [[cell cellName] setText:cellName];
    
    int current_row = [indexPath row];
    [cell.button0 setTitle:current_data_model.option_left_names[current_row] forState:UIControlStateNormal];
    [cell.button1 setTitle:current_data_model.option_right_names[current_row] forState:UIControlStateNormal];
    
    [cell setB0Function:^(){
        
        NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:2];
        
        //NSNumber *one = ;
        NSNumber *sum = [NSNumber numberWithFloat:([current_data_model.option_right_votes[current_row] floatValue] + 1)];
        current_data_model.option_right_votes[current_row] = sum;
        
        [dataArray addObject:current_data_model.option_left_votes[current_row]];
        //NSLog(@"test: %@", self.dataModel.option_left_votes[current_row]);
        //NSNumber *two = [NSNumber numberWithInt:3];
        [dataArray addObject:current_data_model.option_right_votes[current_row]];
        [self.pieChartView renderInLayer:self.pieChartView dataArray:dataArray];
        
    }];
    
    
    
    [cell setB1Function:^(){
        NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:2];
        
        NSNumber *sum = [NSNumber numberWithFloat:([current_data_model.option_left_votes[current_row] floatValue] + 1)];
        current_data_model.option_left_votes[current_row] = sum;
        
        //NSNumber *one = ;
        //NSLog(@"test: %@", self.dataModel.option_left_votes[current_row]);
        //NSNumber *two = [NSNumber numberWithInt:3];
        [dataArray addObject:current_data_model.option_left_votes[current_row]];
        [dataArray addObject:current_data_model.option_right_votes[current_row]];

        [self.pieChartView renderInLayer:self.pieChartView dataArray:dataArray];
        
    }];

	return cell;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"%d", [[self dataSource] count]);
    DataModel *current_data_model = [DataModelDel myModel];
    
	return [current_data_model.question_array count];
}




#pragma mark Table View Delegate Methods

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
	return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 1)];
}




- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
	return 1;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{	
	if ([indexPath row] == [[self selectedCell] index])
	{
		return [[self selectedCell] getHeight];
	}
	
	return [blankCell getHeight];
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSIndexPath*	oldPath = nil;
	Cell*			cell	= (Cell*)[tableView cellForRowAtIndexPath:indexPath];
	
	if([[self selectedCell] index] >= 0)
	{
        
		[[self selectedCell] contract];
      
        
	}
	
	[self setSelectedCell:cell];
	
	[cell expand];
	
	if (oldPath && (oldPath.row != indexPath.row))
	{
		[tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects: indexPath, oldPath, nil] withRowAnimation:UITableViewRowAnimationNone];
		
		[oldPath release];
		oldPath = nil;
	}
	else
	{
		[tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects: indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
	}
}



-(IBAction)Post:(id)sender
{
    PostViewController *PostView = [[[PostViewController alloc] initWithNibName:@"PostViewController" bundle:nil] autorelease];
    
    UIViewController *sourceViewController = (UIViewController*)self;
    UIViewController *destinationController = (UIViewController*)PostView;
    
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
    
    
    //[self.navigationController pushViewController:PostView animated:YES];
    
    //[PostView release];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.opaque = NO;
    
    UIView *backgroud = [[UIView alloc] initWithFrame:self.view.bounds];
    backgroud.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"redBack.png"]];
    backgroud.contentMode = UIViewContentModeScaleAspectFill;
    
    backgroud.autoresizingMask =
    ( UIViewAutoresizingFlexibleBottomMargin
     | UIViewAutoresizingFlexibleHeight
     | UIViewAutoresizingFlexibleLeftMargin
     | UIViewAutoresizingFlexibleRightMargin
     | UIViewAutoresizingFlexibleTopMargin
     | UIViewAutoresizingFlexibleWidth );
    
    [self.view insertSubview:backgroud atIndex:0];
    if (self.test == true) {
        NSLog(@"true");
    }
    
}





#pragma mark Initializing

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (self == [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
		[self setDataSource:[NSArray arrayWithObjects:@"cell 0", @"cell 1", @"cell 2", nil]];
       
		
		//Setting the selected cell value to this blank instance of the custom cell great simplifies the heightForRowAtIndexPath
		//function and lets us avoid needing to hard code any values -- now the height is derived from a nib. This blank instance
		//will go away the first time a cell is selected for real.
        
        
            //set the title for the tab
            self.title = @"Questions";
            //set the image icon for the tab
            self.tabBarItem.image = [UIImage imageNamed:@"1.png"];
        
		[self setSelectedCell:[[[NSBundle mainBundle] loadNibNamed:@"ExpandingCell" owner:self options:nil] objectAtIndex:0]];
		
		blankCell = [self selectedCell];
		
		[blankCell setIndex:-1];
		[blankCell retain];
	}
	
	return self;
}




- (void)viewDidLoad
{	
    [super viewDidLoad];
    self.test = false;

    [DataModelDel load];
    
    NSLog(@"viewdidload");
//    self.dataModel = [[DataModel alloc] init];
//    
//        DataModel *testModel = [DataModelDel myModel];
//    //    NSLog(@"%@", newModel.option_left_votes[0]);
//        for (NSString *str in testModel.question_array) {
//         NSLog(@"%@", str);
//        }

    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
