//
//  ProductDetailsViewController.m
//  System3ign
//
//  Created by Shri on 25/11/12.
//
//

#import "ProductDetailsViewController.h"
#import "DrawPatternLockViewController.h"
#import "ShareViewController.h"
#import "SliderViewController.h"
#import "VendorCell.h"
#import "ProductAddToCartViewController.h"
#import "SignInViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface ProductDetailsViewController ()
{

  
    ImageSliderViewController *sampleObj;


}

@end

@implementation ProductDetailsViewController
//technical properties
@synthesize MainImage;
@synthesize activeanimate;
@synthesize button1;
@synthesize button2;

@synthesize vendorProductImg;
@synthesize productname;
@synthesize productamount;

@synthesize vendorProductName;
@synthesize vendorProductPrice;
@synthesize vendorProductList,vendorProductObject,isInsert;
//@synthesize productObject,productArray;





//design properties
@synthesize Productvendor;
@synthesize Terms;
@synthesize vendorProductImage;
@synthesize termsTxtView;


@synthesize descriptiontextview;
@synthesize descriptionButton;
@synthesize termsButton;
@synthesize vendorButton;

//listview
//@synthesize index;

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
  
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"top.png"]forBarMetrics:UIBarMetricsDefault];
    isfirstTimeParsing=YES;

    [activeanimate startAnimating];
}
-(void)viewDidAppear:(BOOL)animated
{
      [super viewDidAppear:NO];
    
    
    if (isfirstTimeParsing) {
        
    
    NSLog(@"view did load");
    productObject=[[Product alloc]init];
    vendorProductObject=[[Product alloc]init];
    
      
    NSString *path = [[NSBundle mainBundle]pathForResource:@"AppURL" ofType:@"plist"];
    NSDictionary *urlDictionary=[[NSDictionary alloc]initWithContentsOfFile:path];
    
    NSLog(@"dic-->%@",urlDictionary);
    
  
        
        //Fetching url from Property list
            NSString *urlStr=[urlDictionary valueForKey:@"ProductDetails"];
    DataController *dvc=[[DataController alloc]init];
    
    productObject =[dvc getProductDetails:urlStr];
    
    
    
    NSLog(@"return to detail screen");
    NSLog(@"product %@",productObject.productName);
    NSLog(@"product %@",productObject.productID);
    NSLog(@"product object%@",productObject.price);
    
    
    
    
    
    
    productname.text=productObject.productName;
    productamount.text=productObject.price;
    descriptiontextview.text=productObject.productDescription;
    termsTxtView.text=productObject.tac;
    MainImage.image=[self getImage:productObject.mainpicURL];
    
    
    vendorProductObject=[productObject.sameVendor objectAtIndex:0];
    
    NSLog(@"vendor id%@",vendorProductObject.productID);
    vendorProductName.text=vendorProductObject.productName;
    vendorProductPrice.text=vendorProductObject.price;
    vendorProductImage.image=[self getImage:vendorProductObject.mainpicURL];
    
    [Productvendor setHidden:YES]; 
    

//    [self.navigationController.navigationItem setTitle:@"3ign"];
//     self.navigationController.navigationBarHidden=NO;
    [activeanimate stopAnimating];
        isfirstTimeParsing=NO;
        
    }else if (!isfirstTimeParsing){
    
            //do nothing
    
    }
    
    
    
}




-(UIImage *)getImage:(NSString *)urlString{
    NSURL *url=[NSURL URLWithString:urlString];
    NSData *data=[NSData dataWithContentsOfURL:url];
    UIImage *img=[UIImage imageWithData:data];
    return img;


}

- (void)viewDidUnload
{
    //[self setProductObject:Nil];
    
    
    
    
    
    [self setDescriptionButton:nil];
    [self setTermsButton:nil];
    [self setVendorButton:nil];
    [self setProductvendor:nil];
    [self setTerms:nil];
    
    [self setProductname:nil];
    [self setProductamount:nil];
    [self setDescriptiontextview:nil];
    [self setVendorProductName:nil];
    [self setVendorProductPrice:nil];
    [self setVendorProductImage:nil];
    [self setTermsTxtView:nil];
  
    [self setVendorProductList:nil];
    [self setVendorProductImg:nil];
    [self setActiveanimate:nil];
  
    [self setMainImage:Nil];
    [self setButton1:nil];
    [self setButton2:nil];
   
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (IBAction)productDescriptionAction:(id)sender {
    
    
    
    [self.view bringSubviewToFront:descriptiontextview];
    
    
   // [self.descriptiontextview setFrame:CGRectMake(0,245,320,171)];
   // [self.descriptiontextview setHidden:NO];
    [self.view bringSubviewToFront:button1];
    [self.view bringSubviewToFront:button2];
    descriptiontextview.text=productObject.productDescription;
//    [self.termsView setHidden:YES];
//    [self.vendorView setHidden:YES];
    [self.descriptionButton setImage:[UIImage imageNamed:@"whiteRect.png"] forState:UIControlStateNormal];
    [self.termsButton setImage:[UIImage imageNamed:@"whitelight.png"] forState:UIControlStateNormal];
    [self.vendorButton setImage:[UIImage imageNamed:@"whitelight.png"] forState:UIControlStateNormal];
    [self.Productvendor setHidden:YES];
    [self.Terms setHidden:YES];
}

- (IBAction)termsAction:(id)sender {
    [self.Terms setHidden:NO];
    
    [self.view bringSubviewToFront:Terms];
    // [self.termsView setFrame:CGRectMake(0,0,320,171)];
//    [self.vendorView setHidden:YES];
    [self.view bringSubviewToFront:button1];
    [self.view bringSubviewToFront:button2];
    [self.termsButton setImage:[UIImage imageNamed:@"whiteRect.png"] forState:UIControlStateNormal];
    [self.descriptionButton setImage:[UIImage imageNamed:@"whitelight.png"] forState:UIControlStateNormal];
    [self.vendorButton setImage:[UIImage imageNamed:@"whitelight.png"] forState:UIControlStateNormal];
    [self.Productvendor setHidden:YES];
  //  [self.detail setHidden:YES];

}

- (IBAction)productFromVendorAction:(id)sender {
    [self.Productvendor setHidden:NO];
    [self.view bringSubviewToFront:Productvendor];
    //[self.vendorView setFrame:CGRectMake(0,0,320,171)];
  // [self.termsView setHidden:YES];
//    [self.descriptionView setHidden:YES];
    [self.view bringSubviewToFront:button1];
    [self.view bringSubviewToFront:button2];
    [self.termsButton setImage:[UIImage imageNamed:@"whitelight.png"] forState:UIControlStateNormal];
    [self.descriptionButton setImage:[UIImage imageNamed:@"whitelight.png"] forState:UIControlStateNormal];
    [self.vendorButton setImage:[UIImage imageNamed:@"whiteRect.png"] forState:UIControlStateNormal];
    
    

    
}


- (IBAction)share:(id)sender {
    ShareViewController *shvc= [self.storyboard instantiateViewControllerWithIdentifier:@"share"];
    [shvc setProductObj:productObject];
    
    [self presentModalViewController:shvc animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
   
   // return [productObject.sameVendor count];
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    VendorCell *cell = (VendorCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.selectedBackgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top.png"]];
//    cell.imgView.image=[self getImage:vendorProductObject.mainpicURL];
//    cell.nameLabel.text=vendorProductObject.productName;
//   cell.priceLabel.text=vendorProductObject.price;
    cell.imageView.image = [UIImage imageNamed:@"PHONE.jpeg"];
   
    cell.priceLabel.text =@"$40";
    
    cell.nameLabel.text = @"Windows Mobile";
   
    return cell;
}



#pragma TableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)resignKeyboard:(id)sender {
}
- (IBAction)addToCart:(id)sender {
    ProductAddToCartViewController *addtocartViewCtrl=[[ProductAddToCartViewController alloc]init];
    
    [addtocartViewCtrl setProductObject:productObject];
    [self presentModalViewController:addtocartViewCtrl animated:NO];
    
    NSLog(@"bf insert call");
    
    [addtocartViewCtrl insertProductIntoDB];
    NSLog(@"af insert call");
    
       [self dismissModalViewControllerAnimated:YES];
    NSLog(@"if check");
    if (!isInsert) {
            NSLog(@"if check2");
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Product add to cart." delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    }

}

- (IBAction)ignit:(id)sender {
//    DrawPatternLockViewController *lockVC = [[DrawPatternLockViewController alloc] init];
//    [lockVC setIsScreenType:@"product detail"];
//    [lockVC setTarget:self withAction:@selector(lockEntered:)];
//    
//    [self presentModalViewController:lockVC animated:YES];
//
    DrawPatternLockViewController *lockVC = [[DrawPatternLockViewController alloc] init];
    [lockVC setIsScreenType:@"productdetail"];
    
       
    [lockVC setTarget:self withAction:@selector(lockEntered:)];
    label =[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 320, 35)];
    label.text = @"Enter Your Password";
    
    label.textColor = [UIColor whiteColor];
    [label setBackgroundColor:[UIColor clearColor]];
    [lockVC.view addSubview:label];
    label.font = [UIFont systemFontOfSize:12.0f];
    label.textAlignment = UITextAlignmentCenter;
    [self presentModalViewController:lockVC animated:YES];

//    [self presentModalViewController:lockVC animated:YES];
}


- (void)lockEntered:(NSString*)key {
    
    NSLog(@"test entered..");
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    
    if([key isEqualToString:[defaults  valueForKey:@"oldPassword"]]){
    
        NSLog(@"oldpassword=%@",[defaults  valueForKey:@"oldPassword"]);
        [self dismissModalViewControllerAnimated:YES];
       // [button sendActionsForControlEvents: UIControlEventTouchUpInside];
        label.text=@"Enter your password";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"You are purchasing headphones for $19.99.  Do you want to continue?" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:@"Cancel",nil];
        [alert show];

    
    }else{
    label.text = @"Enter your correct password";
    
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"3ign It" message:@"Please enter correct password" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
//        [alert show];
    }
    
   /* NSLog(@"old pwd  %@",[defaults  valueForKey:@"oldPassword"]);
    
    
    NSLog(@"old pwd true");
    
    
    if(isPatterOldPassword) {
        
        
        if([[defaults  valueForKey:@"oldPassword"] isEqualToString:key]){
            NSLog(@"pwd matchs");
            
            [self setIsFirstTimePatterPassword:YES];
            
            [self setIsPatterOldPassword:NO];
        }
        
        
        
    }else if(isFirstTimePatterPassword) {
        
        
        [defaults setObject:key forKey:@"oldPassword"];
        NSLog(@"oldpass = %@",[defaults valueForKey:@"oldPassword"]);
        //                patternPassword=key;
        NSLog(@"key %@",key);
        NSLog(@"is first time:%d",isFirstTimePatterPassword?YES:NO);
        isFirstTimePatterPassword=NO;
        NSLog(@"is first time:%d",isFirstTimePatterPassword?YES:NO);
        
    }else if(!isFirstTimePatterPassword){
        
        if([key isEqualToString:[defaults valueForKey:@"oldPassword"]]){
            //patternPassword =key;
            NSLog(@"password matched");
            NSLog(@"signup pattern password=%@",[defaults valueForKey:@"oldPassword"]);
            [self dismissModalViewControllerAnimated:YES];
            // [lockVC dismissModalViewControllerAnimated:YES];
            NSLog(@"push to nav screen");
            
            // [button sendActionsForControlEvents: UIControlEventTouchUpInside];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"Password changed successfully" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            [alert show];
        }
        
    }
    
*/

}



- (IBAction)backtocamera:(id)sender {
    UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
    mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:mainNavController
                            animated:YES];
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"alertview.title -->%@, %@", alertView.title, [alertView buttonTitleAtIndex:buttonIndex]);
    if ([alertView.title isEqualToString:@"3IGN"] && [[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Okay"] ) {
        
        //do your actions here, encrypt and send password to server to save
        
        NSLog(@"checking alert delegeate");
        
        
            
        UINavigationController *instore = [[self storyboard]instantiateViewControllerWithIdentifier:@"store"];
        
        [self presentModalViewController:instore animated:YES];
            
        
        
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{


    NSLog(@"touched");
    
    
    UITouch *touch=[[event allTouches]anyObject];
    
    if (CGRectContainsPoint([MainImage frame],[touch locationInView:self.view])) {
        
               
      /*  imgSliderView = [[[NSBundle mainBundle] loadNibNamed:@"ImageSliderView" owner:self options:nil] objectAtIndex:0];
        
        [imgSliderView setBackgroundColor:[UIColor clearColor]];
        
        imgSliderView.imageUrlArray=productObject.pictureURl;
        
        NSLog(@"product url %@",productObject.pictureURl);
        
        imgSliderView.frame=CGRectMake(5,70,290, 377);
        
        [self.view setBackgroundColor:[UIColor grayColor]];
        
        [imgSliderView.closeBut addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view.superview addSubview:imgSliderView]; */
        
        
        NSLog(@"picture array %@",productObject.pictureURl);
        sampleObj=[[self storyboard]instantiateViewControllerWithIdentifier:@"SliderController"];
        [self.view setBackgroundColor:[UIColor grayColor]];
        
        sampleObj.imageURLArray=productObject.pictureURl;
        sampleObj.view.frame=CGRectMake(20,90,280,380);
        [self.view addSubview:sampleObj.view];
        
              NSLog(@" m here");
    }

    
}

-(void)removeView{
    
   
    [self.view setBackgroundColor:[UIColor whiteColor]];
}


@end
