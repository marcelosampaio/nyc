//
//  detailViewController.h
//  nyc
//
//  Created by Marcelo Sampaio on 1/14/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scroll;


// parameter from nycSubTableViewController
@property (strong, nonatomic) id detailItem;
//-----------------------------------------



@end
