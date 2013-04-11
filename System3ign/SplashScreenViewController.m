//
//  SplashScreenViewController.m
//  System3ign
//
//  Created by shri@ideazglobal.com on 20/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SplashScreenViewController.h"
#import "SignInViewController.h"

@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	//Do any additional setup after loading the view.
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self
                                             selector: @selector(push2Login) userInfo: nil repeats: YES];
    
}


-(void)push2Login{
    NSLog(@"$ Timer fired $ ..");
  SignInViewController *login = [[self storyboard] instantiateViewControllerWithIdentifier:@"SignInViewController"];
//    login.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //UIModalTransitionStyleFlipHorizontal; 
//    //UIModalTransitionStyleCrossDissolve; //UIModalTransitionStyleCoverVertical;
        [self presentModalViewController:login animated: YES];
    
   // UINavigationController *nav=[[self storyboard]instantiateViewControllerWithIdentifier:@"SignUPNav"];
    //[self.navigationController pushViewController:nav animated:YES];
    
    //[self presentModalViewController:nav animated: YES];

    //[self.navigationController pushViewController:nav animated:YES];
    
//    UINavigationController *signUPNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SignUPNav"];
    
   // [signUPNavController setTitle:[UIImage imageNamed:@"3IGN.png"]];
   // [signUPNavController setTitle:[NSString ][UIImage imageNamed:@"3IGN.png"]];
    
   // [[UINavigationBar appearance]setTintColor:[UIColor ]];
    
    //#332241
        
//    signUPNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self presentModalViewController:signUPNavController
//                            animated:YES];
    
  //  UIBarButtonItem *settingBar=UIBarButtonSystemItemFlexibleSpace
    
    
    [myTimer invalidate];
//    [self setMyTimer:nil];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
