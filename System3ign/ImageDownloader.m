//
//  ImageDownloader.m
//  TestLoadingMultipleImages
//
//  Created by Shri on 25/11/12.
//  Copyright (c) 2012 Shri. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader
@synthesize delegate;
@synthesize imageTag;


-(void)doThis{
    
    
    
    
    
}


-(void)loadImage:(NSString*)urlString{

    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //hidden to release version 1.0  NSLog(@"image url-->%@", urlString);
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self];

}

//- (void)loadImageFromURL:(NSURL*)url {
//    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
//    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self]; //notice how delegate set to
//}


- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
    
//        //hidden to release version 1.0  NSLog(@"did receive data method called..");
	if (data==nil) { data = [[NSMutableData alloc] initWithCapacity:2048]; }
    //    //hidden to release version 1.0  NSLog(@"received data..");
	[data appendData:incrementalData];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
    //hidden to release version 1.0  NSLog(@"connection did finish laoding image data., %d", [data length]/1024);
    if([self.delegate conformsToProtocol:@protocol(ImageDownloaderDelegate)]) {
        BOOL test = [self.delegate respondsToSelector:@selector(testPrint:)];
        //hidden to release version 1.0  NSLog(@"%@", test?@"Yes":@"No");
        if (!test) {
            [self.delegate updateImage:([UIImage imageWithData:data]) withTag:imageTag];
        }else {
            //hidden to release version 1.0  NSLog(@"No 'updateImage' method found");
        }
    }else {
        //hidden to release version 1.0  NSLog(@"No CustomDelegate Found..");
    }
    connection = nil;
}

-(void)dealloc{
    [self setDelegate:nil];
    
    connection = nil;
    data = nil;
    delegate = nil;
    
}

@end
