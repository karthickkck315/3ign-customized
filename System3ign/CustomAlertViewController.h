//
//  CustomAlertViewController.h
//  System3ign
//
//  Created by shri@ideazglobal.com on 01/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAlertViewController : UIViewController{

    NSString *titleText;

}
@property(nonatomic,retain)IBOutlet NSString *titleText;
- (IBAction)closeAlert:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *titleLable;

@end
