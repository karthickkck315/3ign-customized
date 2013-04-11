//
//  SignInViewController.h
//  System3ign
//
//  Created by shri@ideazglobal.com on 20/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignInView.h"
#import "SignUpView.h"
#import "TransactionView.h"
#import "DrawPatternLockViewController.h"
@interface SignInViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, NSXMLParserDelegate>{
    
    SignInView *signInView;
    SignUpView *signUpView;
    SignUpView *savedView1;
    SignUpView *savedView2;
    SignUpView *cvcView;
    SignUpView *slider;
    
    NSString *UserNameStr;
    NSString *UserPasswordstr;
    NSString *Emailstr;
    NSString *ShippingAddressstr;
    NSString *currentElement;
    
    
    
    NSString *cardtypeStr;
    NSString *cardNameStr;
    NSString *cardNumberStr;
    NSString *cardCvcStr;
    NSString *cardExpiryDate;
    NSString *passwordValidation;
    
    
    
    NSString *signInPwd;
    
    
    CGPoint offset;
    UITextField *currentTextField;
    BOOL keyboardIsShown;
    
    
    UIPickerView *picker;
    UIToolbar *mypickerToolbar;
    UILabel *pickerNameLabel;
    NSMutableDictionary *userInfoDIc;
    
    TransactionView *Transactionview;
//    NSString *isScreenType;
    NSString *patternPassword;
    BOOL isFirstTimePatterPassword;
    NSString *isScreenType;
    UIButton *button;
    BOOL isChangeUserInfo;
    UILabel *label;
    BOOL isCheck;
    NSUserDefaults *savepassword;
    NSString *siginview;
}
@property (nonatomic, strong)NSString *siginview;
@property(nonatomic) BOOL isChangeUserInfo;
@property(nonatomic)BOOL is3ignPassword;
@property(nonatomic)BOOL isSignIn;

@property(nonatomic)BOOL isUserInfo;
@property(nonatomic)BOOL isCardInfo;
@property(nonatomic)BOOL isSet3ignPwd;
@property(nonatomic)BOOL isSignInScreen;
@property(nonatomic)BOOL isCardInfoScreen;
@property(nonatomic)BOOL isUserInfoScreen;
@property (strong, nonatomic) IBOutlet UIImageView *signInBlueImage;


- (IBAction)addSignInView:(id)sender;
- (IBAction)addSignUpView:(id)sender;
- (IBAction)rememberPassword:(id)sender;
- (IBAction)forgotPassword:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *rememberPwdImage;
- (IBAction)productscanRoughWork:(id)sender;
@property(strong,nonatomic) NSString *isScreenType;
@property(nonatomic) BOOL isFirstTimePatterPassword;
@property (weak, nonatomic) IBOutlet UIImageView *SignInBgimgview;

@property(nonatomic) BOOL isCheck;




@end
