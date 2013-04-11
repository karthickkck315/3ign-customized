//
//  ACCInfoViewController.h
//  System3ign
//
//  Created by sanu on 27/11/12.
//
//

#import <UIKit/UIKit.h>
#import "SignUpView.h"
#import "SignInViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@interface ACCInfoViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,NSXMLParserDelegate>{

    SignUpView *signupView;
    SignUpView *signUpView;
    SignUpView *savedView1;
SignUpView *savedView2;
     SignUpView *cvcView;
    BOOL isFirstTimePatterPassword;
    BOOL isPatterOldPassword;
    UITextField *currentTextField;
    DrawPatternLockViewController *lockVC;
    UILabel *label;
    BOOL keyboardIsShown;
    UIPickerView *picker;
    UIToolbar *mypickerToolbar;
    CGPoint offset;
    
    UILabel *pickerNameLabel;
}
@property (strong, nonatomic) IBOutlet UIButton *logOut;
- (IBAction)logOut:(id)sender;

- (IBAction)changeTheUserInfo:(id)sender;

- (IBAction)changeThePassword:(id)sender;
- (IBAction)changeTheCreditCardAddress:(id)sender;

@property(nonatomic)BOOL isFirstTimePatterPassword;
@property(nonatomic)BOOL isPatterOldPassword;



@end
