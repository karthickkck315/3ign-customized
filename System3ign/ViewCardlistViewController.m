//
//  TablelistViewController.m
//  System3ign
//
//  Created by DEVA on 08/12/12.
//
//

#import "ViewCardlistViewController.h"
#import "AsyncImageView.h"
#import "CartListCell.h"
#import "SliderViewController.h"
#import "ProductAddToCartViewController.h"
#import "DrawPatternLockViewController.h"
#import "SignInViewController.h"
@interface ViewCardlistViewController ()

@property(nonatomic,retain)ProductAddToCartViewController *addCartObj;

@end

@implementation ViewCardlistViewController
@synthesize indicator;
@synthesize signIT;
@synthesize editbutton;
@synthesize viewbackground;
@synthesize tablelist;

@synthesize checkboxarray,cartListIDArray,addCartObj;
@synthesize totalPriceLabel;
@synthesize productObj;



//@synthesize activityIndicator;
//@synthesize checkbox;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}
-(void)viewDidLoad{
        signIT.hidden=NO;
    [super viewDidLoad];
    totalPrice=0;
    
  /*  addCartObj=[[ProductAddToCartViewController alloc]init];
     [self presentModalViewController:addCartObj animated:NO];
        cartListIDArray=[addCartObj fetchDataFromDB];
   
    
    [self dismissModalViewControllerAnimated:YES];
    
    NSLog(@"id's from db %@",cartListIDArray); */
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"nav_tab.png"]forBarMetrics:UIBarMetricsDefault];
    indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    indicator.frame=CGRectMake(10,20,40,50);

    
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    

    NSLog(@"view wil apper");
    cartListIDArray=[[NSMutableArray alloc]init];
    productObj=[[Product alloc] init];
    productListArray=[[NSMutableArray alloc]init];
    signIT.hidden=NO;
    
  //  [activityIndicator startAnimating];
    [indicator startAnimating];

    self.tablelist.separatorColor = [UIColor clearColor];
    
   // [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_tab.png"]forBarMetrics:UIBarMetricsDefault];
    self.tablelist.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"List_bg.png"]];
    NSLog(@"wiil appear call");
    addCartObj=[[ProductAddToCartViewController alloc]init];
    [self presentModalViewController:addCartObj animated:NO];
    cartListIDArray=[addCartObj fetchDataFromDB];
    
    
    [self dismissModalViewControllerAnimated:YES];
    
    NSLog(@"id's from db %@",cartListIDArray);
    
    
    
    if (![cartListIDArray count]) {
        
       // signIT.hidden=YES;
        editbutton.hidden=YES;
        
    }
    
    
    totalPriceLabel.text=[NSString stringWithFormat:@"%d",totalPrice];
    
    
    NSLog(@"Total price %d",totalPrice);
       
    NSString *path = [[NSBundle mainBundle]pathForResource:@"AppURL" ofType:@"plist"];
    NSDictionary *urlDictionary=[[NSDictionary alloc]initWithContentsOfFile:path];
    NSString *urlStr=[urlDictionary valueForKey:@"ProductID"];
    //NSLog(@"dic-->%@",urlDictionary);
    
    NSLog(@"url with pid %@",urlStr);
    
    
    ImageDownloader *imgDownloaderObj=[[ImageDownloader alloc]init];
    imgDownloaderObj.delegate=self;
    imgDownloaderObj.isProduct=YES;
    
    NSLog(@"--------------");
    if ([cartListIDArray count]!=0) {
        
        NSLog(@"m here");
        for (int index=0;index<[cartListIDArray count]; index++) {
        
        
        
               
        
        
        //Fetching url from Property list
        
        urlStr=[urlStr stringByReplacingOccurrencesOfString:@"pID" withString:[cartListIDArray objectAtIndex:index]];
        
        NSLog(@"url  %@",urlStr);
        
        
            imgDownloaderObj.isProduct=YES;
        imgDownloaderObj.imageTag=index;
        
        NSLog(@"DOWNLOADER OBJ %@",[imgDownloaderObj description]);
        
        [imgDownloaderObj loadImage:urlStr];

        }
    }
    
 
    
    [indicator stopAnimating];
    
}


-(void)myUrlRequestMethod{








}

- (void)viewDidUnload
{
    [self setViewbackground:nil];
  
  //  [self setCheckbox:nil];
    [self setTotalPriceLabel:nil];
    [self setSignIT:nil];
    [self setEditbutton:nil];
    [self setIndicator:nil];
    
    [self setCartListIDArray:Nil];
   
    
    
       [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    //
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    NSLog(@"section will be call");
    totalPrice=0;
    
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSLog(@"rows call");
    return [productListArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell for row at index path");
    static NSString *CellIdentifier =@"Cell";
    cell = (CartListCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   // cell.selectedBackgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"new.png"]];
  /*  cell.imageView.image = @"PHONE.jpeg";
    cell.imageView.image = [UIImage imageNamed:@"PHONE.jpeg"];
    cell.nameLabel.text =[arry objectAtIndex:indexPath.row];
    cell.priceLabel.text = @"$100"; */ 
    
   if ([productListArray count]!=0) {
        
        
//        NSString *path = [[NSBundle mainBundle]pathForResource:@"AppURL" ofType:@"plist"];
//        NSDictionary *urlDictionary=[[NSDictionary alloc]initWithContentsOfFile:path];
//        
//        NSLog(@"dic-->%@",urlDictionary);
//        
//        
//        
//        //Fetching url from Property list
//        NSString *urlStr=[urlDictionary valueForKey:@"ProductID"];
//        urlStr=[urlStr stringByReplacingOccurrencesOfString:@"pID" withString:[cartListIDArray objectAtIndex:indexPath.row]];
//       
//       NSLog(@"url  %@",urlStr);
       
       
//       ImageDownloader *imgDownloaderObj=[[ImageDownloader alloc]init];
//       imgDownloaderObj.delegate=self;
//       imgDownloaderObj.isProduct=YES;
//       imgDownloaderObj.imageTag=indexPath.row;
//       
//       NSLog(@"DOWNLOADER OBJ %@",[imgDownloaderObj description]);
//       
//       [imgDownloaderObj loadImage:urlStr];

        
//        DataController *dvc=[[DataController alloc]init];
//        
//        productObj =[dvc parseProductDetails:urlStr];
       
       
       
       Product *sampleObj=[productListArray objectAtIndex:indexPath.row];
       

    
    CGRect frame;
	frame.size.width=60; frame.size.height=60;
	frame.origin.x=0; frame.origin.y=0;
    
    AsyncImageView* oldImage = (AsyncImageView*)
    [cell.contentView viewWithTag:999];
    [oldImage removeFromSuperview];
	AsyncImageView* asyncImage = [[AsyncImageView alloc]
                                  initWithFrame:frame];
	asyncImage.tag = 999;
    //NSString *imageUrlString =@"http://gigaom2.files.wordpress.com/2012/09/screen-shot-2012-09-12-at-3-04-42-pm-e1347480376803.png?w=300&h=200&crop=1";
        
        NSString *imageUrlString=productObj.mainpicURL;
        
    NSURL *imageUrl = [NSURL URLWithString:imageUrlString];
    NSLog(@"image url -->%@", imageUrl);
	[asyncImage loadImageFromURL:imageUrl];
	[cell.contentView addSubview:asyncImage];
    cell.nameLabel.text = sampleObj.productName;
       
//       totalPrice+=[sampleObj.price intValue];
//       
//       totalPriceLabel.text=[NSString stringWithFormat:@"%d",totalPrice];
              
    cell.priceLabel.text =[NSString stringWithFormat:@"$%@",sampleObj.price];
        
   }else {
       totalPriceLabel.text=[NSString stringWithFormat:@"%d",totalPrice];
   }
    
        return cell;
}
- (IBAction) EditTable:(id)sender
{
	if(self.editing)
	{
		[super setEditing:NO animated:NO];
		[tablelist setEditing:NO animated:NO];
		[tablelist reloadData];
        [editbutton setTitle:@"Edit" forState:UIControlStateNormal];
        
	}
	else
	{
		[super setEditing:YES animated:YES];
		[tablelist setEditing:YES animated:YES];
		[tablelist reloadData];
        [editbutton setTitle:@"Done" forState:UIControlStateNormal];
	}
}
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
//	  toIndexPath:(NSIndexPath *)toIndexPath
//{
//        NSString *item = [cartListIDArray objectAtIndex:fromIndexPath.row];
//	[cartListIDArray removeObject:item];
//	[cartListIDArray insertObject:item atIndex:toIndexPath.row]; 
//   
//    NSLog(@"item %@",item);
//    
//	
//}
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
	
    if (editingStyle == UITableViewCellEditingStyleDelete)
	{
        
        
        NSString *item=[cartListIDArray objectAtIndex:indexPath.row];
        [cartListIDArray removeObjectAtIndex:indexPath.row];
        
        [productListArray removeObjectAtIndex:indexPath.row];
        
        
        [addCartObj removeValueFromDB:item];
       // [self dismissModalViewControllerAnimated:YES];
        
        
        
        
        NSLog(@" from edit style %@",cartListIDArray);
        
        
       // totalPrice=0;
		[tablelist reloadData];
        
        if (![productListArray count]) {
            
           signIT.hidden=YES;
            [totalPriceLabel setHidden:YES];
            [editbutton setHidden:YES];
            
        }
        
        
    }
    
        
    
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.editing ==NO || !indexPath)
        
        return UITableViewCellEditingStyleNone;
    
    return UITableViewCellEditingStyleDelete;

	}

#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	CartListCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"selected row %@",indexPath);
    
    
   // cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"new.png"]];
   // cell.backgroundColor=[UIColor clearColor];

    
    if (newCell.accessoryType == UITableViewCellAccessoryNone) {
       
		[newCell setAccessoryType:UITableViewCellAccessoryCheckmark];
      //  newCell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"new.png"]];

        newCell.selectedBackgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"new.png"]];
        
        
		NSLog(@"check click");
//        NSString *rupees = [NSString stringWithFormat:@"%@",productObj.price];
//        totalPriceLabel.text = productObj.price;
       //  NSString *rupees = [NSString stringWithFormat:@"%@",cell.priceLabel];
        
        
         NSString* cleanedString = [newCell.priceLabel.text stringByTrimmingCharactersInSet: [NSCharacterSet symbolCharacterSet]];
        
        NSLog(@"tot %i",totalPrice);
//        totalPrice+=[newCell.priceLabel.text intValue];
        totalPrice+=[cleanedString intValue];

        
        NSLog(@"price %@",cell.priceLabel.text);
        
         NSLog(@"total price %d",totalPrice);
        
      // CartListCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        
               
        
        //NSIndexPath *path = [self.tablelist indexPathForSelectedRow];
        
       // NSLog(@"Path %@",path);

        
        
       // totalPrice+=
               
               totalPriceLabel.text=[NSString stringWithFormat:@"%d",totalPrice];
              NSLog(@"Total price value===%@",totalPriceLabel);
	} else if (newCell.accessoryType == UITableViewCellAccessoryCheckmark) {
       
		[newCell setAccessoryType:UITableViewCellAccessoryNone];
        newCell.backgroundColor=[UIColor clearColor];
        
        
      		        NSLog(@"check release");
        
        NSString* cleanedString = [newCell.priceLabel.text stringByTrimmingCharactersInSet: [NSCharacterSet symbolCharacterSet]];

        
         totalPrice-=[cleanedString intValue];
        
        NSLog(@"total price %d",totalPrice);
        totalPriceLabel.text=[NSString stringWithFormat:@"%d",totalPrice];

	}
    
    
 
}



//-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
//



//}
- (IBAction)signit:(id)sender {
    
  //  totalPrice=0;
    
    DrawPatternLockViewController *lockVC = [[DrawPatternLockViewController alloc] init];
    [lockVC setIsScreenType:@"cardlist"];
    [lockVC setTarget:self withAction:@selector(lockEntered:)];
    
    [self presentModalViewController:lockVC animated:YES];
    label =[[UILabel alloc]initWithFrame:CGRectMake(80, 90, 160, 35)];
    label.text = @"Enter Your Password";
    
    label.textColor = [UIColor blackColor];
    [label setBackgroundColor:[UIColor clearColor]];
    [lockVC.view addSubview:label];
    label.font = [UIFont systemFontOfSize:12.0f];
    label.textAlignment = UITextAlignmentCenter;
}

- (void)lockEntered:(NSString*)key {
    
    NSLog(@"test entered..");
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    
    if([key isEqualToString:[defaults  valueForKey:@"oldPassword"]]){
        
       NSLog(@"oldpassword=%@",[defaults  valueForKey:@"oldPassword"]);
        [self dismissModalViewControllerAnimated:YES];
        [button sendActionsForControlEvents: UIControlEventTouchUpInside];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"3IGN" message:@"You are purchasing headphones for $19.99.  Do you want to continue?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Okay",nil];
        [alert show];
        
        
    }else{
        
label.text = @"Enter your correct password";
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"3ign It" message:@"Please enter correct password" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
//        [alert show];
    }
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
    




-(void)updateProduct:(NSMutableData *)mydata withTag:(int)imageTag{
    
    NSLog(@"update method called" );
    DataController *dvc=[[DataController alloc]init];
    
    productObj =[dvc parseProductDetails:mydata];
    
    [productListArray addObject:productObj];
    
    
    [tablelist reloadData];
    
    
    
    
   

    
//    NSLog(@"call the controller");
//    
//    NSLog(@"data %@",mydata);
//    
//    
//    DataController* dvc=[[DataController alloc]init];
//    
//    
//    
//    ProductDetailsViewController *pdvc = [[self storyboard] instantiateViewControllerWithIdentifier:@"ProductDetails"];
//    
//    pdvc.productObject=[dvc parseProductDetails:mydata];
//    
//    
//    NSLog(@"return to delegate");
//    
//    
//    
//    [[pdvc navigationController] setNavigationBarHidden:YES animated:YES];
//    
//    pdvc.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
//    [self presentModalViewController:pdvc animated:YES];
//    


}



@end
