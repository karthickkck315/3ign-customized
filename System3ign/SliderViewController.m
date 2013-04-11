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
@interface SliderViewController ()

@end

@implementation SliderViewController
@synthesize Slider;

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
	// Do any additional setup after loading the view..
   Slider.backgroundColor = [UIColor clearColor];
//    //    UIImageView *imageView = [[UIImageView alloc] init];
//    //    imageView.frame = CGRectMake(0, 0, 100, 100);
    Slider.animationImages = [NSArray arrayWithObjects:
                                                 [UIImage imageNamed:@"3ign logo.png"],
                              [UIImage imageNamed:@"password.jpg"],[UIImage imageNamed:@"slider.png"], nil];
//    
    Slider.animationDuration = 5.00; // time units
   // Slider.animationRepeatCount = 0; //infinite
    [Slider startAnimating];
//   [self.view addSubview:Slider];
    //UIImage *image = [UIImage imageNamed:@"3ign logo.png"];

}

- (void)viewDidUnload
{
    [self setSlider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)signnow:(id)sender {
    DrawPatternLockViewController *lockVC = [[DrawPatternLockViewController alloc] init];
    [lockVC setTarget:self withAction:@selector(lockEntered:)];
    [self presentModalViewController:lockVC animated:YES];
}


- (void)lockEntered:(NSString*)key {
    
    NSLog(@"my key%@",key);
    NSLog(@"key: %@", key);
    if (![key isEqualToString:@""]) {
        if (![key isEqualToString:@"0102030609"]) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"Wrong pattern!"
                                                               delegate:nil
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:@"OK", nil];
            [alertView show];
        }else{
                        
            [self dismissModalViewControllerAnimated:YES];
            //            [self schedule:@selector(push2ScanQRCode)];
            NSLog(@"move tab view");
//           [self rememberPassword:nil];

            
            //Half of the registration values are in savedView1 and the rest will be in signUpView
            //NSlog for your reference
            [SignUpView removeFromSuperview];
            SignUpView = nil;
//            NSLog(@"name.text from singup view 1-->%@", savedView1.usernameText.text);
//            NSLog(@"creditCardType.text from signup view 2-->%@", signUpView.creditCardTypeText.text);
//            
            
            //            UIViewController *mainTab = [[self storyboard] instantiateViewControllerWithIdentifier:@"Test"];
            //            mainTab.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            //            [self presentModalViewController:mainTab
            //                                    animated:YES];
            //            [self rememberPassword:nil];
            
            //            NSLog(@"Test ->%@", mainTab);
            
          NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SignUpView" owner:self options:nil];
            SliderViewController = (SliderViewController*) [subviewArray objectAtIndex:4];
        [SignUpView.push2ScanQRCode addTarget:self action:@selector(push2ScanQRCode) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:signUpView];

            CATransition *applicationLoadViewIn =[CATransition animation];
            [applicationLoadViewIn setDuration:0.5];
            [applicationLoadViewIn setType:kCATransitionReveal];
            [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
            [[signUpView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
        }
    }
}
-(void)push2ScanQRCode{
    UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
    mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:mainNavController
                            animated:YES];
}


@end
