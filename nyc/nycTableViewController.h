//
//  nycTableViewController.h
//  nyc
//
//  Created by Marcelo Sampaio on 1/13/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class nycSubTableViewController;

@interface nycTableViewController : UITableViewController

// parameter from nycViewController
@property (strong, nonatomic) id detailItem;
//-----------------------------------------

@property NSMutableArray *nycSource;

@property (strong, nonatomic) nycSubTableViewController *nycSubTableViewController;


@end
