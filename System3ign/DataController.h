//
//  DataController.h
//  System3ign
//
//  Created by sanu on 05/12/12.
//
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "ProductDetailsViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"



@interface DataController : NSObject <NSXMLParserDelegate>
{

    Product *pdtObject;
    NSString *currentElement;
    NSMutableArray *productArray;
    NSString *previousElement1;
    NSString *previousElement2;
    NSMutableDictionary *productDic;
    BOOL isSameVendor;
    BOOL isProduct;
    Product *vendorProductObject;
    Product *relatedProductObject;
    BOOL isMainProduct;
    BOOL isRelated;
    BOOL isGreenare3ign;
    BOOL isdescription;
    BOOL isTac;
    NSString *ProductUrlString;
    
   

}
@property(nonatomic) BOOL isProduct;
@property(nonatomic)BOOL isSameVendor;
@property(nonatomic,retain)Product *pdtObject;
@property(nonatomic,retain)NSMutableArray *productArray;
@property(nonatomic,retain)NSString *ProductUrlString;

-(Product *)getProductDetails:(NSString *)urlString;
-(void)registeringUserDetails:(NSMutableDictionary *)dic;

- (void)requestFinished:(ASIHTTPRequest *)request;
- (void)requestFailed:(ASIHTTPRequest *)request;


-(void)getmyProductDetails;
-(Product *)parseProductDetails:(NSMutableData *)data;



@end
