//
//  nycViewController.h
//  nyc
//
//  Created by Marcelo Sampaio on 1/12/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class nycTableViewController;

@interface nycViewController : UITableViewController

@property NSMutableArray *nycSource;

@property (strong, nonatomic) nycTableViewController *nycTableViewController;

// Retrieved from the database
@property NSMutableDictionary *masterTableViewIndex;

@end
