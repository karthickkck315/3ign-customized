//
//  ACCInfoViewController.m
//  System3ign
//
//  Created by sanu on 27/11/12.
//
//

#import "ACCInfoViewController.h"
#import "DrawPatternLockView.h"
#import "DrawPatternLockViewController.h"
#import "SliderViewController.h"
#import "SignInViewController.h"
@interface ACCInfoViewController ()
{

        
    
}


@end

@implementation ACCInfoViewController
@synthesize logOut;
@synthesize isFirstTimePatterPassword,isPatterOldPassword;



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
 [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"nav_tab.png"]forBarMetrics:UIBarMetricsDefault];    
//    UINavigationBar *navBar = [[self navigationController] navigationBar];
//    UIImage *backgroundImage = [UIImage imageNamed:@"nav_tab.png"];
//    [navBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
//    UIImage *tabBarImage=[[UIImage imageNamed:@"tab.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 430, 320, 460)];
//    UIColor *TabTintColor=[UIColor colorWithRed:50/255.0 green:150.0/255.0 blue:70/255.0 alpha:1.0];
//    
//    [[UITabBar appearance]setBackgroundImage:tabBarImage];
//    [[UITabBar appearance]setSelectedImageTintColor:TabTintColor];
    
    
    
   // UITabBar *tabbar=[[UITabBar alloc]init];
    //[[UITabBar appearance]setBackground:[UIImage imageNamed:@"tab.png"]];
 //   [tabbar setBackgroundImage:[UIImage imageNamed:@"tab.png"]];

    
    
    
//    [[UINavigationBar appearance]setBackButtonBackgroundImage:@"top.png" forState:normal barMetrics:UIBarMetricsDefault];
   
//    [[UINavigationBar appearance ]setBackgroundImage:[UIImage imageNamed:@"top.png"]forBarMetrics:UIBarMetricsDefault];

}

- (void)viewDidUnload
{
    [self setLogOut:nil];
       [super viewDidUnload];
    // Release any retained subviews of the main view.
     //  tabbar insertSubview:<#(UIView *)#> aboveSubview:<#(UIView *)#>
//      UIView *bckgrndView = [[UIView alloc] initWithFrame:CGRectMake(280,0,320,120)];
//    [bckgrndView setBackgroundImage:[UIImage imageNamed:@"tab.png"]];
//    [tabbar.superview insertSubView:bckgrndView belowSubview:tabbar];
//    tabbar.alpha = 0.5;
   // [bckgrndView release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)logOut:(id)sender {
//    UINavigationController *nav =[self.storyboard instantiateViewControllerWithIdentifier:@"SignUPNav"];
    SignInViewController *nav=[self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewController"];
    nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
     [nav setIsScreenType:@"accountinfo"];
    
    [self presentModalViewController:nav animated:YES];

}

- (IBAction)changeTheUserInfo:(id)sender {
//    self.tabBarController.tabBar.hidden=YES;
//    [self.tabBarController.tabBar setBackgroundColor:[UIColor grayColor]];
    [[[[self.tabBarController tabBar]items]objectAtIndex:0] setEnabled:NO];
    [[[[self.tabBarController tabBar]items]objectAtIndex:1]setEnabled:NO];
    [[[[self.tabBarController tabBar]items]objectAtIndex:2]setEnabled:NO];
    
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SignUpView" owner:self options:nil];
    
    signUpView.userInfoSkip.hidden=YES;
    signUpView = (SignUpView*) [subviewArray objectAtIndex:0];
    //    NSLog(@"subview array -->%@", subviewArray);
    [signUpView setBackgroundColor:[UIColor clearColor]];
    
//    
    
    [signUpView.closeButtonForView1 addTarget:self action:@selector(removeSignUpView_1) forControlEvents:UIControlEventTouchUpInside];
    [signUpView.firstViewSkip addTarget:self action:@selector(signUpSkip) forControlEvents:UIControlEventTouchUpInside];
    
    //    signUpView.firstViewScroller.frame = CGRectMake(30, 67, 262, 290);
    //    [signUpView.firstViewScroller setContentSize:CGSizeMake(262, 320)];
   // signUpView.firstViewScroller.frame = CGRectMake(32, 40, 262, 300);    
    
    //SET FRAME FOR SIGNUIP USERINFO SCREEN
    signUpView.signupuserinfobackgroundimageoutlet.frame = CGRectMake(0, 52,325 ,346);
    signUpView.userinfoscreenimageoutlet.frame = CGRectMake(20, 60, 280, 330);
    signUpView.firstViewScroller.frame = CGRectMake(30, 90, 300, 380);
    [signUpView.firstViewScroller setContentSize:CGSizeMake(200,300)];
    [signUpView.signUpUnderuserinfoimage setHidden:YES];
    signUpView.accountpass1.frame=CGRectMake(0,15 ,150,21);
//    signUpView.accountpass2.frame=CGRectMake(0,25 ,150,21);
    signUpView.conformaccpass1.frame=CGRectMake(0,68 ,150,21);
//    signUpView.confromaccpass2.frame=CGRectMake(20,78 ,150,21);
    signUpView.emaillabel.frame=CGRectMake(0,125,150,21);
    signUpView.conformemaillabel1.frame=CGRectMake(0, 171,150,21);
//    signUpView.conformemaillabel2.frame=CGRectMake(20, 181,150,21);
    signUpView.shppinglab1.frame=CGRectMake(0,225,150,21);
//    signUpView.shippinglab2.frame=CGRectMake(20, 235,150,21);
    
    //textview frame
    signUpView.passwordText.frame=CGRectMake(110,10 ,150 ,31 );
    signUpView.confirmPasswordText.frame=CGRectMake(110,66 ,150 ,31 );
    signUpView.mailIDText.frame=CGRectMake(110,116 ,150 ,31 );
    signUpView.confirmMailIDText.frame=CGRectMake(110,167 ,150 ,31 );
    signUpView.shippingAddressText.frame=CGRectMake(110,222 ,150 ,31 );
    //close button frame
    signUpView.closeButtonForView1.frame=CGRectMake(280, 60,20 ,20);
    
       
     signUpView.userInfoSkip.hidden=YES;
    [signUpView.titleNoFlow setHidden:YES];
    //title frame
    signUpView.signuptitlelabel.frame = CGRectMake(30, 53, 320, 44);
    [signUpView.signuptitlelabel setText:@"User Info"];
    //submit button frame
    [signUpView.nextButton setTitle:@"Submit" forState:UIControlStateNormal];
    signUpView.nextButton.frame = CGRectMake(125, 355, 95, 28);
    signUpView.whitrlineimage.frame = CGRectMake(30,87 , 260, 2);
    [signUpView.usernameText setHidden:YES];
    [signUpView.usernamelabel setHidden:YES];
    
//    signUpView.mailIDText .text =@"Test@demo.com";
    
//    signUpView.shippingAddressText.text = @"Address";
    [signUpView.nextButton addTarget:self action:@selector(pushNextForm) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signUpView];
    
    CATransition *applicationLoadViewIn =[CATransition animation];
    [applicationLoadViewIn setDuration:0.5];
    [applicationLoadViewIn setType:kCATransitionReveal];
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [[signUpView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
    //        NSLog(@"subviews count  (after add) -->%i", [[self.view subviews] count]);
    
    
    
    
    
}
-(void)removeSignUpView_1{
    [[[[self.tabBarController tabBar]items]objectAtIndex:0] setEnabled:YES];
    [[[[self.tabBarController tabBar]items]objectAtIndex:1]setEnabled:YES];
    [[[[self.tabBarController tabBar]items]objectAtIndex:2]setEnabled:YES];

    [signUpView removeFromSuperview];
    signUpView=nil;
}

-(void)signUpSkip{
    NSLog(@"Sign up skip touched.,");
    
}


- (IBAction)changeThePassword:(id)sender {
    
   
        lockVC = [[DrawPatternLockViewController alloc] init];
    [lockVC setIsScreenType:@"accountinfo"];
    
    [self setIsPatterOldPassword:YES];
    
    [self presentModalViewController:lockVC animated:YES];
        
   
    
    [self setIsPatterOldPassword:YES];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
      NSLog(@"my pwd  %@",[defaults  valueForKey:@"oldPassword"]);
    
   

      
    [lockVC setTarget:self withAction:@selector(lockEntered:)];
    
    
    //change lable text for password change screen
    label =[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 320, 35)];
     label.text = @"Please enter your current password";
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [label setBackgroundColor:[UIColor clearColor]];
    [lockVC.view addSubview:label];
    label.font = [UIFont systemFontOfSize:12.0f];
    
}

- (IBAction)changeTheCreditCardAddress:(id)sender {
    [[[[self.tabBarController tabBar]items]objectAtIndex:0] setEnabled:NO];
    [[[[self.tabBarController tabBar]items]objectAtIndex:1]setEnabled:NO];
    [[[[self.tabBarController tabBar]items]objectAtIndex:2]setEnabled:NO];

    savedView1 = signUpView;
    NSLog(@"credit card info screen display now");
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SignUpView" owner:self options:nil];
    signUpView = (SignUpView*) [subviewArray objectAtIndex:3];
    [signUpView setBackgroundColor:[UIColor clearColor]];
    signUpView.firstViewScroller.frame = CGRectMake(30, 90, 300, 380);
    [signUpView.firstViewScroller setContentSize:CGSizeMake(200,300)];
   
    [signUpView.firstViewSubmit addTarget:self action:@selector(submitSignUpInfo) forControlEvents:UIControlEventTouchUpInside];
    [signUpView.aboutCVC addTarget:self action:@selector(showCVC) forControlEvents:UIControlEventTouchUpInside];
//    signUpView.firstViewScroller.frame = CGRectMake(30, 67, 262,430);
//    signUpView.firstViewScroller.frame = CGRectMake(32,67,260,400);
//    [signUpView.firstViewScroller setContentSize:CGSizeMake(262,320)];
     signUpView.signUpCreditCardGrayback .frame =  CGRectMake(0, 52,325 ,346);
    signUpView.signupcreditcardbluebackgroundoutlet.frame = CGRectMake(28, 60, 260, 310);
//    signUpView.signupcrediscrollview.frame = CGRectMake(30, 90, 250, 380);
    signUpView.signupCreditCardWhitelineimage.frame = CGRectMake(35,87 , 245, 2);
    //close button frame
    signUpView.closeButtonForView2.frame=CGRectMake(272, 60,20 ,20);
    signUpView.firstViewSubmit.frame=CGRectMake(120, 315, 95, 28);
//    [signUpView.signupcrediscrollview setContentSize:CGSizeMake(200,300)];
    signUpView.cardTypeButton.frame=CGRectMake(118,6 ,130 ,31 );
    
    signUpView.userInfoSkip.hidden=YES;
    [signUpView.titleNoFlow setHidden:YES];
    //title frame
    [signUpView.signupWhiteBackgorund setHidden:YES];
    [signUpView.signupDralBlueBackground setHidden:YES];
    signUpView.cvcsignuptitlelabel.frame = CGRectMake(40, 52, 320, 45);
    [signUpView.firstViewSkip setHidden:YES];
    [signUpView.cvcNoflow setHidden:YES];
    [signUpView.cvcsignuptitlelabel setText:@"Credit card Info"];
   
    
//    [signUpView.firstViewScroller setContentSize:CGSizeMake(262,430)];
    if (savedView2.creditCardTypeText.text) {
        signUpView.creditCardTypeText.text = savedView2.creditCardTypeText.text;
    }
    [signUpView.cardTypeButton addTarget:self action:@selector(showPicker) forControlEvents:UIControlEventTouchUpInside];
    [signUpView.nextButton addTarget:self action:@selector(pushNextForm) forControlEvents:UIControlEventTouchUpInside];
    [signUpView.closeButtonForView2 addTarget:self action:@selector(removeSignUpView_2) forControlEvents:UIControlEventTouchUpInside];
    [signUpView.backButtonForView2 addTarget:self action:@selector(pushBackToView1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signUpView];
    
    CATransition *applicationLoadViewIn =[CATransition animation];
    [applicationLoadViewIn setDuration:0.5];
    [applicationLoadViewIn setType:kCATransitionReveal];
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[signUpView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
}
-(void)showCVC{
    NSLog(@"show cvc called..");
   
    
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SignUpView" owner:self options:nil];
   
    cvcView = (SignUpView*) [subviewArray objectAtIndex:1];
    [cvcView setBackgroundColor:[UIColor grayColor]];
    [cvcView setFrame:CGRectMake(0, 53,325 ,345)];
    [cvcView.closeCVC addTarget:self action:@selector(removeCVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cvcView];
   
    
    CATransition *applicationLoadViewIn =[CATransition animation];
    [applicationLoadViewIn setDuration:0.5];
    [applicationLoadViewIn setType:kCATransitionReveal];
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[cvcView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
    
}
-(void)removeCVC{
    
    NSLog(@"remove cvc touched..");
    [cvcView removeFromSuperview];
    cvcView = nil;
    
}
-(void)removeSignUpView_2{
    [[[[self.tabBarController tabBar]items]objectAtIndex:0] setEnabled:YES];
    [[[[self.tabBarController tabBar]items]objectAtIndex:1]setEnabled:YES];
    [[[[self.tabBarController tabBar]items]objectAtIndex:2]setEnabled:YES];

    NSLog(@"remove cvc touched..");
    [signUpView removeFromSuperview];
    signUpView = nil;
}

-(void)pushNextForm{
    
    NSLog(@"push next form");
    savedView1 = signUpView;
    [signUpView removeFromSuperview];
    signUpView = nil;
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"3ign" message:@"User Info Updated" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [alert show];
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
    signUpView.firstViewScroller.frame = CGRectMake(30, 50, 240, 400);
    [signUpView.firstViewScroller setContentSize:CGSizeMake(240, 280)];
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
-(void)submitSignUpInfo{
    NSLog(@"acc info screen");
    
    [signUpView removeFromSuperview];
    signUpView = nil;

    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"Card info updated" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
     [alert show];
}

- (void)lockEntered:(NSString*)key
{
       

            NSLog(@"Lock entered..Key%@",key);
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            NSLog(@"old pwd=%@",[defaults  valueForKey:@"oldPassword"]);
//[[NSUserDefaults standardUserDefaults]removeObjectForKey:@"oldPassword"];
                NSLog(@"old pwd=%@",[defaults  valueForKey:@"oldPassword"]);
            NSLog(@"old pwd true");
        if(isPatterOldPassword)
        {
            if([[defaults  valueForKey:@"oldPassword"] isEqualToString:key]){
//            if ([key isEqualToString:@"123"]) {
                
            
             NSLog(@"pwd matchs");
             label.text = @"Enter your new password";
             [self setIsFirstTimePatterPassword:YES];
             [self setIsPatterOldPassword:NO];
            }else
            {
                 label.text = @"Password Mismatch";
               
            }
        }else if(isFirstTimePatterPassword)
        {
            [defaults setObject:key forKey:@"oldPassword"];
            NSLog(@"oldpass = %@",[defaults valueForKey:@"oldPassword"]);
            label.text = @"Confirm password";
           
            NSLog(@"key %@",key);
            NSLog(@"is first time:%d",isFirstTimePatterPassword?YES:NO);
            isFirstTimePatterPassword=NO;
            NSLog(@"is first time:%d",isFirstTimePatterPassword?YES:NO);
            
        }
    
        else if(!isFirstTimePatterPassword)
        {
            
            if([key isEqualToString:[defaults valueForKey:@"oldPassword"]])
            {
                NSLog(@"password matched");
                NSLog(@"signup pattern password=%@",[defaults valueForKey:@"oldPassword"]);
                [self dismissModalViewControllerAnimated:YES];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"3IGN" message:@"Password updated" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
            }else if(![key isEqualToString:[defaults valueForKey:@"oldPassword"]])
            {
                 label.text = @"Password Mismatch";
                
            }
        }
}
-(void)push2ScanQRCode{
    UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
    mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:mainNavController
                            animated:YES];
}
-(void) viewWillAppear:(BOOL)animated {
    
   
    //[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"viewcart.png"] forBarMetrics:UIBarMetricsDefault];
    
    
     [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_tab.png"] forBarMetrics:UIBarMetricsDefault];
    
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
    
    // Resize the scroll view to make room for the keyboard
    CGRect viewFrame = signUpView.firstViewScroller.frame;
    viewFrame.size.height -= keyboardSize.height;
    signUpView.firstViewScroller.frame = viewFrame;
    
    CGRect textFieldRect = [currentTextField frame];
    textFieldRect.origin.y += 40;
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
    
    // Reset the frame scroll view to its original value 0, 0, 267,320    32,67,262,400
    signUpView.firstViewScroller.frame = CGRectMake(30, 90, 300, 400);
    
    // Reset the scrollview to previous location
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
    [pickerNameLabel setTextColor:[UIColor blackColor]];
    
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

-(void)showPicker{

    
    //  SignInViewController *signInvc=[[SignInViewController alloc]init];
    NSLog(@"picker call");
    [self setUpPicker];
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
    
    }else {
        NSLog(@"Error in parsing xml!!!");
 
    }

}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

    



}
@end
