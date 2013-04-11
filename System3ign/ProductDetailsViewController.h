//
//  ProductDetailsViewController.h
//  System3ign
//
//  Created by Shri on 25/11/12.
//
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "Product.h"
#import "SignUpView.h"
#import "ImageDownloader.h"
#import "Image.h"
#import "ImageScroll.h"
#import "CustomAlertViewController.h"
#import "ShareViewController.h"



#import "ImageSliderViewController.h"
@interface ProductDetailsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate, ImageDownloaderDelegate>{
// NSMutableArray *imageURLArray;
    Product *productObject;
    BOOL isInsert;
    UIButton *button;
    SignUpView *subView;
    BOOL isfirstTimeParsing;
    UILabel *label;
    UIImageView *grey_imgView;
    
    NSURLConnection* connection;
    NSMutableData* data;
    
    NSString *productUrl;
    UIActivityIndicatorView *loadingIndicator;
    
    
    NSMutableArray* imagesForSlider;  
        
}
@property(nonatomic,retain)NSString *productUrl;



@property (weak, nonatomic) IBOutlet UIBarButtonItem *backBarbutton;
//@property(nonatomic,retain) NSMutableArray *imageURLArray;
//technical properties
@property(nonatomic,retain)Product *vendorProductObject;
@property(nonatomic,retain)Product *productObject;
@property (strong, nonatomic) IBOutlet UILabel *productname;
@property (strong, nonatomic) IBOutlet UILabel *productamount;

@property(nonatomic)BOOL isInsert;
@property (strong, nonatomic) IBOutlet Image *MainImage;

- (IBAction)backtocamera:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *vendorProductName;

@property (strong, nonatomic) IBOutlet UILabel *vendorProductPrice;

@property (strong, nonatomic) IBOutlet UITableView *vendorProductList;

@property(nonatomic,retain)IBOutlet  UIImageView *grey_imgView;



@property (strong, nonatomic) IBOutlet UIView *discriptionview;

@property (strong, nonatomic) IBOutlet UIImageView *vendorProductImg;




//design properties
-(IBAction)signNow:(id)sender;
- (IBAction)addToCartAction:(id)sender;
- (IBAction)productDescriptionAction:(id)sender;
- (IBAction)termsAction:(id)sender;
- (IBAction)productFromVendorAction:(id)sender;
- (IBAction)signIT3ign:(id)sender;

-(void)removeGreyBackground;


@property (strong, nonatomic) IBOutlet UITextView *descriptiontextview;

@property (strong, nonatomic) IBOutlet UIButton *descriptionButton;
@property (strong, nonatomic) IBOutlet UIButton *termsButton;
@property (strong, nonatomic) IBOutlet UIButton *vendorButton;
- (IBAction)share:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *Productvendor;
@property (strong, nonatomic) IBOutlet UIView *Terms;
@property (strong, nonatomic) IBOutlet UIImageView *vendorProductImage;

@property (strong, nonatomic) IBOutlet UITextView *termsTxtView;
- (IBAction)resignKeyboard:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activeanimate;


@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
- (IBAction)addToCart:(id)sender;
- (IBAction)ignit:(id)sender;



- (IBAction)purchase:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *ignITNowButton;
@property (strong, nonatomic) IBOutlet UIButton *addTocartButton;


-(void)DownloadImage;

@end