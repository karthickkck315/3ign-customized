//
//  LogOutViewController.m
//  System3ign
//
//  Created by sanu on 30/11/12.
//
//

#import "LogOutViewController.h"
#import "SignInViewController.h"
@interface LogOutViewController ()

@end

@implementation LogOutViewController
@synthesize sliderimage;

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
    self.view.backgroundColor = [UIColor clearColor];
    UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"3IGN" message:@"You have Logout" delegate:self
                                        cancelButtonTitle:@"Yes" otherButtonTitles:@"No",nil];
    [view show];
	// Do any additional setup after loading the view.
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"alertview.title -->%@, %@", alertView.title, [alertView buttonTitleAtIndex:buttonIndex]);
    if ([alertView .title isEqualToString:@"3IGN"] && [[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Yes"] ) {
        
        //do your actions here, encrypt and send password to server to save
        
        NSLog(@"checking alert delegeate");
        
        
        UINavigationController *nav =[self.storyboard instantiateViewControllerWithIdentifier:@"SignUPNav"];
        nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        [self presentModalViewController:nav animated:YES];
                
        
    }else if([alertView.title isEqualToString:@"3IGN"] && [[alertView buttonTitleAtIndex:buttonIndex]isEqualToString:@"No"]){
        UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
      
        [self presentModalViewController:mainNavController
                                animated:NO];
//        [self dismissModalViewControllerAnimated:YES];
    }
        
}

-(void)viewWillAppear:(BOOL)animated{
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"top.png" ] forBarMetrics:UIBarMetricsDefault];
//    sliderimage.backgroundColor = [UIColor clearColor];
//    sliderimage.animationImages = [NSArray arrayWithObjects:
//                              [UIImage imageNamed:@"3ign logo.png"],
//                              [UIImage imageNamed:@"password.jpg"],[UIImage imageNamed:@"slider.png"], nil];
//    
//    sliderimage.animationDuration = 5.00; // time units
//    [sliderimage startAnimating];

}

- (void)viewDidUnload
{
    [self setSliderimage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)Logout:(id)sender {
//    SignInViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewController"];
//    svc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//      //  [self.navigationController presentModalViewController:svc animated:YES];
//    [self.navigationController pushViewController:svc animated:YES];
//    SignInViewController *svc = [[SignInViewController alloc]init]
    
//    svc.siginview =  [NSString stringWithString:@"SignInViewController"];
//    [self.navigationController pushViewController:svc animated:YES];

    }
@end
