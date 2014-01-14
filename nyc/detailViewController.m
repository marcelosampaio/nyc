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
    self.navigationItem.title=@"Detail Title";
    
    NSLog(@"detail com parametro=%@",self.detailItem);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
