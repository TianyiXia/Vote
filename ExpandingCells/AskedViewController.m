//
//  AskedViewController.m
//  ExpandingCells
//
//  Created by ShaoLei on 1/31/15.
//  Copyright (c) 2015 sbyrd. All rights reserved.
//

#import "AskedViewController.h"
#import "ProfileViewController.h"
#import "DataModelDel.h"
#import "event.h"

@interface AskedViewController ()

@end

@implementation AskedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//  ViewController.m
//  ExpandingCells
//
//  Created by work on 1/7/13.
//  Copyright (c) 2013 sbyrd. All rights reserved.
//


@synthesize dataSource;
@synthesize selectedCell;


static Cell* blankCell = nil;


#pragma mark Data Source Delegate Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    Cell*		cell		= [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
//    NSString*	cellName	= [[self dataSource] objectAtIndex:[indexPath row]];
//    
//    if (cell == nil)
//    {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"AskedExpandingCell" owner:self options:nil] objectAtIndex:0];
//    }
//    
//    [cell setIndex:[indexPath row]];
//    [[cell cellName] setText:cellName];
//    
//    
//        NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:2];
//        
//        NSNumber *one = [NSNumber numberWithInt:2];
//        [dataArray addObject:one];
//        
//        NSNumber *two = [NSNumber numberWithInt:3];
//        [dataArray addObject:two];
//        
//        [self.pieChartView renderInLayer:self.pieChartView dataArray:dataArray];
//        
//    
//    return cell;
    DataModel *current_data_model = [DataModelDel myModel];
    //
    //    for (NSString *str in current_data_model.question_array) {
    //                 NSLog(@"%@", str);
    //                }
    
    
    [self setDataSource:[NSArray arrayWithArray:current_data_model.event_array]];
    
    Cell*		cell		= [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    event *currentEvent = [[self dataSource] objectAtIndex:[indexPath row]];    //    for (NSString *str in self.dataSource) {
    //                         NSLog(@"%@", str);
    //                        }
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AskedExpandingCell" owner:self options:nil] objectAtIndex:0];
    }
    
    [cell setIndex:[indexPath row]];
    
    NSString*	cellName = currentEvent.eventName;
    
    [[cell cellName] setText:cellName];
    
    NSString* cellDetail = [NSString stringWithFormat:
                            @"Time: %@\nPlace: %@\nHost by: %@\nJoined People:%@\n",
                            currentEvent.eventTime, currentEvent.eventPlace, currentEvent.owner, currentEvent.joinPeople ];
    
    [[cell eventDetail] setText:cellDetail];
    
    return cell;

}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DataModel *current_data_model = [DataModelDel myModel];

    return [current_data_model.event_array count];
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
    
    if ([cell frame].size.height == 50) {
        [cell expand];
    }
    
    else{
        
        [cell contract];
    }
    
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



-(IBAction)back:(id)sender
{
    ProfileViewController *PostView = [[[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil] autorelease];
    
    
    [self.navigationController pushViewController:PostView animated:YES];
    
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
                [self setSelectedCell:[[[NSBundle mainBundle] loadNibNamed:@"AskedExpandingCell" owner:self options:nil] objectAtIndex:0]];
        
        blankCell = [self selectedCell];
        
        [blankCell setIndex:-1];
        [blankCell retain];
    }
    
    return self;
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
