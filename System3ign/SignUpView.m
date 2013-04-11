//
//  SignUpView.m
//  System3ign
//
//  Created by shri@ideazglobal.com on 20/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SignUpView.h"

@implementation SignUpView

@synthesize accountpass1;
@synthesize accountpass2;
@synthesize conformaccpass1;
@synthesize confromaccpass2;
@synthesize emaillabel;
@synthesize conformemaillabel1;
@synthesize conformemaillabel2;
@synthesize shppinglab1;
@synthesize shippinglab2;
@synthesize cvcNeedTextview;
@synthesize cvcGrayback;
@synthesize cvcNeedcvclabel;
@synthesize cvcFindcvcLabel;
@synthesize cvcFindCvclabel;
@synthesize cvcBlueBck;
@synthesize userinfoscreenimageoutlet;
@synthesize signupcreditcardbluebackgroundoutlet;
@synthesize signupCreditCardTypelabel;
@synthesize signUpCreditCardGrayback;
@synthesize signupCreditCardWhitelineimage;
@synthesize signupCreditcerdTitlelabel;
@synthesize signupWhiteBackgorund;
@synthesize signUpUnderuserinfoimage;
@synthesize confirmPasswordText;
@synthesize passwordText;
@synthesize mailIDText;
@synthesize confirmMailIDText;
@synthesize usernameText;
@synthesize shippingAddressText;
@synthesize signupDralBlueBackground;
@synthesize firstViewSubmit;
@synthesize firstViewSkip;
@synthesize firstViewScroller;
@synthesize signupcrediscrollview;
@synthesize aboutCVC;
@synthesize closeButtonForView1;
@synthesize creditCardTypeText;
@synthesize cardTypeButton;
@synthesize closeCVC;
@synthesize imageSlideView;
@synthesize nextButton;
@synthesize whitrlineimage;
@synthesize closeButtonForView2;
@synthesize backButtonForView2;
@synthesize push2ScanQRCode;
@synthesize cardHolderName;
@synthesize cardNumber;
@synthesize expirydate;
@synthesize cvcText;
@synthesize signuptitlelabel;
@synthesize titleNoFlow;
@synthesize cvcsignuptitlelabel;
@synthesize cvcNoflow;
@synthesize usernamelabel;
@synthesize userInfoSkip;
@synthesize signupuserinfobackgroundimageoutlet;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    
    
    
    if ((self = [super initWithCoder:aDecoder])) {
        
        NSLog(@"init with code");
        
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyBoard)];
        tap.cancelsTouchesInView=NO;
        [self addGestureRecognizer:tap];
        
        
        // [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil];
        // [self addSubview:self.toplevelSubView];
    }
    return self;}


-(void)dismissKeyBoard{
    
    // NSLog(@"miss called");
    [usernameText resignFirstResponder];
    [passwordText resignFirstResponder];
    [mailIDText resignFirstResponder];
    [confirmMailIDText resignFirstResponder];
    [passwordText resignFirstResponder];
    [confirmPasswordText resignFirstResponder];
    [shippingAddressText resignFirstResponder];
    [cardNumber resignFirstResponder];
    [cvcText resignFirstResponder];
    [cardHolderName resignFirstResponder];
    [creditCardTypeText resignFirstResponder];
    [expirydate resignFirstResponder];

    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (IBAction)Creditcardtextaction:(id)sender {
}
@end
