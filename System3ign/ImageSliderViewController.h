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

@interface ImageSliderViewController : UIViewController<UIScrollViewDelegate>{


    NSMutableArray *imageURLArray;
    NSMutableArray *imagesArray;
  
    NSURLConnection *connection;
    NSMutableData *data;
}
@property (strong, nonatomic) IBOutlet UIButton *closeButton;
- (IBAction)closeBut:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *mainView;
@property (strong, nonatomic) IBOutlet ImageScroll *scroller;
@property(nonatomic,retain) NSMutableArray *imageURLArray;
-(UIImage *)getImage:(NSString *)urlString;
- (void)loadImageFromURL:(NSString*)urlstr;
- (UIImage*) image;


@end
