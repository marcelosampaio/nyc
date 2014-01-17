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
    
    
    self.navigationItem.title=@"Detail Title";
    
    NSLog(@"detail com parametro=%@",self.detailItem);
}

-(void)scrollInitialization
{
    self.scroll.scrollEnabled=YES;
    self.scroll.contentSize=CGSizeMake(320, 3000);
    // Loop para injetar varios labels para ocupar a altura de 3000
    
    for (int i=15; i<3000; i=i+15) {
        UILabel *msg=[[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2, i, 100, 20)];
        msg.text=[NSString stringWithFormat:@"%d",i];
        msg.textAlignment=NSTextAlignmentRight;
        [self.scroll addSubview:msg];
    }
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
