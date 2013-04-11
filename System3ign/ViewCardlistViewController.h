//
//  TablelistViewController.h
//  System3ign
//
//  Created by DEVA on 08/12/12.
//
//

#import <UIKit/UIKit.h>
#import "CartListCell.h"
#import "ProductAddToCartViewController.h"
#import "Product.h"
#import "ImageDownloader.h"

@interface ViewCardlistViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,ImageDownloaderDelegate>
{
    IBOutlet UITableView *tablelist;
    NSMutableArray *arry;
    NSMutableArray *pricearray;
    NSArray *checkboxarray;
    
    BOOL ischeck;
    CartListCell *cell;
       
    NSMutableArray *cartListIDArray;
    
    Product *productObj;
    UIButton *button;
    UILabel *label;
    
    NSMutableArray *productListArray;
    
   // UIActivityIndicatorView *activityIndicator;
    
    
    int totalPrice;
    
    
    
}
@property (strong, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property(nonatomic,retain) Product *productObj;
@property(nonatomic,retain)NSMutableArray *cartListIDArray;

@property (weak, nonatomic) IBOutlet UIButton *editbutton;

@property (strong, nonatomic) IBOutlet UIView *viewbackground;
@property (strong, nonatomic) IBOutlet UITableView *tablelist;



@property (strong ,nonatomic) IBOutlet NSArray *checkboxarray;
//@property (strong, nonatomic) IBOutlet UIBarButtonItem *checkbox;

- (IBAction) EditTable:(id)sender;
//- (IBAction) Checkbox:(id)sender;

- (IBAction)signit:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *signIT;


//@property(nonatomic,retain)IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;


@end


