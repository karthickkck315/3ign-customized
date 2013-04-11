//
//  ProductAddToCartViewController.m
//  System3ign
//
//  Created by sanu on 12/12/12.
//
//

#import "ProductAddToCartViewController.h"
#import "SignInViewController.h"
@interface ProductAddToCartViewController ()
@property(nonatomic,retain)ViewCardlistViewController *listObject;

@end

@implementation ProductAddToCartViewController
@synthesize productObject,pdvc,listObject;


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
    
    
    pdvc=[[ProductDetailsViewController alloc]init];
    
        NSString *docsDir;
        NSArray *dirPaths;
    
        dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        docsDir = [dirPaths objectAtIndex:0];
    
    
    
    // Build the path to the database file
    
    
        databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"products1.db"]];

    
        NSFileManager *filemgr = [NSFileManager defaultManager];
    
        if ([filemgr fileExistsAtPath: databasePath ] == NO)
        
        {
        
                const char *dbpath = [databasePath UTF8String];
        
        
        
            if (sqlite3_open(dbpath, &productDB) == SQLITE_OK)
            
            {
            
            char *errMsg;
            
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS PRODUCTS1 (PRODUCTID TEXT PRIMARY KEY)";
            
            
            
                if (sqlite3_exec(productDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
                {
                    NSLog(@"Failed to create table");
                    
                }
                
            
            
                sqlite3_close(productDB);
            
            
            
            } else {
            
                    NSLog(@"Failed to open/create database");
            
            }
        }
    
    
    
    
    
    
    [super viewDidLoad];
    
}




-(ProductDetailsViewController *)insertProductIntoDB{

       NSLog(@"id%@",productObject.productID);
        sqlite3_stmt    *statement;
        
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &productDB) == SQLITE_OK)
            
        {
            
                NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO PRODUCTS1 (PRODUCTID) VALUES (\"%@\")", productObject.productID];
            
            
            
                const char *insert_stmt = [insertSQL UTF8String];
            
            
            
                sqlite3_prepare_v2(productDB, insert_stmt, -1, &statement, NULL);
            
                if (sqlite3_step(statement) == SQLITE_DONE)
                
                {
                
                        NSLog(@"Contact added");
                    
                        [pdvc setIsInsert:YES];
              
                
                } else {
                
                        NSLog(@"Failed to add contact");
                        [pdvc setIsInsert:NO];
                
                }
            
            sqlite3_finalize(statement);
            
            sqlite3_close(productDB);
            
        }
        
        
        
    return pdvc;
    

}

-(void)removeValueFromDB:(NSString *)value{
    
    
    sqlite3 *database;
    
    sqlite3_stmt *stmt;
    
    
    
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK){
        
        NSString *deleteSQL=[NSString stringWithFormat:@"DELETE FROM PRODUCTS1 WHERE PRODUCTID=\"%@\"",value];
        
            NSLog(@"Query : %@",deleteSQL);
        
            const char *delete_stmt=[deleteSQL UTF8String];
        
                sqlite3_prepare_v2(database, delete_stmt, -1, &stmt, NULL);
        
        if(sqlite3_step(stmt) == SQLITE_DONE)
            
        {
            
           // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete" message:@"Record Deleted..!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
                   // [alert show];
            
            NSLog(@"Record Deleted..!!");
            
        }
        
        else
            
        {
            
          //  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete" message:@"Record Not Deleted..!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
               // [alert show];
            
              NSLog(@"Record failed to Delete..!!");
            
        }
        
        
    }
    
}


    
    




-(NSMutableArray *)fetchDataFromDB{
     
        
        sqlite3 *database;
        NSMutableArray  *arr = [[NSMutableArray alloc] init];
        
        // Open the database from the users filessytem
        
        if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
            
                    NSLog(@"chk 1");
            
        // Setup the SQL Statement and compile it for faster access
            
                const char *sqlStatement = "SELECT * FROM PRODUCTS1";
            
                sqlite3_stmt *compiledStatement;
            
                if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
                
                    NSLog(@"chk 2");
                
                    // Loop through the results and add them to the feeds array
                
                        while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                    
                            // Read the data from the result row
                    
                                NSLog(@"chk 3");
                    
                    
                    
                                NSString *bName=[NSString stringWithFormat: @"%s",(char *)sqlite3_column_text(compiledStatement, 0)];
                    
                                NSLog(@"bname   %@",bName);
                    
                                [arr addObject:bName];
                        }
                
                }
            
            // Release the compiled statement from memory
            
            sqlite3_finalize(compiledStatement);
            
            
            
        }
        
        sqlite3_close(database); 
        
        
    
    return arr;
    
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [self setProductObject:Nil];
    [self setPdvc:Nil];
    
   
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
