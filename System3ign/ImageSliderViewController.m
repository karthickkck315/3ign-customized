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
    
    
  //  ProductDetailsViewController *pds=[[ProductDetailsViewController alloc]init];
//   myTemp=[[NSMutableArray alloc]init];
//    myTemp=pds.productObject.pictureURl;
    NSLog(@"check %@",imageURLArray);
    
    
    [imageURLArray insertObject:@"http://www.executive-shaving.co.uk/shaving/belts/brown-201114-b.jpg" atIndex:2];
    
     [imageURLArray insertObject:@"http://tradekeyindia.com/Pimages/19177leather-wallets-720294.jpg" atIndex:3];
     [imageURLArray insertObject:@"http://www.freshpromotions.com.au/products/leather-and-suede-wallet1.jpg" atIndex:4];
   // imageURLArray=[[NSMutableArray alloc]initWithObjects:@"http://2.bp.blogspot.com/_MG2lohVSCfg/TJdBCJDoMwI/AAAAAAAAAFM/SyPnJfyGfKg/s640/laughing-babies-pictures11.jpg",@"http://images.nymag.com/news/features/spectrum121029_560.jpg",@"http://www.gettyimages.com/CMS/StaticContent/1348695736616_animals.jpg",nil];
    
    
        NSLog(@"url %@",imageURLArray);
    
    
     imagesArray = [[NSMutableArray alloc]init];
    
    [super viewDidLoad];
    
    
    
    scroller.delegate = self;
    	scroller.scrollEnabled = YES;
        scroller.frame=CGRectMake(20,340,250,110);
    
    
    	int scrollWidth = 70;
    	scroller.contentSize = CGSizeMake(scrollWidth,100);
    
    
    	UIImage *tempImg=[[UIImage alloc] init];
    
    NSLog(@"ref %@",[imageURLArray objectAtIndex:0]);
    NSLog(@"ref %@",[imageURLArray objectAtIndex:1]);
    NSLog(@"ref %@",[imageURLArray objectAtIndex:2]);
     //  tempImg=[self getImage:[imageURLArray objectAtIndex:0]];
    
    [self loadImageFromURL:[imageURLArray objectAtIndex:0]];

        mainView.frame=CGRectMake(17,15,250,250);
    closeButton.frame=CGRectMake(250,-21, 50,50);
    	int xOffset = 0;
    	mainView.image =tempImg;
        
    
    	for(int index=0; index < [imageURLArray count]; index++)
    	{
            NSLog(@"m here");
    
    		UIImageView *img = [[UIImageView alloc] init];
    		//img.bounds = CGRectMake(10, 10, 50, 50);
    		//img.frame = CGRectMake(1+xOffset,20, 160,110);
            img.frame = CGRectMake(1+xOffset,20,90,70);

    		NSLog(@"image: %@",[imageURLArray objectAtIndex:index]);
    
            tempImg=[self getImage:[imageURLArray objectAtIndex:index]];
    		img.image =tempImg;
    		[imagesArray insertObject:img atIndex:index];
    
            // scrollView.clipsToBounds=YES;
    		//scroller.contentSize = CGSizeMake(scrollWidth+xOffset,110);
            scroller.contentSize = CGSizeMake(scrollWidth+xOffset,70);
    		[scroller addSubview:[imagesArray objectAtIndex:index]];
    		
    		xOffset += 90;
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
	
	for(int index=0;index<[imagesArray count];index++)
	{
		UIImageView *imageView = [imagesArray objectAtIndex:index];
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
   // [self dismissModalViewControllerAnimated:YES];
    
    [self.view removeFromSuperview];
    
}






- (void)loadImageFromURL:(NSString*)urlstr {
    //    NSLog(@"loading image from url -->%@", url);
    //	if (connection!=nil) { [connection release]; } //in case we are downloading a 2nd image
    //	if (data!=nil) { [data release]; }
	
    NSURL *url=[NSURL URLWithString:urlstr];
    NSLog(@"chk1 ");
    
	NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
    //    NSLog(@"check here..%@", request);
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self]; //notice how delegate set to self object
    
    NSLog(@"chk2 ");
    
    
    
	//TODO error handling, what if connection is nil?
    //    NSLog(@"process done.. %@", connection);
    
    
    
}


//the URL connection calls this repeatedly as data arrives
- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
    NSLog(@"chk3");
    
    //    NSLog(@"did receive data method called..");
	if (data==nil) { data = [[NSMutableData alloc] initWithCapacity:2048]; }
    //    NSLog(@"received data..");
	[data appendData:incrementalData];
    NSLog(@"chk4 ");
}

//the URL connection calls this once all the data has downloaded
- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
    NSLog(@"chk5 ");
	//so self data now has the complete image
    //	[connection release];
    //    NSLog(@"connection finished loading");
    float dataLength = 0.0;
    
    // implementation:
    dataLength = dataLength + [data length];
    NSLog(@"Image size --> (%.2fMB)", (dataLength / 1048576));
	connection=nil;
	/*if ([[self subviews] count]>0) {
		//then this must be another image, the old one is still in subviews
		[[[self subviews] objectAtIndex:0] removeFromSuperview]; //so remove it (releases it also)
	}*/
	
	//make an image view for the image
	UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:data]];
    //    NSLog(@"imageView frame logging starts..");
    
    //    NSLog(@"imageView -->%@", [imageView description]);
	//make sizing choices based on your needs, experiment with these. maybe not all the calls below are needed.
    //imageView.backgroundColor = [UIColor colorWithRed:172.0/255.0 green:173.0/255.0 blue:175.0/255.0 alpha:1.0];
	imageView.contentMode = UIViewContentModeScaleAspectFit;
    //    NSLog(@"imageView -->%@", [imageView description]);
	imageView.autoresizingMask = ( UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight );
    
    //    NSLog(@"imageView frame logging ends..");
    
	//[self.view addSubview:imageView];
    //	imageView.frame = self.bounds;
    //    CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
   // imageView.frame = CGRectMake(25, 0, 75, 70);
    //   NSLog(@"imageView after setting frame -->%@", [imageView description]);
    
	//[imageView setNeedsLayout];
	//[self setNeedsLayout];
    //	[data release]; //don't need this any more, its in the UIImageView now
	data=nil;
    NSLog(@"chk6 ");
    
    
}

//just in case you want to get the image directly, here it is in subviews
/*- (UIImage*) image {
	UIImageView* iv = [[self subviews] objectAtIndex:0];
	return [iv image];
}*/





@end
