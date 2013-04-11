//
//  AccountInfoViewController.m
//  System3ign
//
//  Created by shri@ideazglobal.com on 22/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScannerViewController.h"
#import "ProductDetailsViewController.h"


@interface ScannerViewController ()

@end

@implementation ScannerViewController
@synthesize scannviewcontroll;
@synthesize scannedInfo;
@synthesize scannerviewcontroll;
@synthesize scannview;
@synthesize acindicator;
@synthesize imgPicker;


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
    UIImage *tabBarImage=[[UIImage imageNamed:@"tabbarimage.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10,10,10,1)];
    UIColor *TabTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"rect.png"]];
    [[UITabBar appearance]setBackgroundImage:tabBarImage];
    [[UITabBar appearance]setSelectedImageTintColor:TabTintColor];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_tab.png"]forBarMetrics:UIBarMetricsDefault];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 50, 35)];
    label.text =@"Loading Please Wait";
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    [acindicator startAnimating];
   }

-(void)viewWillAppear:(BOOL)animated{
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"Tabbutton.png"]];
   [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rect.png"]],UITextAttributeTextColor,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor brownColor],UITextAttributeTextColor,nil] forState:UIControlStateSelected];


    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    reader = nil;
    reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.readerView.torchMode = 0;
    ZBarImageScanner *scanner = reader.scanner;
    [scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:1];
    [reader.readerView start];
    [self.view addSubview:reader.view];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"top.png"]forBarMetrics:UIBarMetricsDefault];
//    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(back:)];
//    self.navigationItem.rightBarButtonItem= back;
    
    
    
//    ProductDetailsViewController *pdvc = [[self storyboard] instantiateViewControllerWithIdentifier:@"ProductDetails"];
    
   // [self.navigationController pushViewController:pdvc animated:YES];
    

}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"Qrcode scanning");
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    NSString *hiddenData;
    for(symbol in results)
        hiddenData=[NSString stringWithString:symbol.data];
    NSLog(@"the symbols  is the following %@",symbol.data);
    // EXAMPLE: just grab the first barcode
    //  break;
    
    // EXAMPLE: do something useful with the barcode data
    //resultText.text = symbol.data;
//    resultTextView.text=symbol.data;
    NSLog(@"BARCODE= %@",symbol.data);
    
    NSUserDefaults *storeData=[NSUserDefaults standardUserDefaults];
    [storeData setObject:hiddenData forKey:@"CONSUMERID"];
    
    NSLog(@"SYMBOL : %@",hiddenData);
//    resultTextView.text=hiddenData;
    scannedInfo.text = hiddenData;
    NSLog(@"hidden data %@",hiddenData);
    
    NSLog(@"scanner informatiom----->%@",scannedInfo.text);
   // [reader dismissModalViewControllerAnimated:NO];
    
    
    if ([hiddenData rangeOfString:@"3ign.com"].location != NSNotFound||[hiddenData rangeOfString:@"24hourlab.com"].location != NSNotFound||[hiddenData rangeOfString:@"3ign.sg"].location != NSNotFound)
    {
        //   NSString *result=[str rangeOfString:@"awesome"];
        
        // NSLog(@"str %@",[str rangeOfString:@"awesome"]);
        NSLog(@"3ign.com %d",[hiddenData rangeOfString:@"3ign.com"].location);
        NSLog(@"24hourlab %d",[hiddenData rangeOfString:@"24hourlab.com"].location);
        NSLog(@"3ign.sg %d",[hiddenData rangeOfString:@"3ign.sg"].location);

        
        NSLog(@" found");
        
        
        
        ImageDownloader *imgDownloaderObj=[[ImageDownloader alloc]init];
        imgDownloaderObj.delegate=self;
        imgDownloaderObj.isProduct=YES;
        imgDownloaderObj.imageTag=1;
        
        NSLog(@"DOWNLOADER OBJ %@",[imgDownloaderObj description]);
        
        [imgDownloaderObj loadImage:hiddenData];
        
        
        
        
           
        
        
//        DataController *dvc=[[DataController alloc]init];
//        
//        dvc.productUrlString=hiddenData;
        
        // productObject =[dvc getProductDetails:productUrl];
        
    //    [dvc getmyProductDetails];

        NSLog(@"after product method ");
//        
//        ProductDetailsViewController *pdvc = [[self storyboard] instantiateViewControllerWithIdentifier:@"ProductDetails"];
//       [[pdvc navigationController] setNavigationBarHidden:YES animated:YES];
       
        
        
        
        
        //        pdvc.navigationController.navigationBarHidden=YES;
        //        [self.navigationController pushViewController:pdvc animated:YES];
        
        
        
        
       //pdvc.productUrl=hiddenData;
//        
//        pdvc.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
//       [self presentModalViewController:pdvc animated:YES];

        // long is in 'A long string.'
    }
    else 
    {
        
        NSLog(@"! found");
        NSLog(@"No hidden data found.,");
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"3ign" message:@"Invalid QR code" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];

        
        // long is not in 'A long string.' 
    }
    
    
    /*if (hiddenData) {
        ProductDetailsViewController *pdvc = [[self storyboard] instantiateViewControllerWithIdentifier:@"ProductDetails"];
        [[pdvc navigationController] setNavigationBarHidden:YES animated:YES];
//        pdvc.navigationController.navigationBarHidden=YES;
//        [self.navigationController pushViewController:pdvc animated:YES];
        
        pdvc.productUrl=hiddenData;
        
        pdvc.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:pdvc animated:YES];
    }else{
        NSLog(@"No hidden data found.,");
    } */
}



- (void)viewDidUnload
{
    [self setScannedInfo:nil];
    [self setScannerviewcontroll:nil];
    [self setScannviewcontroll:nil];
    [self setAcindicator:nil];
    [super viewDidUnload];
//    UINavigationBar *navBar = [[self navigationController] navigationBar];
//    UIImage *backgroundImage = [UIImage imageNamed:@"top.png"];
//    [navBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    // Release any retained subviews of the main view.
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//- (IBAction)showScanner:(id)sender {
////    reader = [ZBarReaderViewController new];
////    reader.readerDelegate = self;
////    reader.readerView.torchMode = 0;
////    
//////    reader.cameraOverlayView = self.view;
////    
////    ZBarImageScanner *scanner = reader.scanner;
////    
////    [scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:0];
////    
////    [self presentModalViewController:reader animated:YES];
//////    resultTextView.hidden = NO;
////
//    ProductDetailsViewController *pdvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetails"];
//    
//    [self presentModalViewController:pdvc animated:YES];
//}



-(void)updateProduct:(NSMutableData *)mydata withTag:(int)imageTag{
    
    NSLog(@"call the controller");
    
    NSLog(@"data %@",mydata);
    
    
    DataController* dvc=[[DataController alloc]init];
    
   
          
       
     ProductDetailsViewController *pdvc = [[self storyboard] instantiateViewControllerWithIdentifier:@"ProductDetails"];
    
    pdvc.productObject=[dvc parseProductDetails:mydata];

   
    NSLog(@"return to delegate");
    
    
   
    [[pdvc navigationController] setNavigationBarHidden:YES animated:YES];

    pdvc.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:pdvc animated:YES];
    

    
    
    
    
    
    
    
//    NSXMLParser *xmlParser = [[NSXMLParser alloc]initWithData:mydata];
//    
//    [xmlParser setDelegate:self];
//    BOOL success=[xmlParser parse];
//    if(success){
//        NSLog(@"No Errors");
//        
//        
//    }
//    else{
//        NSLog(@"Error Error Error!!!");
//    }
//    
//    
//    NSLog(@" pic count    %d",[pdtObject.pictureURl count]);
//    NSLog(@"vendor array count    %d",[pdtObject.sameVendor count]);
//    NSLog(@"relatd array count  %d",[pdtObject.relatedProduct count]);
//    
//    
//    ProductDetailsViewController *pdvc=[[ProductDetailsViewController alloc]init];
//    //    pdvc.productObject=pdtObject;
//    
//    // ProductDetailsViewController *pdvc = [[self storyboard] instantiateViewControllerWithIdentifier:@"ProductDetails"];
//    pdvc.productObject=pdtObject;   
//    
//    pdvc.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
//    //  [self presentModalViewController:pdvc animated:YES];
    
    
}

@end
