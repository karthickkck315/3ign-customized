//
//  ProductAddToCartViewController.h
//  System3ign
//
//  Created by sanu on 12/12/12.
//
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Product.h"
#import "ProductDetailsViewController.h"
#import "ViewCardlistViewController.h"

@interface ProductAddToCartViewController : UIViewController
{

     sqlite3 *productDB;
    NSString *databasePath;
    Product *productObject;
    
   
    ProductDetailsViewController *pdvc;
    
   
}


@property(nonatomic,retain) ProductDetailsViewController *pdvc;
@property(nonatomic,retain)Product *productObject;

-(ProductDetailsViewController *)insertProductIntoDB;
-(NSMutableArray *)fetchDataFromDB;
-(void)removeValueFromDB:(NSString *)value;
@end
