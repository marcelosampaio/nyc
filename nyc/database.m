//
//  database.m
//  nyc
//
//  Created by Marcelo Sampaio on 1/13/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "database.h"

@interface database ()

@end

@implementation database

@synthesize masterTableViewIndex;


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
}


// Método para abertura do banco de dados
-(void) openDB
{
    if (sqlite3_open([[self dbPath] UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Falha na abertura do banco de dados.");
        return;
    }
}

-(NSString *) dbPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingPathComponent: @"nyc.db"];
}

//Método para copiar o banco de dados dos recursos para documentos
-(void) verificaExistenciaECopiaBancoDeDadosGravavel;{
    // Testa a existência de cópia editavel
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"nyc.db"];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success)
    {
        return;
    }
    
    // The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"nyc.db"];
    
    
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
}

// Carrega as letras iniciais para o indíce do tableView
-(NSMutableArray *)loadContentDependingOnMaster:(NSString *)master
{
    NSString *sql = [NSString stringWithFormat:@"select upper(substr(name,1,1)),count(*) from museum group by upper(substr(name,1,1))"];
    NSMutableArray *parameters=[[NSMutableArray alloc]init];
    
    
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            //Campo 1 - index Letter
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSMutableString *field1Str = [[NSMutableString alloc] initWithUTF8String:field1];
            
            //Campo 2 - quantity of records per index letter
            char *field2 = (char *) sqlite3_column_text(statement, 1);
            NSMutableString *field2Str = [[NSMutableString alloc] initWithUTF8String:field2];

            NSMutableString *tempString = [NSMutableString stringWithFormat:@"%@",field1Str];[tempString appendFormat:@";"];[tempString appendFormat:@"%@",field2Str];
            //Carrega o Array de Retorno com os resultados
            [parameters addObject:tempString];
        }
    }
    else
    {
        NSAssert(0,@"Error reading data to build index");
    }
    return parameters;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
