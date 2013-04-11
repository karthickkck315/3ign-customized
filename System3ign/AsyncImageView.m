
//

#import "AsyncImageView.h"


// This class demonstrates how the URL loading system can be used to make a UIView subclass
// that can download and display an image asynchronously so that the app doesn't block or freeze
// while the image is downloading. It works fine in a UITableView or other cases where there
// are multiple images being downloaded and displayed all at the same time. 

@implementation AsyncImageView

- (void)dealloc {
	[connection cancel]; //in case the URL is still downloading
//	[connection release];
//	[data release]; 
//    [super dealloc];
}


- (void)loadImageFromURL:(NSURL*)url {
//    NSLog(@"loading image from url -->%@", url);
//	if (connection!=nil) { [connection release]; } //in case we are downloading a 2nd image
//	if (data!=nil) { [data release]; }
	
	NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
//    NSLog(@"check here..%@", request);
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self]; //notice how delegate set to self object
    
	//TODO error handling, what if connection is nil?
//    NSLog(@"process done.. %@", connection);
}


//the URL connection calls this repeatedly as data arrives
- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
//    NSLog(@"did receive data method called..");
	if (data==nil) { data = [[NSMutableData alloc] initWithCapacity:2048]; } 
//    NSLog(@"received data..");
	[data appendData:incrementalData];
}

//the URL connection calls this once all the data has downloaded
- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
	//so self data now has the complete image 
//	[connection release];
//    NSLog(@"connection finished loading");
    float dataLength = 0.0;
    
    // implementation:
    dataLength = dataLength + [data length];
    NSLog(@"Image size --> (%.2fMB)", (dataLength / 1048576));
	connection=nil;
	if ([[self subviews] count]>0) {
		//then this must be another image, the old one is still in subviews
		[[[self subviews] objectAtIndex:0] removeFromSuperview]; //so remove it (releases it also)
	}
	
	//make an image view for the image
	UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:data]];
//    NSLog(@"imageView frame logging starts..");
    
//    NSLog(@"imageView -->%@", [imageView description]);
	//make sizing choices based on your needs, experiment with these. maybe not all the calls below are needed.
    //imageView.backgroundColor = [UIColor colorWithRed:172.0/255.0 green:173.0/255.0 blue:175.0/255.0 alpha:1.0];
	imageView.contentMode = UIViewContentModeScaleAspectFit;
//    NSLog(@"imageView -->%@", [imageView description]);
	imageView.autoresizingMask = ( UIViewAutoresizingFlexibleWidth || UIViewAutoresizingFlexibleHeight );

//    NSLog(@"imageView frame logging ends..");

	[self addSubview:imageView];
//	imageView.frame = self.bounds;
//    CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    imageView.frame = CGRectMake(6, 0, 75, 70);
 //   NSLog(@"imageView after setting frame -->%@", [imageView description]);

	[imageView setNeedsLayout];
	[self setNeedsLayout];
//	[data release]; //don't need this any more, its in the UIImageView now
	data=nil;
}

//just in case you want to get the image directly, here it is in subviews
- (UIImage*) image {
	UIImageView* iv = [[self subviews] objectAtIndex:0];
	return [iv image];
}

@end
