//
//  SignInViewController.m
//  System3ign
//
//  Created by shri@ideazglobal.com on 20/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SignInViewController.h"
#import "SignInView.h"
#import <QuartzCore/QuartzCore.h>
#import "DrawPatternLockViewController.h"
#import "ScannerViewController.h"
#import "SliderViewController.h"
#import "DataController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "TransactionView.h"
#import "SignInViewController.h"
@interface SignInViewController (){
    DrawPatternLockViewController *lockVC;

}

@end

@implementation SignInViewController
@synthesize rememberPwdImage,isScreenType,isFirstTimePatterPassword,isChangeUserInfo;
@synthesize SignInBgimgview;
@synthesize isCheck;
@synthesize siginview;
@synthesize isUserInfo;
@synthesize isCardInfo;
@synthesize isSet3ignPwd;
@synthesize isSignInScreen;
@synthesize isCardInfoScreen;
@synthesize isUserInfoScreen;
@synthesize signInBlueImage;
@synthesize is3ignPassword;

@synthesize isSignIn;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"ScreenType=%@",isScreenType);
    [signUpView.firstViewScroller setScrollEnabled:YES];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyBoard)];
   // UINavigationController *navigationController = [[UINavigationController alloc]init];

    //[self.view addSubview:navigationController.view];
//    UIImage *backgroundImage = [UIImage imageNamed:@"top.png"];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BG.png"]];
//    UINavigationBar *navBar = [[self navigationController] navigationBar];
//    [navBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
      [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_tab.png"] forBarMetrics:UIBarMetricsDefault];
    NSLog(@"sign in did load");
    lockVC = [[DrawPatternLockViewController alloc] init];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults synchronize];
	// Do any additional setup after loading the view.
   // isFirstTimePatterPassword = YES;
    NSLog(@"first sign  up screen");
   //    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"zbar-back.png"]style:UIBackgroundTaskInvalid target:self action:@selector(Back:)];
//        addButton.tintColor = [UIColor colorWithRed:82 green:0 blue:163 alpha:0];//colorWithRed:0.83 green:0.43 blue:0.57 alpha:0.5
//    [[self navigationItem] setLeftBarButtonItem:addButton animated:YES];
    
    [signInView addGestureRecognizer:tap];
}

-(void)dismissKeyBoard{
    
    NSLog(@"dismiss called");
    [signInView.usernametext resignFirstResponder];
    [signInView.passwordTxt resignFirstResponder];
   // [signUpView.usernameText resignFirstResponder];

}
-(void)setUpPicker{
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 280, 320, 180)];
    
    picker.delegate = self;
    
    picker.dataSource = self;
    
    [ picker  setShowsSelectionIndicator:YES];
    
    //    location.inputView = picker;
    
    mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 242, 320, 37)];
    //mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    mypickerToolbar.barStyle = UIBarStyleBlackTranslucent;
    [mypickerToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    //    if (isDate) {
    
    //  }else {
    
    UIBarButtonItem *doneBtn;
    //    if ([pickerType isEqualToString:@"nearbyRange"]) {
    doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClickedForSelectCardType)];
    pickerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 251, 180, 21)];
    pickerNameLabel.backgroundColor = [UIColor clearColor];
    pickerNameLabel.text = @"Select Card Type";
    [pickerNameLabel setTextColor:[UIColor whiteColor]];
    
    [barItems addObject:doneBtn];
    
    [mypickerToolbar setItems:barItems animated:YES];
    [self.view addSubview:picker];
    [self.view addSubview:mypickerToolbar];
    [self.view addSubview:pickerNameLabel];

}

-(void)pickerDoneClickedForSelectCardType{
    NSLog(@"picker done clicked...");
    [picker removeFromSuperview];
    [mypickerToolbar removeFromSuperview];
    [pickerNameLabel removeFromSuperview];
    
    int i = [picker selectedRowInComponent:0];
    NSString *str;
    if (i==0) {
        str = @"Visa";
    }else if(i==1){
        str = @"MasterCard";
    }else if (i==2){
        str = @"Amex";
    }

    signUpView.creditCardTypeText.text = str;
      
}

-(void) viewWillAppear:(BOOL)animated {
    savepassword =[NSUserDefaults standardUserDefaults];


    //---registers the notifications for keyboard---
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(keyboardDidShow:) 
                                                 name:UIKeyboardDidShowNotification 
                                               object:self.view.window]; 
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
}

//---when a TextField view begins editing---
-(void) textFieldDidBeginEditing:(UITextField *)textFieldView {  
    currentTextField = textFieldView;
   
}  
//Here, you save a copy of the Text Field currently being tapped. When the user taps on the "return" key on the keyboard, the textFieldShouldReturn: event will be fired:
-(BOOL) textFieldShouldReturn:(UITextField *)textFieldView{
    [textFieldView resignFirstResponder];
    return NO;
}


//---when a TextField view is done editing---
-(void) textFieldDidEndEditing:(UITextField *) textFieldView {  
    currentTextField = nil;
}

//---when the keyboard appears---
-(void) keyboardDidShow:(NSNotification *) notification {
    if (keyboardIsShown) {
        NSLog(@"Keyboard is already visible. Ignore notification.");
        return;
    }
    
    // Get the size of the keyboard.
    NSDictionary* info = [notification userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    // Save the current location so we can restore
    // when keyboard is dismissed
    offset = signUpView.firstViewScroller.contentOffset;
    offset=signUpView.firstViewScroller.contentOffset;
    // Resize the scroll view to make room for the keyboard
    CGRect viewFrame = signUpView.firstViewScroller.frame;
//    CGRect viewFrame1=signUpView.firstViewScroller.frame;
    viewFrame.size.height -= keyboardSize.height;
//    viewFrame1.size.height -= keyboardSize.height;
    signUpView.firstViewScroller.frame = viewFrame;
//    signUpView.firstViewScroller.frame=viewFrame1;
    CGRect textFieldRect = [currentTextField frame];
    textFieldRect.origin.y += 20;
    [signUpView.firstViewScroller scrollRectToVisible:textFieldRect animated:YES];
    [signUpView.firstViewScroller scrollRectToVisible:textFieldRect animated:YES];
    NSLog(@"ao fim");
    // Keyboard is now visible
    keyboardIsShown = YES;
}

//---when the keyboard disappears---
-(void) keyboardDidHide:(NSNotification *) notification {

    if (!keyboardIsShown) {
        NSLog(@"Keyboard is already hidden. Ignore notification.");
        return;
    }
    
    // Reset the frame scroll view to its original value 0, 0, 267,320
    signUpView.firstViewScroller.frame = CGRectMake(32,110,262,350);
    // Reset the scrollview to previous location
    signUpView.firstViewScroller.contentOffset = offset;
    signUpView.firstViewScroller.contentOffset = offset;
    // Keyboard is no longer visible
    keyboardIsShown = NO;
}

-(void) viewWillDisappear:(BOOL)animated {
    //---removes the notifications for keyboard---
    [[NSNotificationCenter defaultCenter] 
     removeObserver:self 
     name:UIKeyboardWillShowNotification 
     object:nil];
    [[NSNotificationCenter defaultCenter] 
     removeObserver:self 
     name:UIKeyboardWillHideNotification 
     object:nil];
}
-(void)viewDidUnload
{
    [self setRememberPwdImage:nil];
    [self setSignInBgimgview:nil];
    [self setIsCardInfo:NO];
    [self setIsCardInfoScreen:NO];
    [self setIsChangeUserInfo:NO];
    [self setIsSignInScreen:NO];
    [self setIsUserInfo:NO];
    [self setSignInBlueImage:nil];
    [super viewDidUnload];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (IBAction)addSignInView:(id)sender {
    
    NSLog(@"sign in clicked");
    [signInBlueImage setHidden:YES];
//    SignInBgimgview.frame=CGRectMake(0,5,325,350);
//    SignInBgimgview.image=[UIImage imageNamed:@"Gray.png"];
    
        NSLog(@"test..");
    
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SignInView" owner:self options:nil];
    NSLog(@"test...2");
    signInView = (SignInView*) [subviewArray objectAtIndex:0];
    
  //  NSLog(@"subview array -->%@", subviewArray);
    [signInView setBackgroundColor:[UIColor clearColor]];
    isCheck =YES;
    [signInView.check setImage:[UIImage imageNamed:@"checkbox_ticked.png"] forState:UIControlStateNormal];

    signInView.usernametext.text = [savepassword valueForKey:@"userName"];
    signInView.passwordTxt.text = [savepassword valueForKey:@"userPassword"];
    [signInView.signInButton addTarget:self action:@selector(signInUser) forControlEvents:UIControlEventTouchUpInside];
    [signInView.closeButton addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];
    [signInView.forgotpassword addTarget:self action:@selector(forgotPasswordclick) forControlEvents:UIControlEventTouchUpInside];
     [signInView.check addTarget:self action:@selector(checkbox) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signInView];
    
    CATransition *applicationLoadViewIn =[CATransition animation];
    [applicationLoadViewIn setDuration:0.5];
    [applicationLoadViewIn setType:kCATransitionReveal];
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [[signInView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
   
        
}
-(void)checkbox{
    NSLog(@"checkbox");
    savepassword = [NSUserDefaults standardUserDefaults];
    if (isCheck == NO) {
        isCheck =YES;
        [signInView.check setImage:[UIImage imageNamed:@"checkbox_ticked.png"] forState:UIControlStateNormal];
    if ([signInView.usernametext.text length]!=0) {
            NSLog(@"Text field value not 0");
        [savepassword setObject:signInView.usernametext.text forKey:@"userName"];
        NSLog(@"username=%@",[savepassword valueForKey:@"userName"]);
        [savepassword setObject:signInView.passwordTxt.text forKey:@"userPassword"];
        [savepassword synchronize];
        }
    else if ([signInView.usernametext.text length] ==0) {
        NSLog(@"Textfield value=0");
        signInView.usernametext.text = [savepassword valueForKey:@"userName"];
        signInView.passwordTxt.text = [savepassword valueForKey:@"userPassword"];
        NSLog(@"user name text=%@",signInView.usernametext.text);
        }
    }else if(isCheck == YES){
       isCheck = NO;
       [signInView.check setImage:[UIImage imageNamed:@"checkbox_not_ticked.png"] forState:UIControlStateNormal];
        signInView.usernametext.text =@"";
        signInView.passwordTxt.text = @"";

    }
}
-(void)forgotPasswordclick{
    if (signInView.usernametext.text.length!=0) {
        //url here
    
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Forgot Password" message:@"Password sent to your registered Email ID" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    }else {
        UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Forgot Password" message:@"Please enter your Username." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert1 show];
    }
    NSLog(@"forgot clicked");
}

-(void)signInUser{
    NSLog(@"sign in user called");
    
    if (signInView.usernametext.text.length!=0 && signInView.passwordTxt.text.length!=0 ) {
        
        isSignInScreen=YES;
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"AppURL" ofType:@"plist"];
        NSDictionary *urlDictionary=[[NSDictionary alloc]initWithContentsOfFile:path];
        
        NSLog(@"dic-->%@",urlDictionary);
        NSString *urlStr=[urlDictionary valueForKey:@"SignInURL"];
        NSURL *url=[NSURL URLWithString:urlStr];
        
       ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
      [request setRequestMethod:@"POST"];
      [request addRequestHeader:@"Content_type" value:@"text/xml; charset=utf-8"];

        
       [request setPostValue:signInView.usernametext.text forKey:@"username"];
       [request setPostValue:signInView.passwordTxt.text forKey:@"userpassword"];
             
        
        [request setDelegate:self];
       [request startAsynchronous];
        
        NSLog(@"request post data -->%@",request.postBody);
        
        isSignInScreen=YES;
        
        NSString* newStr =[[NSString alloc] initWithData:request.postBody
                                                encoding:NSUTF8StringEncoding];
        
        
        NSLog(@"request body-->%@",newStr); 
        
      
               
//   ScannerViewController *scvc =  [self.storyboard instantiateViewControllerWithIdentifier:@"MainNavController"];
//  [self.navigationController presentModalViewController:scvc animated:YES];
        
        
        NSLog(@"CHECK ME HERE");
// [self.navigationController pushViewController:scvc animated:YES];
    }else{
        UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"SignIn" message:@"Please enter Username and Password" delegate:nil cancelButtonTitle:@"OK!" otherButtonTitles: nil];
        [alert1 show];
    }
    NSLog(@"Sign in touched..");
    
    
}

-(void)removeView{
    NSLog(@"close button touched.,");
    [signInBlueImage setHidden:NO];
    SignInBgimgview.frame=CGRectMake(0,0,320,460);
    SignInBgimgview.image=[UIImage imageNamed:@"bg_dotted.png"];
    [signInView removeFromSuperview];
    signInView = nil;
}

- (IBAction)addSignUpView:(id)sender {
    NSLog(@"sign up view clicked");
    
    [self.signInBlueImage setHidden:YES];
    SignInBgimgview.frame=CGRectMake(0,0,320,460);
    SignInBgimgview.image=[UIImage imageNamed:@"Whitebackground.png"];
    

    NSLog(@"sign up button clicked in first screen");
    
//        NSLog(@"subviews count  (before add) -->%i", [[self.view subviews] count]);
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SignUpView" owner:self options:nil];
    
    signUpView = (SignUpView*) [subviewArray objectAtIndex:0];
//    NSLog(@"subview array -->%@", subviewArray);
    [signUpView setBackgroundColor:[UIColor clearColor]];
   
    [signUpView.closeButtonForView1 addTarget:self action:@selector(removeSignUpView_1) forControlEvents:UIControlEventTouchUpInside];
//    [signUpView.firstViewSkip addTarget:self action:@selector(signUpSkip) forControlEvents:UIControlEventTouchUpInside];
  
//    signUpView.firstViewScroller.frame = CGRectMake(30, 67, 262, 290);
//    [signUpView.firstViewScroller setContentSize:CGSizeMake(262, 320)];
    signUpView.firstViewScroller.frame = CGRectMake(32,110,262,350);//(40,67,250,330);
    [signUpView.firstViewScroller setContentSize:CGSizeMake(262,320)];
        
    //    signUpView.creditCardTypeText.inputView = picker;
//    [signUpView.cardTypeButton addTarget:self action:@selector(showPicker) forControlEvents:UIControlEventTouchUpInside];
    [signUpView.nextButton addTarget:self action:@selector(pushNextForm) forControlEvents:UIControlEventTouchUpInside];
    
    [signUpView.userInfoSkip addTarget:self action:@selector(pushToCreditCardInfoScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signUpView];
    
    CATransition *applicationLoadViewIn =[CATransition animation];
    [applicationLoadViewIn setDuration:0.5];
    [applicationLoadViewIn setType:kCATransitionReveal];
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [[signUpView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
//        NSLog(@"subviews count  (after add) -->%i", [[self.view subviews] count]);
}



/*- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
    //	return 0;
    return [emailTest evaluateWithObject:candidate];
}

-(IBAction)btnTapped:(id)sender{
    
	if([self validateEmail:[txtEmail text]] ==1)
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"You Enter Correct Email id." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
        
	}
	else{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"You Enter Incoorect Email id." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
	}	
}*/





- (BOOL) validateEmail: (NSString *) candidate {
    NSLog(@"candidate %@",candidate);
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
    //	return 0;
    
    NSLog(@"result %d",[emailTest evaluateWithObject:candidate]);
    return [emailTest evaluateWithObject:candidate];
}




-(void)pushNextForm{
    
  /*  if ([signUpView.usernameText.text length] <= 0 || signUpView.usernameText.text== nil || [signUpView.usernameText.text isEqual:@""]  == TRUE)
    {
        NSLog(@"name txt empty");
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter user name" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];

    
    } */
        
    
    
    
    
    
    
    
 //   --------------****chk here*****--------------------
    
    if ([signUpView.usernameText.text length]!=0&&[signUpView.confirmMailIDText.text length]!=0&&[signUpView.confirmPasswordText.text length]!=0&&[signUpView.shippingAddressText.text length]!=0&&[signUpView.mailIDText.text length]!=0&&[signUpView.passwordText.text length]!=0) {
        
         //Email Id Validation 
        
        isUserInfoScreen=YES;
        
        NSLog(@"test all field");
        
        if([self validateEmail:[signUpView.mailIDText text]] ==0){
            NSLog(@"Email Id Validation");
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please Enter valid Email id." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            
            
        }else if([signUpView.mailIDText.text isEqualToString:signUpView.confirmMailIDText.text]==NO){    
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Mail id mismatch." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            
            NSLog(@"mail id mis match");
            [alert show];
            
            
        }else if([signUpView.passwordText.text length]<5 ){    
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Password must contain minimum 5 letters." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            
            
        }else if([signUpView.passwordText.text isEqualToString:signUpView.confirmPasswordText.text]==NO){    
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Password Mis match." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            
            
        }else {
            
         
                    NSLog(@"registration success");
        
        
                NSString *path=[[NSBundle mainBundle]pathForResource:@"AppURL" ofType:@"plist"];
        
                NSDictionary *urlDictionary=[[NSDictionary alloc]initWithContentsOfFile:path];
        
      
        
                   
                //Fetching url from Property list
                NSString *urlString=[urlDictionary valueForKey:@"RegistrationURL"];
                NSURL*   url = [NSURL URLWithString:urlString];
                NSLog(@"user info url-->%@",url);
        
                ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
                [request setRequestMethod:@"POST"];
                [request addRequestHeader:@"Content_type" value:@"text/xml; charset=utf-8"];
        
                [request setPostValue:signUpView.usernameText.text forKey:@"username"];
                [request setPostValue:signUpView.confirmPasswordText.text forKey:@"userpassword"];
                [request setPostValue:signUpView.confirmMailIDText.text forKey:@"email"];
                [request setPostValue:signUpView.shippingAddressText.text forKey:@"shippingaddress"];
            
                [request setDelegate:self];
                [request startAsynchronous];
            
                NSLog(@"request post data -->%@",request.postBody);
            
                NSString* newStr =[[NSString alloc] initWithData:request.postBody
                                                    encoding:NSUTF8StringEncoding];
            
            
                NSLog(@"request body-->%@",newStr);
            
                NSLog(@"user registration finished");  

      //  [self pushToCreditCardInfoScreen];
        
            NSLog(@"end of push to next form");
        }//end of post method else part
   }else{
    
       UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Please fill in all the fields" message:@"" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    
   }
    
    
    
    
}

-(void)pushToCreditCardInfoScreen{
       NSLog(@"credit card info");
        NSLog(@"isuserinfo screen %d",isUserInfoScreen?YES:NO);
//        NSLog(@"subviews count (before push) -->%i", [[self.view subviews] count]);
    savedView1 = signUpView;
    [self.signInBlueImage setHidden:YES];
//    NSLog(@"name.text 1-->%@", savedView1.usernameText.text);
    [signUpView removeFromSuperview];
    signUpView = nil;
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SignUpView" owner:self options:nil];
    signUpView = (SignUpView*) [subviewArray objectAtIndex:3];
    [signUpView setBackgroundColor:[UIColor clearColor]];
    
    NSLog(@"before ,assigning action to first view  submit");
    
    [signUpView.firstViewSubmit addTarget:self action:@selector(submitSignUpInfo) forControlEvents:UIControlEventTouchUpInside];
    [signUpView.aboutCVC addTarget:self action:@selector(showCVC) forControlEvents:UIControlEventTouchUpInside];
    signUpView.firstViewScroller.frame = CGRectMake(32,110,262,350);
  
   
    [signUpView.firstViewScroller setContentSize:CGSizeMake(262,320)];
    signUpView.creditCardTypeText.inputView = picker;
    signUpView.creditCardTypeText.inputAccessoryView = picker;
   
    //Check if savedView2 values are not null and assign values to text
    if (savedView2.creditCardTypeText.text) {
        signUpView.creditCardTypeText.text = savedView2.creditCardTypeText.text;
    }
    [signUpView.cardTypeButton addTarget:self action:@selector(showPicker) forControlEvents:UIControlEventTouchUpInside];
    [signUpView.nextButton addTarget:self action:@selector(pushNextForm) forControlEvents:UIControlEventTouchUpInside];
    [signUpView.closeButtonForView2 addTarget:self action:@selector(removeSignUpView_2) forControlEvents:UIControlEventTouchUpInside];
    [signUpView.backButtonForView2 addTarget:self action:@selector(pushBackToView1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signUpView];
   // [signUpView.firstViewSkip addTarget:self action:@selector(signUpSkip) forControlEvents:UIControlEventTouchUpInside];
    CATransition *applicationLoadViewIn =[CATransition animation];
    [applicationLoadViewIn setDuration:0.5];
    [applicationLoadViewIn setType:kCATransitionReveal];
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[signUpView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
    
//    NSLog(@"name.text 3 saved-->%@", savedView1.usernameText.text);
//    NSLog(@"name.text 3 signup-->%@", signUpView.usernameText.text);
//    NSLog(@"subviews count (after push) -->%i", [[self.view subviews] count]);
}

-(void)pushBackToView1{
//        NSLog(@"subviews count  (before push back)-->%i", [[self.view subviews] count]);
    savedView2 = signUpView;
    [signUpView removeFromSuperview];
    signUpView = nil;
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SignUpView" owner:self options:nil];
    signUpView = (SignUpView*) [subviewArray objectAtIndex:0];
    //    NSLog(@"subview array -->%@", subviewArray);
    [signUpView setBackgroundColor:[UIColor clearColor]];
    
    [signUpView.closeButtonForView1 addTarget:self action:@selector(removeSignUpView_1) forControlEvents:UIControlEventTouchUpInside];
    [signUpView.firstViewSkip addTarget:self action:@selector(signUpSkip) forControlEvents:UIControlEventTouchUpInside];
    signUpView.usernameText.text = savedView1.usernameText.text;
    signUpView.firstViewScroller.frame = CGRectMake(32, 67, 262, 290);
    [signUpView.firstViewScroller setContentSize:CGSizeMake(262, 280)];
//    signUpView.creditCardTypeText.inputView = picker;
    
//    [signUpView.cardTypeButton addTarget:self action:@selector(showPicker) forControlEvents:UIControlEventTouchUpInside];
    [signUpView.nextButton addTarget:self action:@selector(pushNextForm) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signUpView];
    
    CATransition *applicationLoadViewIn =[CATransition animation];
    [applicationLoadViewIn setDuration:0.5];
    [applicationLoadViewIn setType:kCATransitionReveal];
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[signUpView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
//        NSLog(@"subviews count (after push back) -->%i", [[self.view subviews] count]);
}

-(void)removeSignUpView_2{
    [self.signInBlueImage setHidden:NO];
    SignInBgimgview.frame=CGRectMake(0,0,320,460);
    SignInBgimgview.image=[UIImage imageNamed:@"bg_dotted.png"];
    
    NSLog(@"removing view 2..");
    [signUpView removeFromSuperview];
    signUpView = nil;
//    NSLog(@"subviews count (remove view 2) -->%i", [[self.view subviews] count]);
}

-(void)showCVC{
        [self.signInBlueImage setHidden:YES];
    NSLog(@"show cvc called..");
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SignUpView" owner:self options:nil];
    
    cvcView = (SignUpView*) [subviewArray objectAtIndex:1];
    [cvcView setBackgroundColor:[UIColor grayColor]];
    [cvcView setFrame:CGRectMake(0, 50,325 ,352)];
    [cvcView.closeCVC addTarget:self action:@selector(removeCVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cvcView];
    
    CATransition *applicationLoadViewIn =[CATransition animation];
    [applicationLoadViewIn setDuration:0.5];
    [applicationLoadViewIn setType:kCATransitionReveal];
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[cvcView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
    
}

-(void)removeCVC{
    [self.signInBlueImage setHidden:NO];
    NSLog(@"remove cvc touched..");
    [cvcView removeFromSuperview];
    cvcView = nil;
    
}

-(void)showPicker{
    
  //  SignInViewController *signInvc=[[SignInViewController alloc]init];
        
        [self setUpPicker];
}

-(void)submitSignUpInfo{
    
    
//    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
//    [dic setObject:signUpView.creditCardTypeText.text forKey:@"cctype"];
//    [dic setObject:signUpView.confirmMailIDText.text forKey:@"ccname"];
//    [dic setObject:signUpView.confirmPasswordText.text forKey:@"ccnum"];
//    [dic setObject:signUpView.shippingAddressText.text forKey:@"ccdate"];
//     [dic setObject:signUpView.shippingAddressText.text forKey:@"cccvc"];
//    NSLog(@"dic%@",dic);
//    NSLog(@"dic%@",[dic description]);
//    [self registeringUserDetails:dic];
    
    
    NSLog(@"cvc screen");
    
   
    
    
    
    if ([signUpView.creditCardTypeText.text length]!=0&&[signUpView.cardHolderName.text length]!=0&&[signUpView.cardNumber.text length]!=0&&[signUpView.cvcText.text length]!=0) {
        
        
        isCardInfoScreen=YES;
        
        
        
        
        NSLog(@"card info text fields filled");
        
       //-----------------credit info validation----------------
        
        
        NSString *path=[[NSBundle mainBundle]pathForResource:@"AppURL" ofType:@"plist"];
        
        NSDictionary *urlDictionary=[[NSDictionary alloc]initWithContentsOfFile:path];
        
        
        
        
        //Fetching url from Property list
        NSString *urlString=[urlDictionary valueForKey:@"CardInfoRegistration"];
        //urlString=[urlString stringByReplacingOccurrencesOfString:@"user" withString:@"info"];
        NSURL*   url = [NSURL URLWithString:urlString];
        NSLog(@"user info url-->%@",url);
        
        ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
        [request setRequestMethod:@"POST"];
        [request addRequestHeader:@"Content_type" value:@"text/xml; charset=utf-8"];
        
        [request setPostValue:signUpView.creditCardTypeText.text forKey:@"cctype"];
        [request setPostValue:signUpView.cardHolderName.text forKey:@"ccname"];
        [request setPostValue:signUpView.cardNumber.text forKey:@"ccnum"];
        [request setPostValue:signUpView.expirydate.text forKey:@"ccdate"];
        [request setPostValue:signUpView.cvcText.text forKey:@"cccvc"];
        
        [request setDelegate:self];
        [request startAsynchronous];
        
        NSLog(@"request post data -->%@",request.postBody);
        
        NSString* newStr =[[NSString alloc] initWithData:request.postBody
                                                encoding:NSUTF8StringEncoding];
        
        
        NSLog(@"request body-->%@",newStr);
        
        NSLog(@"card details registration finished");  

        
       
    /*    //  [lockVC setIsScreenType:@"signup"];
            isFirstTimePatterPassword=YES;
            [lockVC setTarget:self withAction:@selector(lockEntered:)];
            label =[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 320, 35)];
            label.text = @"Enter Your Password";
        
            label.textColor = [UIColor blackColor];
            [label setBackgroundColor:[UIColor clearColor]];
            [lockVC.view addSubview:label];
            label.font = [UIFont systemFontOfSize:16.0f];
            label.textAlignment = UITextAlignmentCenter;
            [self presentModalViewController:lockVC animated:YES];*/
                      
 
        
    }else{
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Please fill in all the fields" message:@"" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        
    }
    
    
       
    NSLog(@"sign up submit touched..");
    
}

- (void)lockEntered:(NSString*)key {
    NSLog(@"test entered..");

    
    
    NSLog(@"is 1'st time password %d",isFirstTimePatterPassword?YES:NO);
    
     NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    //if ([isScreenType isEqualToString:@"signup"]) {
        if(isFirstTimePatterPassword) {
            
           
            [defaults setObject:key forKey:@"oldPassword"];
            NSLog(@"oldpass = %@",[defaults valueForKey:@"oldPassword"]);
            //                patternPassword=key;
            NSLog(@"key %@",key);
            NSLog(@"is first time:%d",isFirstTimePatterPassword?YES:NO);
            isFirstTimePatterPassword=NO;
           // label.text =@"Reentry continue";
            
        }else if(!isFirstTimePatterPassword){
               //  label.text =@"Please Confirm password";
                if([key isEqualToString:[defaults valueForKey:@"oldPassword"]]){
                //patternPassword =key;
                        NSLog(@"password matched");
                        NSLog(@"signup pattern password=%@",[defaults valueForKey:@"oldPassword"]);
                    
               
                        [self dismissModalViewControllerAnimated:YES];
               // [lockVC dismissModalViewControllerAnimated:YES];
                        NSLog(@"push to nav screen");
                
                    [button sendActionsForControlEvents: UIControlEventTouchUpInside];
                    isSet3ignPwd=YES;
                    
                    
                    NSString *path=[[NSBundle mainBundle]pathForResource:@"AppURL" ofType:@"plist"];
                    NSDictionary *urlDictionary=[[NSDictionary alloc]initWithContentsOfFile:path];
                    
                    NSString *urlString=[urlDictionary valueForKey:@"Set3ignITPassword"];
                    NSURL *url=[NSURL URLWithString:urlString];
                   

                        
                    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
                    [request setRequestMethod:@"POST"];
                    [request addRequestHeader:@"Content_type" value:@"text/xml; charset=utf-8"];
                    
                    
                    //[request setPostValue:signInView.usernametext.text forKey:@"username"];
                    [request setPostValue:[defaults valueForKey:@"oldPassword"] forKey:@"password"];
                    
                    
                    [request setDelegate:self];
                    [request startAsynchronous];
                    
                    NSLog(@"request post data -->%@",request.postBody);
                    
                    NSString* newStr =[[NSString alloc] initWithData:request.postBody
                                                            encoding:NSUTF8StringEncoding];
                    
                    
                    NSLog(@"request body-->%@",newStr); 
                    

                    
                               
                    }else if(![key isEqualToString:[defaults valueForKey:@"oldPassword"]]){
                    label.text =@"Password mismatch";
//                
//                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"Password mismatch,Please Re Enter" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
//                    [alert show];
//                
//                
                
                    }
            
            }
        
   // }
}

-(void)push2ScanQRCode{
            UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
            mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            [self presentModalViewController:mainNavController
                                    animated:YES];
}

-(void)removeSignUpView_1{
      NSLog(@"removing view 1..");
        [self.signInBlueImage setHidden:NO];
    SignInBgimgview.frame=CGRectMake(0,0,320,460);
    SignInBgimgview.image=[UIImage imageNamed:@"bg_dotted.png"];
    
//        NSLog(@"subviews count (remove view 1) -->%i", [[self.view subviews] count]);
    [signUpView removeFromSuperview];
    signUpView = nil;
}

-(void)signUpSkip{
//    NSLog(@"Sign up skip touched.,");
//    lockVC = [[DrawPatternLockViewController alloc] init];
//        
//        [self presentModalViewController:lockVC animated:YES];
    //
    [lockVC setTarget:self withAction:@selector(lockEntered:)];
    
    [self setIsScreenType:@"signup"];
    [self setIsFirstTimePatterPassword:YES];
    
    
    [self presentModalViewController:lockVC animated:YES];
    [lockVC setTarget:self withAction:@selector(lockEntered:)];
    label =[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 320, 35)];
    label.text = @"Enter Your Password";
    
    label.textColor = [UIColor whiteColor];
    [label setBackgroundColor:[UIColor clearColor]];
    [lockVC.view addSubview:label];
    label.font = [UIFont systemFontOfSize:12.0f];
    label.textAlignment = UITextAlignmentCenter;
    //[self presentModalViewController:lockVC animated:YES];

    
    NSLog(@"RETURN to sign up screen");

}

- (IBAction)rememberPassword:(id)sender {
    
    NSLog(@"remember pwd called., views count -->%i", [[self.view subviews] count]);
  
}

- (IBAction)forgotPassword:(id)sender {



}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *str;
    if (row==0) {
        str = @"Visa";
    }else if(row==1){
        str = @"MasterCard";
    }else if (row==2){
        str = @"Amex";
    }
    return str;
}

- (IBAction)productscanRoughWork:(id)sender {
    
    
    UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
    mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:mainNavController
                            animated:YES];
    
}

-(void)registeringUserDetails:(NSMutableDictionary *)dic{
    NSURL *url;
    NSLog(@"user Registration");
    NSString *path=[[NSBundle mainBundle]pathForResource:@"AppURL" ofType:@"plist"];
    NSDictionary *urlDictionary=[[NSDictionary alloc]initWithContentsOfFile:path];
   
    NSLog(@"dic-->%@",dic);

    if ([[dic valueForKey:@"screenType"]isEqualToString:@"userInfo"]) {
        
        //Fetching url from Property list
    NSString *urlString=[urlDictionary valueForKey:@"RegistrationURL"];    
    url = [NSURL URLWithString:urlString];
    NSLog(@"user info url-->%@",urlString);
    
    }
    else if([[dic valueForKey:@"screenType"]isEqualToString:@"cardInfo"]) {
    
        NSString *urlString=[urlDictionary valueForKey:@"RegistrationURL"];
        urlString=[urlString stringByReplacingOccurrencesOfString:@"user.php" withString:@"cc.php"];
        
        url = [NSURL URLWithString:urlString];
    
    }

    
    //send as post method
    
    //assign the field values
    
    //    [dic valueForKey:@"name"];
    
//    NSLog(@"name%@",[dic valueForKey:@"name"]);
//    NSLog(@"pwd%@",[dic valueForKey:@"password"]);
//    NSLog(@"mail%@",[dic valueForKey:@"mail"]);
//    NSLog(@"address%@",[dic valueForKey:@"address"]);
            
    
    
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    [request addRequestHeader:@"Content_type" value:@"text/xml; charset=utf-8"];
    
    if([[dic valueForKey:@"screenType"]isEqualToString:@"userInfo"]) {
    [request setPostValue:[dic valueForKey:@"name"] forKey:@"username"];
    [request setPostValue:[dic valueForKey:@"password"] forKey:@"userpassword"];
    [request setPostValue:[dic valueForKey:@"mail"] forKey:@"email"];
    [request setPostValue:[dic valueForKey:@"address"] forKey:@"shippingaddress"];
    }else if([[dic valueForKey:@"screenType"]isEqualToString:@"cardInfo"]){
    
        
        
    }
    
  
//    [request setPostValue:@"sanu" forKey:@"username"];
//    [request setPostValue:@"12345" forKey:@"userpassword"];
//    [request setPostValue:@"saranyacse30@gmail.com" forKey:@"email"];
//    [request setPostValue:@"cbe" forKey:@"shippingaddress"];
//    
   
    [request setDelegate:self];
    [request startAsynchronous];
    
    NSLog(@"request post data -->%@",request.postBody);
    
    NSString* newStr =[[NSString alloc] initWithData:request.postBody
                                            encoding:NSUTF8StringEncoding];
    
    
    NSLog(@"request body-->%@",newStr);
    
    NSLog(@"user registration finished");
    
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    
    NSError *error = [request error];
    NSLog(@"request failed  --> %@",error.localizedDescription);
    
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    NSLog(@"requestFinished");
    NSLog(@"request.responsecode ==%i", request.responseStatusCode);
    NSString* newStr = [[NSString alloc] initWithData:request.responseData
                                             encoding:NSUTF8StringEncoding];
    NSLog(@"request -->%@", newStr);
    
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithData:request.responseData];
    [xmlparser setDelegate:self];
    BOOL success = [xmlparser parse];
    if(success){
        NSLog(@"No Errors");
        
        NSLog(@"is sign in%d",isSignInScreen?YES:NO);
         NSLog(@"is user info screen%d",isUserInfoScreen?YES:NO);
         NSLog(@"is card info %d",isCardInfoScreen?YES:NO);
        NSLog(@"is pattern lock %d",isSet3ignPwd?YES:NO);
        
           if (isUserInfoScreen) {
               NSLog(@"entered inside ");
            
                    if ([UserNameStr isEqualToString:@"valid"]&&[UserPasswordstr isEqualToString:@"valid"]&&[Emailstr isEqualToString:@"valid"]&&[ShippingAddressstr isEqualToString:@"valid"]) {
            
                        isUserInfoScreen=NO;
                        NSLog(@"check2");
                        [self pushToCreditCardInfoScreen];
                                    
            
            
                    }else if ([UserNameStr isEqualToString:@"taken"]||[Emailstr isEqualToString:@"taken"]) {
                        
                        NSLog(@"chk 1");
                        isUserInfoScreen=NO;
                        if ([UserNameStr isEqualToString:@"taken"]){
                        
                            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"user name already Exist" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                
                       
                            NSLog(@"chk 2");
                        
                            [alert show];
                        
                        
            
            
            //---------------remove this line----------- 
                          //  [self pushToCreditCardInfoScreen];
                        }else if([Emailstr isEqualToString:@"taken"]) {
                            
                            
                            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Mail id already Exist" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                            
                            
                            NSLog(@"chk 2");
                            
                            [alert show];
                            
                            
                            
                            
                            //---------------remove this line----------- 
                           // [self pushToCreditCardInfoScreen];
                            
                            
                            
                        }
                             
                        
                    
                         NSLog(@"chk 3 ");
                    }else if ([UserNameStr isEqualToString:@"invalid"]||[Emailstr isEqualToString:@"invalid"]||[ShippingAddressstr isEqualToString:@"invalid"]||[UserPasswordstr isEqualToString:@"invalid"]) {
                            isUserInfoScreen=NO;
            
                            if ([UserNameStr isEqualToString:@"invalid"]) {
                
                                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"user name invalid" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                
                                [alert show];
                
                
                            }else if ([Emailstr isEqualToString:@"invalid"]) {
                
                    
                                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Mail id already Exists" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                
                    
                
                                [alert show];
                
                            }else if ([ShippingAddressstr isEqualToString:@"invalid"]) {
                    
                    
                                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Invalid Address" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                        
                                [alert show];
                    
                            }else if ([UserPasswordstr isEqualToString:@"invalid"]) {
                    
                    
                                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Invalid password" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                                [alert show];
                    
                            }
            
            
        
                    }//end of else if
               
               //end of sign in screen validation
        } else if (isCardInfoScreen) { 
        
            if ([cardCvcStr isEqualToString:@"valid"]&&[cardExpiryDate isEqualToString:@"valid"]&&[cardNameStr isEqualToString:@"valid"]&&[cardtypeStr isEqualToString:@"valid"]&&[cardNumberStr isEqualToString:@"valid"]) {
            
                NSLog(@"check2");
            
            
            
            //push to pattern lock screen
                
                
                [lockVC setIsScreenType:@"signup"];
                isFirstTimePatterPassword=YES;
                [lockVC setTarget:self withAction:@selector(lockEntered:)];
                label =[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 320, 35)];
                label.text = @"Enter Your Password";
                
                label.textColor = [UIColor blackColor];
                [label setBackgroundColor:[UIColor clearColor]];
                [lockVC.view addSubview:label];
                label.font = [UIFont systemFontOfSize:16.0f];
                label.textAlignment = UITextAlignmentCenter;
                [self presentModalViewController:lockVC animated:YES];
            
                isFirstTimePatterPassword=YES;
                isCardInfoScreen=NO;
            
            
            
            }else if ([cardtypeStr isEqualToString:@"invalid"]||[cardNumberStr isEqualToString:@"invalid"]||[cardNameStr isEqualToString:@"invalid"]||[cardExpiryDate isEqualToString:@"invalid"]||[cardCvcStr isEqualToString:@"invalid"]) {
            
            
                if ([cardtypeStr isEqualToString:@"invalid"]) {
                
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"card type invalid" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                
                    [alert show];
                    
                  // remove this lines  
                    [lockVC setIsScreenType:@"signup"];
                    isFirstTimePatterPassword=YES;
                    [lockVC setTarget:self withAction:@selector(lockEntered:)];
                    label =[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 320, 35)];
                    label.text = @"Enter Your Password";
                    
                    label.textColor = [UIColor whiteColor];
                    [label setBackgroundColor:[UIColor clearColor]];
                    [lockVC.view addSubview:label];
                    label.font = [UIFont systemFontOfSize:16.0f];
                    label.textAlignment = UITextAlignmentCenter;
                    [self presentModalViewController:lockVC animated:YES];
                    
                    isFirstTimePatterPassword=YES;
                    isCardInfoScreen=NO;

                    
                    
                
                
                }else if ([cardNumberStr isEqualToString:@"invalid"]) {
                    
                
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please check credit card number" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                
                
                
                    [alert show];
                
                }else if ([cardNameStr isEqualToString:@"invalid"]) {
                
                
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Card Name Invalid" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                
                    [alert show];
                
                }else if ([cardExpiryDate isEqualToString:@"invalid"]) {
                
                
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please check expiry date" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                    [alert show];
                
                }else if ([cardCvcStr isEqualToString:@"invalid"]) {
                    
                    
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please check cvc" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                    [alert show];
                    
                }
            
            
            
        }//end of else if
        
      //end of card info screen validation  
        }
        else if (isSet3ignPwd) {
          
            if([passwordValidation isEqualToString:@"valid"]){
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"Thanks For Registered" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            [alert show];
                
                
                
                
            }else if ([passwordValidation isEqualToString:@"invalid"]) {
                
                isFirstTimePatterPassword=YES;
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"invalid Password,try again" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
                [defaults removeObjectForKey:@"oldPassword"];
                
                [alert show];
                
               

                
                               
            }
        }
        else if (isSignInScreen) {
        
            if ([signInPwd isEqualToString:@"invalid"]) {
//release this command
                
//            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"3ign" message:@"Invalid Mail id and password" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//            [alert show];
                
                //----------Remove this line---------
                
                ScannerViewController *scvc =  [self.storyboard instantiateViewControllerWithIdentifier:@"MainNavController"];
                [self presentModalViewController:scvc animated:YES];
                
                
            
        }else if ([signInPwd isEqualToString:@"valid"]) {
            ScannerViewController *scvc =  [self.storyboard instantiateViewControllerWithIdentifier:@"MainNavController"];
            isSignInScreen=NO;
            
            [self.navigationController presentModalViewController:scvc animated:YES];
            
                    
            
            }
    
        }      
    }else{
        NSLog(@"Error in parsing xml!!!");
    }
    
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    
    
    NSLog(@"<%@>", elementName);
    currentElement=elementName;

    
    if ([elementName isEqualToString:@"userinfo"]) {
                
                isUserInfo=YES;
                
    }else if(isCardInfoScreen){
    
    
        
        if ([elementName isEqualToString:@"ccinfo"]) {
            
            isCardInfo=YES;
            
        }
        
    }else if (isSet3ignPwd) {
            
            
            if ([elementName isEqualToString:@"password"]) {
                
                
                is3ignPassword=YES;
                
            }
            
    }else if(isSignInScreen) 
        
        if ([elementName isEqualToString:@"password"]) {
        
            isSignIn=YES;
        
    }
    
    
    
    
    
    
      
    
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (isUserInfo) {
        
            if ([currentElement isEqualToString:@"username"]) {

                UserNameStr=string;
        
                NSLog(@"isusername%@",UserNameStr);
        
            }else if ([currentElement isEqualToString:@"userpassword"]) {
        
                UserPasswordstr=string;
                NSLog(@"isuserPassword%@",UserPasswordstr);

            }else if ([currentElement isEqualToString:@"email"]) {
                
                Emailstr=string;
                NSLog(@"isemail%@",Emailstr);

        
            }else if ([currentElement isEqualToString:@"shippingaddress"]) {
        
                ShippingAddressstr=string;
                NSLog(@"isaddress%@",ShippingAddressstr);

            }

    }else if (isCardInfo) {
        
            if ([currentElement isEqualToString:@"cctype"]) {
            
                cardtypeStr=string;
            
                NSLog(@"cardType%@",cardtypeStr);
            
            }else if ([currentElement isEqualToString:@"ccname"]) {
            
                cardNameStr=string;
                NSLog(@"cardname%@",cardNameStr);
            
            }else if ([currentElement isEqualToString:@"ccnum"]) {
            
                cardNumberStr=string;
                NSLog(@"cardnum%@",cardNumberStr);
            
            }else if ([currentElement isEqualToString:@"ccdate"]) {
            
                cardExpiryDate=string;
                NSLog(@"expiry date%@",cardExpiryDate);
            
            }else if ([currentElement isEqualToString:@"cccvc"]) {
            
                cardCvcStr=string;
                NSLog(@"cvc%@",cardCvcStr);
            
            }
        
        
        
        
    }else if (is3ignPassword) {
        
        if ([currentElement isEqualToString:@"password"]) {
            
            passwordValidation=string;
            
            NSLog(@"pwd validate %@",passwordValidation);           
        }
        
        
        
    }else if (isSignIn) {
       
        if ([currentElement isEqualToString:@"password"]) {
            
            signInPwd=string;
            
        }
        
        
    }    
    
    
      
    
     NSLog(@"value%@",string);
    currentElement=Nil;
    
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    NSLog(@"</%@>", elementName);
    
    if ([elementName isEqualToString:@"userinfo"]) {
        
            isUserInfo=NO;
            //isSignInScreen=NO;
        
    }if ([elementName isEqualToString:@"ccinfo"]) {
        
        isCardInfo=NO;
        
    }
    if (is3ignPassword) {
    
    if ([elementName isEqualToString:@"password"]) {
        
        is3ignPassword=NO;
        
        } 
    }
    
    if (isSignIn) {
        
        if ([elementName isEqualToString:@"password"]) {
            
            isSignIn=NO;
            
        }
        
        
    }
    
   
    
    
    
        

    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"alertview.title -->%@, %@", alertView.title, [alertView buttonTitleAtIndex:buttonIndex]);
    if ([alertView.title isEqualToString:@"3IGN"] && [[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Okay"] ) {

         //do your actions here, encrypt and send password to server to save

        NSLog(@"checking alert delegeate");

     //   if ([isScreenType isEqualToString:@"signup"]) {

            UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
            mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            [self presentModalViewController:mainNavController
                                    animated:YES];
            
            
                    self.isScreenType=@"";
      //  }else if ([isScreenType isEqualToString:@"3ignIT"]){


           
     //   }

    }
    
    if ([alertView.title isEqualToString:@"3IGN"] && [[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Ok"] ) {
        
        //do your actions here, encrypt and send password to server to save
        
        NSLog(@"checking alert delegeate");
        
        
        
        label.text=@"";
        [lockVC setIsScreenType:@"signup"];
        isFirstTimePatterPassword=YES;
        [lockVC setTarget:self withAction:@selector(lockEntered:)];
        label =[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 320, 35)];
        label.text = @"Enter Your Password";
        
        label.textColor = [UIColor blackColor];
        [label setBackgroundColor:[UIColor clearColor]];
        [lockVC.view addSubview:label];
        label.font = [UIFont systemFontOfSize:16.0f];
        label.textAlignment = UITextAlignmentCenter;
        [self presentModalViewController:lockVC animated:YES];
    
        isFirstTimePatterPassword=YES;
        isCardInfoScreen=NO;
      
               
        
    }

    
    
    
    
}



-(void)applyPadding{
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    currentTextField.leftView = paddingView;
    currentTextField.leftViewMode = UITextFieldViewModeAlways;
//    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
//    passwordText.leftView =paddingView1;
//    passwordText.leftViewMode =UITextFieldViewModeAlways;

    

}


@end
