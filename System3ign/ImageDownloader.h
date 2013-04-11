//
//  ImageDownloader.h
//  TestLoadingMultipleImages
//
//  Created by Shri on 25/11/12.
//  Copyright (c) 2012 Shri. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ImageDownloaderDelegate

@required
-(void)updateImage:(UIImage*)image withTag:(int)imageTag;
@end


@interface ImageDownloader : NSObject {
    
    NSURLConnection* connection;
    NSMutableData* data;
    id delegate;
    
}

-(void)loadImage:(NSString*)urlString;
@property(nonatomic, retain) id delegate;
@property(nonatomic) int imageTag;

@end
