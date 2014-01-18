//
//  nycSubTableViewController.m
//  nyc
//
//  Created by Marcelo Sampaio on 1/13/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "nycSubTableViewController.h"
#import "nycTableViewController.h"
#import "detailViewController.h"
#import "database.h"

@interface nycSubTableViewController ()

@property (nonatomic,strong) database *brain;

@end

@implementation nycSubTableViewController

@synthesize subMasterSource;
@synthesize brain=_brain;

//Lazy Instatiation de meu Model ------
- (database *) brain
{
    if(!_brain)
    {
        _brain = [[database alloc] init];
    }
    return _brain;
}
// -------------- end of lazy instatiation

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // open app database
    [self.brain openDB];
    
    // display input property
    self.navigationItem.title=self.detailItem;
    
    // load source
    self.subMasterSource=[self.brain loadContentDependingOnMaster:self.detailItem];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.subMasterSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    // get all rows
    NSArray *row = [[self.subMasterSource objectAtIndex:indexPath.row] componentsSeparatedByString:@";"];
    NSString *name=[NSString stringWithFormat:@"%@",[row objectAtIndex:0]];
//    NSString *phone=[NSString stringWithFormat:@"%@",[row objectAtIndex:1]];
//    NSString *url=[NSString stringWithFormat:@"%@",[row objectAtIndex:2]];
//    NSString *address1=[NSString stringWithFormat:@"%@",[row objectAtIndex:3]];
//    NSString *address2=[NSString stringWithFormat:@"%@",[row objectAtIndex:4]];
//    NSString *city=[NSString stringWithFormat:@"%@",[row objectAtIndex:5]];
//    NSString *zipCode=[NSString stringWithFormat:@"%@",[row objectAtIndex:6]];
    
    cell.textLabel.text=name;
    
    return cell;
}


// Passing nycTableViewController parameter
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.detailViewController.detailItem = self.detailItem;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail3"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSMutableString *tempString=[NSMutableString stringWithFormat:@"%@",self.detailItem];[tempString appendString:@";"];[tempString appendFormat:@"%@",[self.subMasterSource objectAtIndex:indexPath.row]];

        [[segue destinationViewController] setDetailItem:tempString];

    }
}






/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
