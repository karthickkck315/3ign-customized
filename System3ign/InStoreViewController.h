//
//  InStoreViewController.h
//  System3ign
//
//  Created by sanu on 14/12/12.
//
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface InStoreViewController : UIViewController{
    
    Product *productObj;
}
- (IBAction)backtoscan:(id)sender;

- (IBAction)share:(id)sender;

@property(nonatomic,retain) Product *productObj;
@end
