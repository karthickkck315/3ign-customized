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
#import "ImageDownloader.h"
#import "InStoreViewController.h"



@interface ProductDetailsViewController ()
{

  
    ImageSliderViewController *sampleObj;
    CustomAlertViewController *CustomizedalertView;


}

@end

@implementation ProductDetailsViewController 

//technical properties

@synthesize productUrl;
@synthesize ignITNowButton;
@synthesize addTocartButton;
@synthesize backBarbutton;
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
@synthesize productObject;




//design properties
@synthesize Productvendor;
@synthesize Terms;
@synthesize vendorProductImage;
@synthesize termsTxtView;


@synthesize descriptiontextview;
@synthesize descriptionButton;
@synthesize termsButton;
@synthesize vendorButton;

@synthesize grey_imgView;
@synthesize discriptionview;

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
    
    
    NSLog(@"detail view did load");
    
       [super viewDidLoad];
    
    
    
    
    
    
    
    
   
   // sampleObj=[[self storyboard]instantiateViewControllerWithIdentifier:@"SliderController"];
//    sampleObj=[[ImageSliderViewController alloc]init];
//    sampleObj.imagesArray=[[NSMutableArray alloc]init];
    vendorProductObject=[[Product alloc]init];

    
    imagesForSlider=[[NSMutableArray alloc]init];
    
    descriptiontextview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Bground.png"]];
    termsTxtView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Bground.png"]];
    vendorProductList.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Bground.png"]];
    
    

    
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"nav_tab.png"]forBarMetrics:UIBarMetricsDefault];
    isfirstTimeParsing=YES;
    
    
   
    [activeanimate startAnimating];
}
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
    
      [super viewDidAppear:NO];
    
    
//    UIButton *but=[[UIButton alloc]init];
//    [but setImage:[UIImage imageNamed:@"EDIT.png"] forState:UIControlStateNormal];
//    [but setTitle:@"Back" forState:UIControlStateNormal];
//    backBarbutton =[[UIBarButtonItem alloc]initWithCustomView:but];
    //[backBarbutton ];
    
    UIButton *customButton=[[UIButton alloc]init];
    [customButton setBackgroundImage:[UIImage imageNamed:@"rect.png"] forState:UIControlStateNormal];
    
    
  //  backBarbutton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"rect.png"] style:UIBarButtonItemStyleDone target:nil action:nil];
  //  [backBarbutton setTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rect.png"]]];
    
        
    if (isfirstTimeParsing) {
        
    
    NSLog(@"view did load");
  //  productObject=[[Product alloc]init];
       
      
   /* NSString *path = [[NSBundle mainBundle]pathForResource:@"AppURL" ofType:@"plist"];
    NSDictionary *urlDictionary=[[NSDictionary alloc]initWithContentsOfFile:path];
    
    NSLog(@"dic-->%@",urlDictionary);
    
  
        
        //Fetching url from Property list
            NSString *urlStr=[urlDictionary valueForKey:@"ProductDetails"];*/
        
        
        
        
        
//    DataController *dvc=[[DataController alloc]init];
//        
//        dvc.productUrlString=productUrl;
//    
//   productObject =[dvc getProductDetails:productUrl];
        
   //     [dvc getmyProductDetails];
        
       // [dvc performSelectorInBackground:@selector(getmyProductDetails) withObject:Nil];  
    
    
    
    NSLog(@"return to detail screen");
    NSLog(@"product %@",productObject.productName);
    NSLog(@"product %@",productObject.productID);
    NSLog(@"product object%@",productObject.price);
    
        
    
    
    
    
    productname.text=productObject.productName;
    productamount.text=productObject.price;
    descriptiontextview.text=productObject.productDescription;
    termsTxtView.text=productObject.tac;
    MainImage.image=[self getImage:productObject.mainpicURL];
    
    
   // vendorProductObject=[productObject.sameVendor objectAtIndex:0];
        NSLog(@"same vendor product name %@",vendorProductObject.productName);
    
    NSLog(@"vendor id%@",vendorProductObject.productID);
        NSLog(@"vendor productname%@",vendorProductObject.productName);
        NSLog(@"vendor p price %@",vendorProductObject.price);
       // NSLog(@"vendor id%@",vendorProductObject.productID);
        
        
//    vendorProductName.text=vendorProductObject.productName;
//    vendorProductPrice.text=vendorProductObject.price;
//    vendorProductImage.image=[self getImage:vendorProductObject.mainpicURL];
    
    [Productvendor setHidden:YES]; 
    

//    [self.navigationController.navigationItem setTitle:@"3ign"];
//     self.navigationController.navigationBarHidden=NO;
    [activeanimate stopAnimating];
        isfirstTimeParsing=NO;
        
    }else if (!isfirstTimeParsing){
    
            //do nothing
    
    }
    
    
    
}


-(void)viewWillAppear:(BOOL)animated{

    NSLog(@"will appear");


    
    for(int index=0; index <[productObject.pictureURl count]-1; index++){
        
        
        
        ImageDownloader *imgDownloader=[[ImageDownloader alloc]init];
        [imgDownloader setImageTag:index];
        imgDownloader.delegate = self;
        [imgDownloader loadImage:[productObject.pictureURl objectAtIndex:index]];
        
        
    }
    

}

-(UIImage *)getImage:(NSString *)urlString{
    NSURL *url=[NSURL URLWithString:urlString];
    NSData *data1=[NSData dataWithContentsOfURL:url];
    UIImage *img=[UIImage imageWithData:data1];
    return img;


}

- (void)viewDidUnload
{
    //[self setProductObject:Nil];
    
    
    [self setProductUrl:Nil];
    [self setGrey_imgView:nil];
    
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
   
    [self setBackBarbutton:nil];
    [self setIgnITNowButton:nil];
    [self setAddTocartButton:nil];
    [self setDiscriptionview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (IBAction)productDescriptionAction:(id)sender {
    NSLog(@"test 1.,");
    [self.view bringSubviewToFront:descriptiontextview];
    [self.Terms setHidden:YES];
    [self.Productvendor setHidden:YES];
    [self.discriptionview setHidden:NO];
    descriptiontextview.text=productObject.productDescription;
    [self.descriptionButton setImage:[UIImage imageNamed:@"new.png"] forState:UIControlStateNormal];
    [self.termsButton setImage:[UIImage imageNamed:@"se.png"] forState:UIControlStateNormal];
    [self.vendorButton setImage:[UIImage imageNamed:@"se.png"] forState:UIControlStateNormal];
}
- (IBAction)termsAction:(id)sender {
    NSLog(@"test 2.,");
    [self.view bringSubviewToFront:Terms];
    [self.discriptionview setHidden:YES];
    [self.Productvendor setHidden:YES];
    [self.Terms setHidden:NO];
    
    [self.termsButton setImage:[UIImage imageNamed:@"new.png"] forState:UIControlStateNormal];
    [self.descriptionButton setImage:[UIImage imageNamed:@"se.png"] forState:UIControlStateNormal];
    [self.vendorButton setImage:[UIImage imageNamed:@"se.png"] forState:UIControlStateNormal];
    [self.Productvendor setHidden:YES];
}
- (IBAction)productFromVendorAction:(id)sender {
    NSLog(@"test 3.,");
    [self.view bringSubviewToFront:Productvendor];
    [self.discriptionview setHidden:YES];    
    [self.Terms setHidden:NO];
    [self.Productvendor setHidden:NO];
    
    [self.termsButton setImage:[UIImage imageNamed:@"se.png"] forState:UIControlStateNormal];
    [self.descriptionButton setImage:[UIImage imageNamed:@"se.png"] forState:UIControlStateNormal];
    [self.vendorButton setImage:[UIImage imageNamed:@"new.png"] forState:UIControlStateNormal];
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
   
    NSLog(@"no of rows %d",[productObject.sameVendor count]);
    
    return [productObject.sameVendor count];
   // return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    vendorProductObject=[productObject.sameVendor objectAtIndex:indexPath.row];

    
    static NSString *CellIdentifier = @"Cell";
    VendorCell *cell = (VendorCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.selectedBackgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"new.png"]];
    
    NSLog(@"vendor pname %@",vendorProductObject.productName);
    NSLog(@"vendor price %@",vendorProductObject.price);
    NSLog(@"vendor img url %@",vendorProductObject.mainpicURL);

    
    cell.imgView.image=[self getImage:vendorProductObject.mainpicURL];
    cell.nameLabel.text=vendorProductObject.productName;
   cell.priceLabel.text=vendorProductObject.price;
  //  cell.imageView.image = [UIImage imageNamed:@"cb_dark_off.png"];
   
   // cell.priceLabel.text =@"$40";
    
    //cell.nameLabel.text = @"Windows Mobile";
    
    
    NSLog(@"vendor product name %@",vendorProductObject.productName);
   
    return cell;
}



#pragma TableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"selected row %@",indexPath.row);
    
    
    
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
    ProductDetailsViewController *pdvc=[[ProductDetailsViewController alloc]init];
    ProductAddToCartViewController *addtocartViewCtrl=[[ProductAddToCartViewController alloc]init];
    
    [addtocartViewCtrl setProductObject:productObject];
    [self presentModalViewController:addtocartViewCtrl animated:NO];
    
    NSLog(@"bf insert call");
    
    pdvc=[addtocartViewCtrl insertProductIntoDB];
    NSLog(@"af insert call");
    
       [self dismissModalViewControllerAnimated:YES];
    NSLog(@"if check");
    if (!pdvc.isInsert) {
        NSLog(@"product insert into DB %d",isInsert?YES:NO);
        
       CustomizedalertView=[[self storyboard]instantiateViewControllerWithIdentifier:@"CustomAlert"];
//        [CustomizedalertView.view setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
//        CustomizedalertView.view.frame=CGRectMake(0,60,322,430);
        CustomizedalertView.titleText=@"Product already added to cart list";
        [self.view addSubview:CustomizedalertView.view];
      /*   UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Product added to cart." delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        
        
      alert.frame=CGRectMake(0,0,200,110);
        
        UIImage *alertImage = [UIImage imageNamed:@"alert.png"];
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:alertImage];
        
       
    backgroundImageView.frame = CGRectMake(0, 0, 282, 125);
       
        
      
        
        backgroundImageView.contentMode = UIViewContentModeScaleToFill;
        
        [alert setBackgroundColor:[UIColor clearColor]];
        [alert addSubview:backgroundImageView];
        
        [alert setClipsToBounds:YES];
         
        // [[[alert subviews]objectAtIndex:1]setFrame:CGRectMake(50,60,50,50)];
        
        
        [alert sendSubviewToBack:backgroundImageView]; 
               
        [alert show];*/
        
    }else {
        
        
        CustomizedalertView=[[self storyboard]instantiateViewControllerWithIdentifier:@"CustomAlert"];
        CustomizedalertView.titleText=@"Product added to cart list";
//        CustomizedalertView.titleText
        
        [self.view addSubview:CustomizedalertView.view];

        }

}


-(void)removeCustomizedAlertView{

    [self.view removeFromSuperview];

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
    
    label.textColor = [UIColor blackColor];
    [label setBackgroundColor:[UIColor clearColor]];
    [lockVC.view addSubview:label];
    label.font = [UIFont systemFontOfSize:12.0f];
    label.textAlignment = UITextAlignmentCenter;
    [self presentModalViewController:lockVC animated:YES];

//    [self presentModalViewController:lockVC animated:YES];
}


- (void)lockEntered:(NSString*)key {
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults  setObject:mykey forKey:@"oldPassword"];
//    [defaults  setValue:key forKey:@"oldPassword"];

    
    
    NSLog(@"test entered..");
    NSLog(@"oldpwd %@",[defaults  valueForKey:@"oldPassword"]);
    
    
    NSLog(@"Now enter password");
    if([key isEqualToString:[defaults  valueForKey:@"oldPassword"]]){
    
        NSLog(@"oldpassword=%@",[defaults  valueForKey:@"oldPassword"]);
        [self dismissModalViewControllerAnimated:YES];
       // [button sendActionsForControlEvents: UIControlEventTouchUpInside];
        label.text=@"Enter your password";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"You are purchasing headphones for $19.99.  Do you want to continue?" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:@"Cancel",nil];
        [alert show];

    
    }else{
    label.text = @"Password Mismatch";
    
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
        
        
            
       InStoreViewController  *instore = [[self storyboard]instantiateViewControllerWithIdentifier:@"store"];
        
        instore.productObj=self.productObject;
        
        
        [self presentModalViewController:instore animated:YES];
            
        
        
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{


    NSLog(@"touched");
    
    
    UITouch *touch=[[event allTouches]anyObject];
    
    NSLog(@"image array count %d",[productObject.pictureURl count]);
    
    if (CGRectContainsPoint([MainImage frame],[touch locationInView:self.view])) {
        
                
        NSLog(@"\n \nimg url's %@\n\n",productObject.pictureURl);
        
        
       // ImageSliderViewController *isvc=[[self storyboard]instantiateViewControllerWithIdentifier:@"SliderController"];
        
        
        sampleObj=[[self storyboard]instantiateViewControllerWithIdentifier:@"SliderController"];

        
        sampleObj.imagesArray=imagesForSlider;
        
        
        [self.view addSubview:sampleObj.view];

        
        
       // [self performSelectorInBackground:@selector(MyDownloadImage:) withObject:sampleObj];
        
       
        
       // [sampleObj performSelectorOnMainThread:@selector(CallThePopUpScreen) withObject:nil waitUntilDone:YES];
        
        
        NSLog(@"next to for loop");
       // loadingIndicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
      //  [activeanimate startAnimating];
        
        
       // [self CallThePopUpScreen];
        
      //  [self performSelectorInBackground:@selector(CallThePopUpScreen) withObject:Nil];
        
       // NSLog(@"return from CallThePopUpScreen");
              
         NSLog(@"next to stop animating");
               
//        NSLog(@"picture array %@",productObject.pictureURl);
//        sampleObj=[[self storyboard]instantiateViewControllerWithIdentifier:@"SliderController"];
//                
//        sampleObj.imageURLArray=productObject.pictureURl;
////        sampleObj.view.frame=CGRectMake(20,90,280,380);
//        [self.view addSubview:sampleObj.view];
        
        
        
        NSLog(@"end of touch");
    }
    
    
    
    NSLog(@"end of touch event method");
    
    
}





-(void)updateImage:(UIImage *)image withTag:(int)imageTag{
    
    NSLog(@"detail page");
    
    NSLog(@"image -->%@   imagetag-->%d", [image description], imageTag);
    
    [imagesForSlider addObject:image];
    
    NSLog(@"image array count %d",[imagesForSlider count]);
    NSLog(@"image array count %d",[productObject.pictureURl count]);
    
//    if ([productObject.pictureURl count]-1 == [sampleObj.imagesArray count]) {
//        NSLog(@"request completed");
//        
//        ImageSliderViewController *isvc=[[self storyboard]instantiateViewControllerWithIdentifier:@"SliderController"];
//        
//                 
//       isvc.imagesArray=sampleObj.imagesArray;
//        
//        
//        [self.view addSubview:isvc.view];
//
//    }
    
    
    
}

-(void)removeView{
   // grey_imgView.hidden=YES;
    
     //addTocartButton.enabled=YES;
   
   // [self.view setBackgroundColor:[UIColor whiteColor]];
    
}




@end
