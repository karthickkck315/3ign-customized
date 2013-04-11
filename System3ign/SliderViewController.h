//
//  SliderViewController.h
//  System3ign
//
//  Created by sanu on 05/12/12.
//
//

#import <UIKit/UIKit.h>
#import "ScannerViewController.h"
#import "SignUpView.h"
#import "TransactionView.h"
#import "Product.h"
@interface SliderViewController : UIViewController <UIAlertViewDelegate>
{
    ScannerViewController *scanner;
    SignUpView *signUpView;
    TransactionView *Transactionview;
    
    NSString *isScreenType;
//    NSString *isaccountinfo;
    
    
    //added by sri
   
    int patternlock;
    BOOL isFirstTimePatterPassword;
    Product *productObj;
    
    UIButton *button;
}
@property(nonatomic) BOOL isFirstTimePatterPassword;
@property(nonatomic,retain)Product *productObj;
@property (strong, nonatomic) IBOutlet UIImageView *Slider;
- (IBAction)signnow:(id)sender;
@property(nonatomic,strong) NSString *isScreenType;
//@property(nonatomic, strong)    NSString *isaccountinfo;
@end
