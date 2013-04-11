//
//  Product.h
//  System3ign
//
//  Created by sanu on 04/12/12.
//
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
{

    NSString *productID;
    NSString *productName;
    NSString *Currency;
    NSString *price;
    NSString *productDescription;
    NSString *tac;
    NSString *mainpicURL;
    NSMutableArray *pictureURl;
    NSMutableArray *sameVendor;
    NSMutableArray *relatedProduct;
    NSString *inStore;
   
        


}


@property(nonatomic,retain)NSString *productID;
@property(nonatomic,retain)NSString *productName;
@property(nonatomic,retain)NSString *Currency;
@property(nonatomic,retain)NSString *price;
@property(nonatomic,retain)NSString *productDescription;
@property(nonatomic,retain)NSString *tac;
@property(nonatomic,retain)NSString *mainpicURL;
@property(nonatomic,retain)NSMutableArray *pictureURl;
@property(nonatomic,retain)NSMutableArray *sameVendor;
@property(nonatomic,retain)NSMutableArray *relatedProduct;
@property(nonatomic,retain)NSString *inStore;


@end
