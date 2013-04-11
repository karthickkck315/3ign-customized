//
//  ImageSliderViewController.h
//  System3ign
//
//  Created by sanu on 25/12/12.
//
//

#import <UIKit/UIKit.h>
#import "ImageScroll.h"
#import "ProductDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ImageDownloader.h"




@interface ImageSliderViewController : UIViewController<UIScrollViewDelegate>{


    NSMutableArray *imageURLArray;
    NSMutableArray *imagesArray;
  
    NSURLConnection *connection;
    NSMutableData *data;
    UIImageView *grey_imgView;
    
    NSMutableArray *tempArray;
    
}
@property (nonatomic,retain) IBOutlet UIButton *closeButton;
- (IBAction)closeBut:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *mainView;
@property (strong, nonatomic) IBOutlet ImageScroll *scroller;
@property(nonatomic,retain) NSMutableArray *imageURLArray;

@property(nonatomic,retain) NSMutableArray *imagesArray;



-(UIImage *)getImage:(NSString *)urlString;
- (void)loadImageFromURL:(NSString*)urlstr;
- (UIImage*) image;


@end
