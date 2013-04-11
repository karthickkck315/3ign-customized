//
//  ImageSliderViewController.m
//  System3ign
//
//  Created by sanu on 25/12/12.
//
//

#import "ImageSliderViewController.h"

@interface ImageSliderViewController ()

@end

@implementation ImageSliderViewController

@synthesize closeButton;
@synthesize mainView;
@synthesize scroller;
@synthesize imageURLArray;
@synthesize imagesArray;

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
    
    self.view.backgroundColor=[UIColor clearColor];
    
  //  ProductDetailsViewController *pds=[[ProductDetailsViewController alloc]init];
//   myTemp=[[NSMutableArray alloc]init];
//    myTemp=pds.productObject.pictureURl;
    NSLog(@"check %@",imageURLArray);
    
//    grey_imgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"5.png"] ];
//    grey_imgView.frame=CGRectMake(0,0,320,480);
//    [self.view addSubview:grey_imgView];
//
    //ProductDetailsViewController *pvc=[[ProductDetailsViewController alloc]init];
   //[pvc.addTocartButton setUserInteractionEnabled:NO];
    
    
       
    
    [imageURLArray insertObject:@"http://www.executive-shaving.co.uk/shaving/belts/brown-201114-b.jpg" atIndex:2];
    
     [imageURLArray insertObject:@"http://tradekeyindia.com/Pimages/19177leather-wallets-720294.jpg" atIndex:3];
     [imageURLArray insertObject:@"http://www.freshpromotions.com.au/products/leather-and-suede-wallet1.jpg" atIndex:4];
   // imageURLArray=[[NSMutableArray alloc]initWithObjects:@"http://2.bp.blogspot.com/_MG2lohVSCfg/TJdBCJDoMwI/AAAAAAAAAFM/SyPnJfyGfKg/s640/laughing-babies-pictures11.jpg",@"http://images.nymag.com/news/features/spectrum121029_560.jpg",@"http://www.gettyimages.com/CMS/StaticContent/1348695736616_animals.jpg",nil];
    
    
        NSLog(@"img count %d",[imagesArray count]);
    
    
   //  imagesArray = [[NSMutableArray alloc]init];
    
    [super viewDidLoad];
    
    
    
    scroller.delegate = self;
    	scroller.scrollEnabled = YES;
       // scroller.frame=CGRectMake(20,340,250,110);
    
    
    	int scrollWidth = 70;
    	scroller.contentSize = CGSizeMake(scrollWidth,100);
    
    
    	//UIImage *tempImg=[[UIImage alloc] init];
    
//    NSLog(@"ref %@",[imageURLArray objectAtIndex:0]);
//    NSLog(@"ref %@",[imageURLArray objectAtIndex:1]);
//    NSLog(@"ref %@",[imageURLArray objectAtIndex:2]);
    //  tempImg=[self getImage:[imageURLArray objectAtIndex:0]];
    
    
    //    mainView.frame=CGRectMake(60,50,170,190);
  //  closeButton.frame=CGRectMake(250,16,25,25);
    	int xOffset = 0;
    	mainView.image =[imagesArray objectAtIndex:0];
    
    NSLog(@"imagesArray cound%d",[imagesArray count]);
    
    
   tempArray=[[NSMutableArray alloc]init];
        
   // int mycount=[imageURLArray count]-1;
    	//for(int index=0; index <[imageURLArray count]; index++)
    for(int index=0; index <[imagesArray count]; index++)

    {
            NSLog(@"m here");
    
    		UIImageView *img = [[UIImageView alloc] init];
    		//img.bounds = CGRectMake(10, 10, 50, 50);
    		//img.frame = CGRectMake(1+xOffset,20, 160,110);
            img.frame = CGRectMake(1+xOffset,20,90,70);
            
            img.layer.borderColor=[UIColor grayColor].CGColor;
            img.layer.borderWidth=2.0f;
            img.layer.cornerRadius=2.0f;
            

            img.image =[imagesArray objectAtIndex:index];
            [tempArray insertObject:img atIndex:index];
        
        
    		//[imageURLArray insertObject:img atIndex:index];
    
            // scrollView.clipsToBounds=YES;
    		//scroller.contentSize = CGSizeMake(scrollWidth+xOffset,110);
            scroller.contentSize = CGSizeMake(scrollWidth+xOffset,70);
    		[scroller addSubview:[tempArray objectAtIndex:index]];
    		
    		xOffset += 90; 
    	}
    
        
    
    
    NSLog(@"M HERE END OF DID LOAD");
   // [self addImageToScrollView];
}




- (void)viewDidUnload
{
    [self setMainView:nil];
    [self setScroller:nil];
    [self setCloseButton:nil];
    [self setImageURLArray:nil];
    
        [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}









-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"touches began");
    
    UITouch * touch = [[event allTouches] anyObject];
	
	for(int index=0;index<[tempArray count];index++)
	{
		UIImageView *imageView = [tempArray objectAtIndex:index];
		NSLog(@"x=%f,y=%f,width =%f,height=%f",imageView.frame.origin.x,imageView.frame.origin.y,imageView.frame.size.width,imageView.frame.size.height);
		NSLog(@"x= %f,y=%f",[touch locationInView:self.view].x,[touch locationInView:self.view].y) ;
		
		if(CGRectContainsPoint([imageView frame], [touch locationInView:scroller]))
		{
			[self ShowDetailView:imageView];
			
            break;
		}
	}
}












-(void)ShowDetailView:(UIImageView *)imageView
{
	self.mainView.image =imageView.image;
}


- (IBAction)closeBut:(id)sender {
    
    
    NSLog(@"close button clicked");
    
    [self.view removeFromSuperview];
     
    
   // [self dismissModalViewControllerAnimated:YES];
       
   // [pvc.addTocartButton removeTarget:Nil action:NULL forControlEvents:UIControlStateNormal];
    
    
    
//    ProductDetailsViewController *pvc=[[self storyboard]instantiateViewControllerWithIdentifier:@"ProductDetails"];
//    ProductDetailsViewController *pvc=[[ProductDetailsViewController alloc]init];
//    [pvc removeGreyBackground];
  //  [pvc.addTocartButton setEnabled:YES];
    
    
        
       
       
   // 

    NSLog(@"log 1");
    NSLog(@"log 2");
}







//just in case you want to get the image directly, here it is in subviews
/*- (UIImage*) image {
	UIImageView* iv = [[self subviews] objectAtIndex:0];
	return [iv image];
}*/





@end
