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
    NSString *phone=[NSString stringWithFormat:@"%@",[row objectAtIndex:2]];
    NSString *url=[NSString stringWithFormat:@"%@",[row objectAtIndex:3]];
    NSString *address1=[NSString stringWithFormat:@"%@",[row objectAtIndex:4]];
    NSString *address2=[NSString stringWithFormat:@"%@",[row objectAtIndex:5]];
    NSString *city=[NSString stringWithFormat:@"%@",[row objectAtIndex:6]];
    NSString *zipCode=[NSString stringWithFormat:@"%@",[row objectAtIndex:7]];
    
    // content 1
    // Master icon
    
    UIImageView *masterIcon = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width/2)-14, 20, 28, 25)];
    masterIcon.image = [UIImage imageNamed:@"recreation.png"];
    [self.scroll addSubview:masterIcon];
    // end of content 1
  
    // content 2
    // Header with Museum name
    UILabel *msg=[[UILabel alloc]initWithFrame:CGRectMake(1, 50, 320, 50)];
    
    msg.text=[NSString stringWithFormat:@"%@",name];
    msg.textAlignment=NSTextAlignmentCenter;
    msg.textColor=[UIColor blackColor];
    msg.lineBreakMode=NSLineBreakByWordWrapping;
    msg.numberOfLines=2;
    msg.font=[UIFont boldSystemFontOfSize:17];
    
    [self.scroll addSubview:msg];
    
    // end of content 2

    
    // content 3
    // Phone number
    UILabel *msg2=[[UILabel alloc]initWithFrame:CGRectMake(1, 120, 320, 25)];
    
    msg2.text=[NSString stringWithFormat:@"%@",phone];
    msg2.textAlignment=NSTextAlignmentCenter;
    msg2.textColor=[UIColor darkGrayColor];

    
    [self.scroll addSubview:msg2];
    
    // end of content 3

    
    // content 4
    // URL
    UILabel *msg3=[[UILabel alloc]initWithFrame:CGRectMake(1, 150, 320, 50)];
    
    msg3.text=[NSString stringWithFormat:@"%@",url];
    msg3.textAlignment=NSTextAlignmentCenter;
    msg3.textColor=[UIColor blueColor];
    msg3.lineBreakMode=NSLineBreakByWordWrapping;
    msg3.numberOfLines=2;
    msg3.alpha=0.45f;
    
    
    [self.scroll addSubview:msg3];
    
    // end of content 4
    
    int lineFeeder=210;
    
    // content 5
    // Address 1
    UILabel *msg4=[[UILabel alloc]initWithFrame:CGRectMake(1, lineFeeder, 320, 50)];
    
    msg4.text=[NSString stringWithFormat:@"%@",address1];
    msg4.textAlignment=NSTextAlignmentCenter;
    msg4.textColor=[UIColor darkGrayColor];
    msg4.lineBreakMode=NSLineBreakByWordWrapping;
    msg4.numberOfLines=2;


    
    [self.scroll addSubview:msg4];
    
    // end of content 5
    
    // calculate line feeder
    
    if ([address2 isEqualToString:@" "]) {
        lineFeeder=lineFeeder+20;
    }
    else
    {
        lineFeeder=lineFeeder+30;
    }
    
    // content 6
    // Address 2
    UILabel *msg5=[[UILabel alloc]initWithFrame:CGRectMake(1, lineFeeder, 320, 25)];
    
    msg5.text=[NSString stringWithFormat:@"%@",address2];
    msg5.textAlignment=NSTextAlignmentCenter;
    msg5.textColor=[UIColor darkGrayColor];
    
    
    [self.scroll addSubview:msg5];
    
    // end of content 6
    
    
    lineFeeder=lineFeeder+25;
    
    // content 7
    // City
    UILabel *msg6=[[UILabel alloc]initWithFrame:CGRectMake(1, lineFeeder, 320, 25)];
    
    msg6.text=[NSString stringWithFormat:@"%@",city];
    msg6.textAlignment=NSTextAlignmentCenter;
    msg6.textColor=[UIColor darkGrayColor];
    
    
    [self.scroll addSubview:msg6];
    
    // end of content 8

    lineFeeder=lineFeeder+25;
    
    // content 8
    // Zip Code
    UILabel *msg7=[[UILabel alloc]initWithFrame:CGRectMake(1, lineFeeder, 320, 25)];
    
    msg7.text=[NSString stringWithFormat:@"%@",zipCode];
    msg7.textAlignment=NSTextAlignmentCenter;
    msg7.textColor=[UIColor darkGrayColor];
    
    
    [self.scroll addSubview:msg7];
    
    // end of content 7





}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
