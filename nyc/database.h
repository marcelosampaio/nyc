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

//Método para copiar o banco de dados dos recursos para documentos
-(void) verificaExistenciaECopiaBancoDeDadosGravavel;


// Carrega as letras iniciais para o indíce do tableView
-(NSMutableArray *)loadContentDependingOnMaster:(NSString *)master;

@property NSMutableDictionary *masterTableViewIndex;







@end
