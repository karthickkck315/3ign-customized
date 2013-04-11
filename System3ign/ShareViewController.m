//
//  ShareViewController.m
//  System3ign
//
//  Created by sanu on 30/11/12.
//
//

#import "ShareViewController.h"
#import "ScannerViewController.h"
#import "ProductDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ShareViewController ()

@end

@implementation ShareViewController

@synthesize activie;

@synthesize checkboxfb;
@synthesize checkboxtwit;
@synthesize productObj;
@synthesize ischeck;
@synthesize ischecktwit;
@synthesize istwitshareonly;

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
    
    
    NSLog(@"product --->%@",[productObj description]);
    
    [activie setHidden:YES];
     [popup.closepop addTarget:self action:@selector(removeViewpop) forControlEvents:UIControlEventTouchUpInside];
    
	// Do any additional setup after loading the view.
//    UINavigationBar *navBar = [[self navigationController] navigationBar];
//    UIImage *backgroundImage = [UIImage imageNamed:@"top.png"];
//    [navBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
   
    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"zbar-back.png"]style:UIBarStyleDefault target:self action:@selector(Back:)];
    
   // [[self navigationItem] setLeftBarButtonItem:addButton animated:YES];
    
    
    
       
    

}
-(void)viewWillAppear:(BOOL)animated{
     [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_tab.png"] forBarMetrics:UIBarMetricsDefault];
    
    
   
}

- (void)viewDidUnload
{
    [self setProductObj:Nil];
    [self setCheckboxfb:nil];
    [self setCheckboxtwit:nil];
   
    
    [self setActivie:nil];
        [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)fbShareButtonAction:(id)sender {
    
    
    
    [self loadFacebook];
    
    
   
 }

-(void)postToFB{
    //   NSLog(@"shop url -->%@", shopUrlString);
    
    NSLog(@"In posttofb method");
    
    NSString *titleString=@"hello";
    NSString * detailString=@"hi ,how are you?";
    NSString *shopUrlString =@"www.google.com";
    NSString *imageURLString=@"http://www.freedomwallpaper.com/nature-wallpaper/nature-sunset-behind-images-wallpapers.jpg";
    
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   titleString, @"name",
                                   // @"", @"caption",
//                                detailString, @"description",
                                   shopUrlString, @"link",
                                   imageURLString, @"picture",
                                   //actionLinksStr, @"actions",
                                   nil];
    
    // if (session.isOpen) {     
    
    [FBRequestConnection
     startWithGraphPath:@"me/feed"
     parameters:params
     HTTPMethod:@"POST"
     completionHandler:^(FBRequestConnection *connection,
                         id result,
                         NSError *error) {
         
         NSLog(@"result --->%@",result);
         
         NSString *alertText;
         if (error) {
             NSLog(@"error -->%@", [error description]);
             alertText = @"Posting failed.  Please try later.";
             // SignUpViewController *svc=[[self storyboard]instantiateViewControllerWithIdentifier:@"LoginView"];
             //svc.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
             
             
             [[[UIAlertView alloc] initWithTitle:@"Facebook Share"
                                         message:alertText
                                        delegate:self
                               cancelButtonTitle:@"OK"
                               otherButtonTitles:nil]
              show];
             
             
             
         }else {
             
             alertText = @"Posted successfully on your wall.";
             
             
             
             [[[UIAlertView alloc] initWithTitle:@"Facebook Share"
                                         message:alertText
                                        delegate:self
                               cancelButtonTitle:@"OK"
                               otherButtonTitles:nil]
              show];
         }        
     }];
    
    
    
    // }
}

-(void)loadFacebook{
    // [self testInternetAvailability];
    //    if (isInternetActive) {
    
    
    NSLog(@"loadFacebook");
    
    //   NSArray *permissions = [[NSArray alloc] initWithObjects:
    //                                @"user_likes", 
    //                                @"publish_actions",
    //                                @"read_stream",
    //                                @"user_birthday",
    //                                @"user_interests",
    //                                @"email",
    //                                nil];
    // [indicateAction startAnimating];
    /*    [FBSession openActiveSessionWithPermissions:permissions
     allowLoginUI:YES
     completionHandler:^(FBSession *session,
     FBSessionState state,
     NSError *error) {
     if (session.isOpen) {
     // NSString *alertText;
     NSLog(@"session is open..");
     
     NSLog(@"going to call posttoFB");
     
     [self postToFB];
     // Show the result in an alert
     }else {
     NSLog(@"session is not open..");
     }
     }]; */
    // }
    
    
    
    [self loginViaFB];
    
}

-(NSDictionary*)loginViaFB{
    // The user has initiated a login, so call the openSession method
    // and show the login UX if necessary.
    NSLog(@"m here loginViaFB");
    // [self openSessionWithAllowLoginUI:YES];
    //  [self setIsFbOpen:YES];
    //NSLog(@"is fb open%c",isFbOpen);
    
    
    
    // }else {
    
    // [self setIsFbOpen:NO];
    // }
    // return Nil;
    
    
    
    
    if ([self openSessionWithAllowLoginUI:YES]) {
        
        
    }else {
        
    }
    
    return nil;
    
    
    
    
}

- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI {
    NSArray *permissions = [[NSArray alloc] initWithObjects:
                            @"user_likes",
                            @"publish_actions",
                            @"read_stream",
                            @"user_birthday",
                            @"user_interests",
                            @"email",
                            nil];
    
    return [FBSession openActiveSessionWithPermissions:permissions
                                          allowLoginUI:allowLoginUI
                                     completionHandler:^(FBSession *session,
                                                         FBSessionState state,
                                                         NSError *error) {
                                         
                                         
                                         
                                         if (error) {
                                             NSLog(@"Network error..");
                                         }else {
                                             if (session.isOpen) {
                                                 NSLog(@"session is open..");
                                                 
                                                 
                                                 [self postToFB];
                                                 
                                                 
                                                 /*   FBRequest *me = [FBRequest requestForMe];
                                                  [me startWithCompletionHandler: ^(FBRequestConnection *connection,
                                                  NSDictionary<FBGraphUser> *my,
                                                  NSError *error) {
                                                  
                                                  NSLog(@"complete -->%@", my);
                                                  NSLog(@"user id -->%@", my.id);
                                                  
                                                  }];  */
                                                 
                                                 
                                                 
                                             }else {
                                                 NSLog(@"session is not open..");
                                             }
                                         }
                                     }];
}


- (IBAction)twitterShareAction:(id)sender {
    
 /*   NSString *titleString=@"Smitha has purchased Headphones from 3ign at only $19.99";
  //  titleString=[titleString stringByReplacingOccurrencesOfString:@"price" withString:productObj.price];
    // titleString=[titleString stringByReplacingOccurrencesOfString:@"productName" withString:productObj.productName];
  
  
   // titleString=[titleString stringByReplacingOccurrencesOfString:@"USERNAME" withString:@"Smitha"];
    
    
    NSString *imagePathString=productObj.mainpicURL;
    NSString *msgUrlString=@"";
    
    if ([TWTweetComposeViewController canSendTweet]) {
        // Initialize Tweet Compose View Controller
        TWTweetComposeViewController *vc = [[TWTweetComposeViewController alloc] init];
        
        // Settin The Initial Text
        [vc setInitialText:titleString];
        [vc setWantsFullScreenLayout:YES];
       // [vc set];
       // [vc setValue:productObj.price forKey:@"price"];
        [vc setTitle:@"title"];
        
        if (imagePathString) {
            // imagePathString=dealsObject.de;
            
        }else {
            imagePathString = @"http://blogs.independent.co.uk/wp-content/uploads/2012/08/twitter-logo.png";
        }
        
                NSURL *imageUrl = [NSURL URLWithString:imagePathString];
               NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
            // Adding an Image
                UIImage *image = [UIImage imageWithData:imageData];
        [vc addImage:image];
        
        // Adding a URL
        NSURL *url = [NSURL URLWithString:msgUrlString];
        [vc addURL:url];
        //[vc ad]
        UIImage *img=[[UIImage alloc]init];
        //img=dealsObject.image;
        NSURL *urlImage=[[NSURL alloc]initWithString:imagePathString];
        NSData *data=[[NSData alloc]initWithContentsOfURL:urlImage];
        
        
        img=[UIImage imageWithData:data];
        
        // Setting a Completing Handler
        [vc setCompletionHandler:^(TWTweetComposeViewControllerResult result) {
            [self dismissModalViewControllerAnimated:YES];
        }];
        
        // Display Tweet Compose View Controller Modally
        [self presentViewController:vc animated:YES completion:nil];
        
        
    } else {
        // Show Alert View When The Application Cannot Send Tweets
        NSString *message =@"The application cannot send a tweet at the moment. This is because it cannot reach Twitter or you don't have a Twitter account associated with this device.";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:message delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alertView show];
    } */
    
    

}

- (IBAction)Back:(id)sender {
   UINavigationController *scvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainNavController"];
    [self presentModalViewController:scvc animated:YES];

     }
- (IBAction)checkBoxbuttonfb:(id)sender {
    
    NSLog(@"FB CHECK BOX TOUCHED");
    if (ischeck == NO) {
        ischeck = YES;
        [checkboxfb setImage:[UIImage imageNamed:@"checkbox_ticked.png"] forState:UIControlStateNormal];
    }else{
        ischeck =NO;
        [checkboxfb setImage:[UIImage imageNamed:@"checkbox_not_ticked.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)checkBoxbuttontwit:(id)sender {
    
        
    
    NSLog(@"TWITTER CHECK BOX TOUCHED");
    if (ischecktwit == NO) {
        ischecktwit = YES;
        [checkboxtwit setImage:[UIImage imageNamed:@"checkbox_ticked.png"] forState:UIControlStateNormal];
        [self setIstwitshareonly:YES];
    }else{
        ischecktwit =NO;
        [checkboxtwit setImage:[UIImage imageNamed:@"checkbox_not_ticked.png"] forState:UIControlStateNormal];
    }
    
   
}
-(void)fbShare{
    
    NSLog(@"fb call");
    [popup.activie1 setHidden:NO];
    [popup.activie1 startAnimating];
    [self postToFB];
//        if (!isbothShared)
//        {
//            [popup removeFromSuperview];
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"Shared on facebook successfully" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//        [alert show];
//            [activie stopAnimating];
//            [activie setHidesWhenStopped:YES];
//            
//            }
    
}
-(void)twitterShare{
     
    NSLog(@"two method call");
   // NSString *titleString=@"3ign";
    NSString *imagePathString;
    NSString *msgString=@"Smitha has purchased the HeadPhones from 3ign at $19.99";
   // msgString=[msgString stringByReplacingOccurrencesOfString:@"product" withString:productObj.productName];
//   // msgString=[msgString stringByReplacingOccurrencesOfString:@"price" withString:productObj.price];
    NSLog(@"two method call1");
    if ([TWTweetComposeViewController canSendTweet]) {
        // Initialize Tweet Compose View Controller
        NSLog(@"two method call2");
        TWTweetComposeViewController *vc = [[TWTweetComposeViewController alloc] init];
        NSLog(@"two method call3");
        // Settin The Initial Text
        [vc setInitialText:msgString];
        
        if (imagePathString) {
            NSLog(@"two method call4");
            // imagePathString=dealsObject.de;
             imagePathString = @"http://www.mobu.dk/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/b/e/belkin_pull_tab_verve_black_leather_iphone4_sort_1.jpg";
        }else {
            NSLog(@"two method call5");
            imagePathString = @"http://www.mobu.dk/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/b/e/belkin_pull_tab_verve_black_leather_iphone4_sort_1.jpg";
            NSLog(@"two method call6");
        }
        
        //        NSURL *imageUrl = [NSURL URLWithString:imagePathString];
        //        NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
        //        // Adding an Image
        //        UIImage *image = [UIImage imageWithData:imageData];
        // [vc addImage:[self getImage]];
        
        // Adding a URL
       // NSURL *url = [NSURL URLWithString:msgUrlString];
        //[vc addURL:url];
        //[vc ad]
       // UIImage *img=[[UIImage alloc]init];
        //img=dealsObject.image;
       // NSURL *urlImage=[[NSURL alloc]initWithString:imagePathString];
        //NSData *data=[[NSData alloc]initWithContentsOfURL:urlImage];
        
        NSLog(@"two method call7");
       // img=[UIImage imageWithData:data];
        UIImage *image = [UIImage imageNamed:@"Headphones.png"];
        [vc addImage:image];
        // Setting a Completing Handler
        [vc setCompletionHandler:^(TWTweetComposeViewControllerResult result) {
            [self dismissModalViewControllerAnimated:YES];
        }];
        NSLog(@"two method call8");
        // Display Tweet Compose View Controller Modally
        [self presentViewController:vc animated:YES completion:nil];
        NSLog(@"two method call9");
        
                
        } else {
        // Show Alert View When The Application Cannot Send Tweets
        NSString *message =@"The application cannot send a tweet at the moment. This is because it cannot reach Twitter or you don't have a Twitter account associated with this device.";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:message delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alertView show];
    }
    [activie stopAnimating];
    [activie setHidesWhenStopped:YES];
//    [self movenext];
      NSLog(@"twitter end check2");
}


-(IBAction)sharebutton:(id)sender{
    [activie setHidden:YES];
    
      
    if (ischeck && !ischecktwit) {
        NSLog(@"active call fb");

        [activie setHidden:NO];
         [activie startAnimating];
        NSArray *fbsubview = [[NSBundle mainBundle]loadNibNamed:@"Transaction" owner:self options:nil];
        
        popup = (TransactionView*)[fbsubview objectAtIndex:2];
        [popup.activie1 setHidden:YES];        
        popup.backgroundColor = [UIColor clearColor];
        
        [popup.post addTarget:self action:@selector(fbShareButtonAction:) forControlEvents:UIControlEventTouchDown];
        [popup.closepop addTarget:self action:@selector(removeViewpop) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:popup];
        [activie stopAnimating];
        [activie setHidesWhenStopped:YES];
        NSLog(@"checkboxfb");
    }

        
     if (ischecktwit && !ischeck) {
            NSLog(@"twitter check call");
            [activie setHidden:NO];
            [activie startAnimating];
            myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self
                                                     selector: @selector(twitterShare) userInfo: nil repeats:NO];
        }
    if (ischecktwit && ischeck) {
        NSLog(@"call all method");
        [activie setHidden:NO];
        [activie startAnimating];
        NSArray *fbsubview = [[NSBundle mainBundle]loadNibNamed:@"Transaction" owner:self options:nil];
        
        popup = (TransactionView*)[fbsubview objectAtIndex:2];
        [popup.activie1 setHidden:YES];
        popup.backgroundColor = [UIColor clearColor];
        [self performSelectorOnMainThread:@selector(twitterShare) withObject:nil waitUntilDone:YES];
        [popup.post addTarget:self action:@selector(fbShareButtonAction:) forControlEvents:UIControlEventTouchDown];
        [popup.closepop addTarget:self action:@selector(removeViewpop) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:popup];
        [activie stopAnimating];
        [activie setHidesWhenStopped:YES];

    }
 }
     

-(void)removeViewpop{
    NSLog(@"remove call");
    [popup removeFromSuperview];
    popup = nil;
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"twitter call check");

    
    NSString *title=[alertView buttonTitleAtIndex:buttonIndex];
    if ( [title isEqualToString:@"Ok"]) {
        NSLog(@"is check twitt");
        if (ischecktwit ) {
            [self twitterShare];

        }else{
            UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
            mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            [self presentModalViewController:mainNavController
                                    animated:YES];

        }
    }else if([title isEqualToString:@"OK"]){
        
        [popup removeFromSuperview];
        popup = nil;
        }
}
-(void)movenext{
    NSLog(@"move next call");
    UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
    mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:mainNavController
                            animated:YES];
}
    
@end
