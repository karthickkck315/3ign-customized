//DrawPatternLockview controller.h
#import <UIKit/UIKit.h>
#import "SignUpView.h"
#import "Product.h"
@interface DrawPatternLockViewController : UIViewController {
    NSMutableArray* _paths;
    id _target;
    SEL _action;
    SignUpView *sliderView;
    NSString *isScreenType;
    BOOL IsPatterOldPassword;
    BOOL isFirstTimePatterPassword;
    UIImageView *imageView;
    UIImage *dotImage;
    Product *products;
    UILabel *label;
BOOL isPatterOldPassword;
    UIImageView *colorimageView;
    UIImageView *testImageView1;
    UIImageView *testImageView2;
    UIImageView *testImageView3;
    UIImageView *testImageView4;
    UIImageView *testImageView5;
    UIImageView *testImageView6;
    UIImageView *testImageView7;
    UIImageView *testImageView8;
    UIImageView *testImageView9;
    NSMutableArray *pointArray;
    UIImageView *temp;
    UIImageView *temp2;
    UIImageView *redimage;
    NSArray *points;
}
- (NSString*)getKey;
- (void)setTarget:(id)target withAction:(SEL)action;
@property(nonatomic ,strong)NSString *isScreenType;
@property(nonatomic) BOOL IsPatterOldPassword;
@property(nonatomic) BOOL isFirstTimePatterPassword;
@property(nonatomic, strong) UIImageView *imageView;

@end
