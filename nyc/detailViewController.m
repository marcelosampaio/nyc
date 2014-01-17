//
//  detailViewController.m
//  nyc
//
//  Created by Marcelo Sampaio on 1/14/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "detailViewController.h"
#import "nycSubTableViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController

@synthesize scroll;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self scrollInitialization];
    
    
//    self.navigationItem.title=@"Detail Title";
    
    NSLog(@"detail com parametro=%@",self.detailItem);
}

-(void)scrollInitialization
{

    self.scroll.scrollEnabled=YES;
    self.scroll.contentSize=CGSizeMake(320, 3000);

    // Verify Master origin
    NSArray *row = [self.detailItem componentsSeparatedByString:@";"];
    NSString *origin=[NSString stringWithFormat:@"%@",[row objectAtIndex:0]];
    [self formatLayOutFromMaster:origin];
    
    
    // Loop para injetar varios labels para ocupar a altura de 3000
    
//    for (int i=20; i<3000; i=i+20) {
//        UILabel *msg=[[UILabel alloc]initWithFrame:CGRectMake(1, i, 320, 25)];
//        msg.text=[NSString stringWithFormat:@"Jerusalem Museum"];
//        msg.textAlignment=NSTextAlignmentCenter;
//        msg.textColor=[UIColor blackColor];
//        
//        
//        
//        
//        [self.scroll addSubview:msg];
//    }
    

}

-(void)formatLayOutFromMaster:(NSString *)master
{
    if ([master isEqualToString:@"Museum"])
    {
        [self formatMuseumLayOut];
    }
}

-(void)formatMuseumLayOut
{
    // get all rows
    NSArray *row = [self.detailItem componentsSeparatedByString:@";"];
    NSString *name=[NSString stringWithFormat:@"%@",[row objectAtIndex:1]];
    
    // content 1
    // Header with Museum name
    UILabel *msg=[[UILabel alloc]initWithFrame:CGRectMake(1, 20, 320, 25)];
    
    msg.text=[NSString stringWithFormat:@"%@",name];
    msg.textAlignment=NSTextAlignmentCenter;
    msg.textColor=[UIColor blackColor];
    
    [self.scroll addSubview:msg];
    
    // end of content 1

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
