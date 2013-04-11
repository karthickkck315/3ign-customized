//
//  SliderViewController.m
//  System3ign
//
//  Created by sanu on 05/12/12.
//
//

#import "SliderViewController.h"
#import "DrawPatternLockView.h"
#import "DrawPatternLockViewController.h"
#import "ScannerViewController.h"
#import "SignUpView.h"
#import <QuartzCore/QuartzCore.h>
#import "ProductDetailsViewController.h"
#import "Product.h"

@interface SliderViewController ()

@end

@implementation SliderViewController
@synthesize Slider;
@synthesize isScreenType;
@synthesize  productObj,isFirstTimePatterPassword;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    isFirstTimePatterPassword = YES;
    NSLog(@"first time pattern password did load=%d",isFirstTimePatterPassword?YES:NO);
    NSLog(@"screentype did load--->%@",isScreenType);
//{UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
//                                                                   style:UIBarButtonItemStylePlain
//                                                                  target:self
//                                                                  action:@selector(EditTable:)];
//    self.tabBarController.navigationItem.rightBarButtonItem = anotherButton;
    [super viewDidLoad];
	// Do any additional setup after loading the view..
    
//    button = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
//    button.backgroundColor = [UIColor redColor];
//    [button addTarget:self action:@selector(pushMe) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
    
}

//-(void)pushMe{
//    NSLog(@"push me called..");
////    ProductDetailsViewController *pdvc = [[self storyboard] instantiateViewControllerWithIdentifier:@"ProductDetails"];
////    //        pdvc.navigationController.navigationBarHidden=YES;
////    //        [self.navigationController pushViewController:pdvc animated:YES];
////    pdvc.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
////    [self presentModalViewController:pdvc animated:YES];
//    
//    UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
//    mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self presentModalViewController:mainNavController
//                            animated:YES];
//    
//}

-(void)viewWillAppear:(BOOL)animated{
    Slider.backgroundColor = [UIColor clearColor];
    Slider.animationImages = [NSArray arrayWithObjects:
                              [UIImage imageNamed:@"3ign logo.png"],
                              [UIImage imageNamed:@"password.jpg"],[UIImage imageNamed:@"slider.png"], nil];
    
    Slider.animationDuration = 5.00; // time units
    [Slider startAnimating];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];

}
- (void)viewDidUnload
{
    [self setSlider:nil];
    [self setIsScreenType:nil];
    [self setProductObj:Nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)signnow:(id)sender {
//    DrawPatternLockViewController *lockVC = [[DrawPatternLockViewController alloc] init];
//    [lockVC setTarget:self withAction:@selector(lockEntered:)];
//    
//    [self presentModalViewController:lockVC animated:YES];
    
}


- (void)lockEntered:(NSString*)key {
//    NSLog(@"screentype------>%@",isScreenType);
//    NSLog(@"my key%@",key);
//    NSLog(@"key: %@", key);
//    if (![key isEqualToString:@""]) {
//        if (([isScreenType isEqualToString:@"productlist"] && [key isEqualToString:@"12369"]) || [isScreenType isEqualToString:@"detailscreen"])
//        {
//            [self dismissModalViewControllerAnimated:YES];
//            NSLog(@"product popup");
//                        NSArray *subviewarray = [[NSBundle mainBundle]loadNibNamed:@"Transaction" owner:self options:nil];
//            Transactionview = (TransactionView *)[subviewarray objectAtIndex:0];
//            [Transactionview setBackgroundColor:[UIColor clearColor]];
//
//            [self.view addSubview:Transactionview];
//            
//            CATransition *loadsubview = [CATransition animation];
//            [loadsubview setDuration:0.5];
//            [loadsubview setType:kCATransitionReveal];
//            [loadsubview  setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
//
//            [Transactionview.closepopup1 addTarget:self action:@selector(closepopup1) forControlEvents:UIControlEventTouchUpInside];
//            [Transactionview.shipping addTarget:self action:@selector(pushtoshipping) forControlEvents:UIControlEventTouchUpInside];
//            [[Transactionview layer]addAnimation:loadsubview forKey:kCATransitionReveal];
//            
//           
//            
//        }else
//           
//         if(([key isEqualToString:@"12369"] && [isScreenType isEqualToString:@"accountinfo"]) || [isScreenType isEqualToString:@"signup"])
//        {
//           
//            NSLog(@"pattern close");
//            [self dismissModalViewControllerAnimated:YES];
//            NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SignUpView" owner:self options:nil];
//            signUpView = (SignUpView*) [subviewArray objectAtIndex:4];
//            [signUpView setBackgroundColor:[UIColor clearColor]];
//            
//            [signUpView.push2ScanQRCode addTarget:self action:@selector(push2ScanQRCode) forControlEvents:UIControlEventTouchUpInside];
//            [self.view addSubview:signUpView];
//            CATransition *applicationLoadViewIn =[CATransition animation];
//            [applicationLoadViewIn setDuration:0.5];
//            [applicationLoadViewIn setType:kCATransitionReveal];
//            [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
//            [[signUpView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
//
//                       
//        }
//        }
//        else{
//            NSLog(@"wrong pattern call");
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                                message:@"Wrong pattern!"
//                                                               delegate:nil
//                                                      cancelButtonTitle:nil
//                                                      otherButtonTitles:@"OK", nil];
//            [alertView show];
//        }
    
    
    //--------------------------------------------------------------
    
        
/*    if (key && isFirstTimePatterPassword) {
         NSLog(@"key=%@",key);
    
        NSLog(@"key=%@",key);
        patternPassword = key;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"Please confirm password again" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        NSLog(@"key=%@",key);
        [alert show];*/
    
   
        //isFirstTimePatterPassword =NO;
               
  //  }
       //isFirstTimePatterPassword =NO;
    
 /*   if ([key isEqualToString:patternPassword] && !isFirstTimePatterPassword) {
        
        [self dismissModalViewControllerAnimated:YES];*/
//        [button sendActionsForControlEvents: UIControlEventTouchUpInside];
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"Password saved successfully" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
//        [alert show];
//        patternPassword=nil;
       
/*    }else if(!isFirstTimePatterPassword && ![key isEqualToString:patternPassword]){
         NSLog(@"key=%@",key);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"Password Mismatch.  Please try again." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
        patternPassword = nil;
        NSLog(@"pattern key=%@",patternPassword);
        key=nil;
         NSLog(@"key=%@",key);
        isFirstTimePatterPassword = YES;
        
    }
       
     //patternPassword = nil;
    isFirstTimePatterPassword = NO;*/
        //patternPassword = nil;
 //key=nil;
    
          // isFirstTimePatterPassword = YES;
    //key=nil;
    
//        
//    if ([isScreenType isEqualToString:@"signup"]) {
//        NSLog(@"screen type==>%@",isScreenType);
//            if(isFirstTimePatterPassword) {
//                patternPassword=key;
//                NSLog(@"key %@",key);
//                NSLog(@"is first time:%d",isFirstTimePatterPassword?YES:NO);
//                isFirstTimePatterPassword=NO;
//                NSLog(@"is first time:%d",isFirstTimePatterPassword?YES:NO);
//            
//            }else if(!isFirstTimePatterPassword){
//                NSLog(@"is first Time password=%d",isFirstTimePatterPassword?YES:NO);
//                
//                if([key isEqualToString:patternPassword]){
//                
//                    NSLog(@"password match");
//                    
//                    [self dismissModalViewControllerAnimated:YES];
//                    [button sendActionsForControlEvents: UIControlEventTouchUpInside];
//                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"Password saved successfully" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
//                            [alert show];
//           
//                }
//                    
//        
//            
//        
//            }
//        
//        
//        
//        
//        
//        
//    }
//    
//        
//    
//       
//}
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    NSLog(@"alertview.title -->%@, %@", alertView.title, [alertView buttonTitleAtIndex:buttonIndex]);
//    if ([alertView.title isEqualToString:@"3IGN"] && [[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Okay"] ) {
//        
//         //do your actions here, encrypt and send password to server to save
//        
//        NSLog(@"checking alert delegeate");
//        
//        if ([isScreenType isEqualToString:@"signup"]) {
//         
//            UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
//            mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//            [self presentModalViewController:mainNavController
//                                    animated:YES];
//        }else if ([isScreenType isEqualToString:@"3ignIT"]){
//        
//            
//            if ([productObj.inStore isEqualToString:@"false"]) {
//                //navigate to shipping Address confirmation screen
//                
//            }else if ([productObj.inStore isEqualToString:@"true"]){
//                //navigate to instore screen
//        
//            }
//        
//        }
//    
//    }
//}
//    
//-(void)closepopup1{
//    [Transactionview removeFromSuperview];
//   
//    UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
//    mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self presentModalViewController:mainNavController
//                            animated:YES];
//     Transactionview = nil;
//}
//
//-(void)push2ScanQRCode{
//    UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
//    mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self presentModalViewController:mainNavController
//                            animated:YES];
//}
//-(void)pushtoshipping{
//    NSArray *shippopup = [[NSBundle mainBundle] loadNibNamed:@"Transaction" owner:self options:nil];
//    Transactionview = (TransactionView *) [shippopup objectAtIndex:1];
//    [Transactionview setBackgroundColor:[UIColor clearColor] ];
//    [self.view addSubview:Transactionview];
//    CATransition *load = [CATransition animation];
//    [load setDuration:0.5];
//    [load setType:kCATransitionReveal];
//    [load setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
//    [Transactionview.closepopup2 addTarget:self action:@selector(closepopup2) forControlEvents:UIControlEventTouchUpInside];
//    [[Transactionview layer]addAnimation:load forKey:kCATransitionReveal];
//}
//-(void)closepopup2{
//    [Transactionview removeFromSuperview];
//    Transactionview = nil;
//}
//
//
}
@end
