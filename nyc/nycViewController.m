//
//  nycViewController.m
//  nyc
//
//  Created by Marcelo Sampaio on 1/12/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "nycViewController.h"
#import "nycTableViewController.h"
#import "database.h"

@interface nycViewController ()

@property (nonatomic,strong) database *brain;

@end

@implementation nycViewController

@synthesize nycSource;
@synthesize brain=_brain;

@synthesize masterTableViewIndex;

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
    
    //Cópia do banco de dados (apenas na primeira utilização) do Resource Folder para o Documents Folder para que possa ser manipulada.
    [self.brain verificaExistenciaECopiaBancoDeDadosGravavel];
    
    // open app database
    [self.brain openDB];
    
    //Retrieve the masterTableViewIndex
    NSLog(@"viewController viewDidLoad");
    self.masterTableViewIndex=[self.brain loadIndex];
    
    
    
    [self loadSource];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)loadSource
{
    self.nycSource=[[NSMutableArray alloc]initWithObjects:@"Business",@"Recreation",@"Social",@"Transports", nil];
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
    return [self.nycSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text=[self.nycSource objectAtIndex:indexPath.row];
    switch (indexPath.row) {
        case 0:
            cell.imageView.image=[UIImage imageNamed:@"business.png"];
            break;
        case 1:
            cell.imageView.image=[UIImage imageNamed:@"recreation.png"];
            break;
        case 2:
            cell.imageView.image=[UIImage imageNamed:@"socialService.png"];
            break;
        default:
            cell.imageView.image=[UIImage imageNamed:@"transportation.png"];
            break;
            
    }
    
    return cell;
}


// Passing nycTableViewController parameter
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.nycTableViewController.detailItem = [self.nycSource objectAtIndex:indexPath.row];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setDetailItem:[self.nycSource objectAtIndex:indexPath.row]];
        
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
