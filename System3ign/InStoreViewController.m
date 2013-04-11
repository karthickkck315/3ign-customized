//
//  InStoreViewController.m
//  System3ign
//
//  Created by sanu on 14/12/12.
//
//

#import "InStoreViewController.h"
#import "ViewCardlistViewController.h"

#import "ShareViewController.h"
#import "SliderViewController.h"
#import "VendorCell.h"
#import "ProductAddToCartViewController.h"
#import "SignInViewController.h"
@interface InStoreViewController ()

@end

@implementation InStoreViewController
@synthesize productObj;
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
    NSLog(@"product=%@",productObj.productName);
	// Do any additional setup after loading the view.
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

- (IBAction)backtoscan:(id)sender {
    UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
    mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:mainNavController
                            animated:YES];
    

}

- (IBAction)share:(id)sender {
    
    ShareViewController *shvc= [self.storyboard instantiateViewControllerWithIdentifier:@"share"];
    [shvc setProductObj:productObj];
    
    [self presentModalViewController:shvc animated:YES];
}
@end
