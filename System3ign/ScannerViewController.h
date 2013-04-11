//
//  AccountInfoViewController.h
//  System3ign
//
//  Created by shri@ideazglobal.com on 22/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"
//#import "QRScannerView.h"
#import "ImageDownloader.h"


@interface ScannerViewController : UIViewController <UIImagePickerControllerDelegate, ZBarReaderDelegate,ImageDownloaderDelegate> {
    
    ZBarReaderViewController *reader;
//    QRScannerView *scannerView;

//    NSURLConnection* connection;
//    NSMutableData* data;


}
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *acindicator;

@property(nonatomic, retain) UIImagePickerController *imgPicker;
- (IBAction)showScanner:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *scannedInfo;
@property (strong, nonatomic) IBOutlet UIImageView *scannerviewcontroll;
@property (strong,nonatomic) IBOutlet ScannerViewController *scannview;
@property (strong, nonatomic) IBOutlet UIButton *scannviewcontroll;


@end
