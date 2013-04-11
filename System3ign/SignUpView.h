//
//  SignUpView.h
//  System3ign
//
//  Created by shri@ideazglobal.com on 20/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpView : UIView
@property (strong, nonatomic) IBOutlet UILabel *accountpass1;
@property (strong, nonatomic) IBOutlet UILabel *accountpass2;
@property (strong, nonatomic) IBOutlet UILabel *conformaccpass1;
@property (strong, nonatomic) IBOutlet UILabel *confromaccpass2;
@property (strong, nonatomic) IBOutlet UILabel *emaillabel;
@property (strong, nonatomic) IBOutlet UILabel *conformemaillabel1;
@property (strong, nonatomic) IBOutlet UILabel *conformemaillabel2;
@property (strong, nonatomic) IBOutlet UILabel *shppinglab1;
@property (strong, nonatomic) IBOutlet UILabel *shippinglab2;
@property (strong, nonatomic) IBOutlet UITextView *cvcNeedTextview;
@property (strong, nonatomic) IBOutlet UIImageView *cvcGrayback;
@property (strong, nonatomic) IBOutlet UILabel *cvcNeedcvclabel;
@property (strong, nonatomic) IBOutlet UITextView *cvcFindcvcLabel;
@property (strong, nonatomic) IBOutlet UILabel *cvcFindCvclabel;
@property (strong, nonatomic) IBOutlet UIButton *cvcBlueBck;

@property (strong, nonatomic) IBOutlet UIButton *userinfoscreenimageoutlet;
- (IBAction)Creditcardtextaction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *signupcreditcardbluebackgroundoutlet;
@property (strong, nonatomic) IBOutlet UILabel *signupCreditCardTypelabel;
@property (strong, nonatomic) IBOutlet UIImageView *signUpCreditCardGrayback;
@property (strong, nonatomic) IBOutlet UIImageView *signupCreditCardWhitelineimage;
@property (strong, nonatomic) IBOutlet UILabel *signupCreditcerdTitlelabel;
@property (strong, nonatomic) IBOutlet UIImageView *signupWhiteBackgorund;
@property (strong, nonatomic) IBOutlet UIImageView *signUpUnderuserinfoimage;

@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordText;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;
@property (strong, nonatomic) IBOutlet UITextField *mailIDText;
@property (strong, nonatomic) IBOutlet UITextField *confirmMailIDText;

@property (strong, nonatomic) IBOutlet UITextField *usernameText;

@property (strong, nonatomic) IBOutlet UITextField *shippingAddressText;
@property (strong, nonatomic) IBOutlet UIImageView *signupDralBlueBackground;

@property (strong, nonatomic) IBOutlet UIButton *firstViewSubmit;
@property (strong, nonatomic) IBOutlet UIButton *firstViewSkip;
@property (strong, nonatomic) IBOutlet UIScrollView *firstViewScroller;
@property (strong, nonatomic) IBOutlet UIScrollView *signupcrediscrollview;
@property (strong, nonatomic) IBOutlet UIButton *aboutCVC;
@property (strong, nonatomic) IBOutlet UIButton *closeButtonForView1;
@property (strong, nonatomic) IBOutlet UITextField *creditCardTypeText;
@property (strong, nonatomic) IBOutlet UIButton *cardTypeButton;
@property (strong, nonatomic) IBOutlet UIButton *closeCVC;
@property (strong, nonatomic) IBOutlet UIImageView *imageSlideView;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UIImageView *whitrlineimage;
@property (strong, nonatomic) IBOutlet UIButton *closeButtonForView2;
@property (strong, nonatomic) IBOutlet UIButton *backButtonForView2;
@property (strong, nonatomic) IBOutlet UIButton *push2ScanQRCode;

@property (strong, nonatomic) IBOutlet UITextField *cardHolderName;
@property (strong, nonatomic) IBOutlet UITextField *cardNumber;
@property (strong, nonatomic) IBOutlet UITextField *expirydate;
@property (strong, nonatomic) IBOutlet UITextField *cvcText;
//hidden variables
@property (strong, nonatomic) IBOutlet UILabel *signuptitlelabel;
@property (strong, nonatomic) IBOutlet UIImageView *titleNoFlow;
@property (strong, nonatomic) IBOutlet UILabel *cvcsignuptitlelabel;
@property (strong, nonatomic) IBOutlet UIImageView *cvcNoflow;
@property (strong, nonatomic) IBOutlet UILabel *usernamelabel;
@property (strong, nonatomic) IBOutlet UIButton *userInfoSkip;
@property (strong, nonatomic) IBOutlet UIImageView *signupuserinfobackgroundimageoutlet;


@end
