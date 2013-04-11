//
//  TransactionView.h
//  System3ign
//
//  Created by DEVA on 07/12/12.
//
//

#import <UIKit/UIKit.h>

@interface TransactionView : UIView
@property (strong, nonatomic) IBOutlet UIButton *closepopup1;
@property (weak, nonatomic) IBOutlet UIButton *closepopup2;
@property (strong, nonatomic) IBOutlet UIButton *shipping;
@property (weak, nonatomic) IBOutlet UIButton *shippingchange;
@property (weak, nonatomic) IBOutlet UIButton *shippingconform;
@property (strong, nonatomic) IBOutlet UIButton *fbpopclose;
@property (strong, nonatomic) IBOutlet UIButton *closepop;
@property (strong, nonatomic) IBOutlet UIButton *post;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activie1;

@property (strong, nonatomic) IBOutlet UIButton *gotolock;
@end
