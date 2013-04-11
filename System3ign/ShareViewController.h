//
//  ShareViewController.h
//  System3ign
//
//  Created by sanu on 30/11/12.
//
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import <FacebookSDK/FacebookSDK.h>
#import "Product.h"
#import "TransactionView.h"
@interface ShareViewController : UIViewController<UIAlertViewDelegate>{
//    NSString *imageURLString;
//    NSString *titleString;
//    NSString *detailString;
//    NSString *descriptionString;
//    NSString *shopUrlString;
    BOOL ischeck;
        BOOL ischecktwit;
    Product *productObj;
    BOOL isbothShared;
    BOOL istwitshareonly;
    NSTimer * myTimer;
    TransactionView *popup;
    }
@property(nonatomic,retain) Product *productObj;
@property(nonatomic)BOOL istwitshareonly;
@property(nonatomic)BOOL ischeck;
@property(nonatomic)BOOL ischecktwit;

- (IBAction)Back:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *checkboxfb;
@property (strong, nonatomic) IBOutlet UIButton *checkboxtwit;
- (IBAction)checkBoxbuttonfb:(id)sender;
- (IBAction)checkBoxbuttontwit:(id)sender;

- (IBAction)sharebutton:(id)sender;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activie;






-(void)twitterShare;
-(void)fbShare;
@end
