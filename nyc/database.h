//
//  database.h
//  nyc
//
//  Created by Marcelo Sampaio on 1/13/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface database : UIViewController
{
    sqlite3 *db;
}


// Método para abertura do banco de dados
-(void) openDB;

-(NSString *) dbPath;

@end
