//
//  nycSubTableViewController.h
//  nyc
//
//  Created by Marcelo Sampaio on 1/13/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface nycSubTableViewController : UITableViewController


// parameter from nycSubTableViewController
@property (strong, nonatomic) id detailItem;
//-----------------------------------------

@property NSMutableArray *subMasterSource;

@end
