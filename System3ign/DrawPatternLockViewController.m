//DrawPatternLockview controller.m file
#import "DrawPatternLockViewController.h"
#import "DrawPatternLockView.h"
#import "Product.h"
#define MATRIX_SIZE 3


@implementation DrawPatternLockViewController

@synthesize imageView;

@synthesize isScreenType, IsPatterOldPassword,isFirstTimePatterPassword;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
}

#pragma mark - View lifecycle

- (void)loadView {
    [super loadView];
    //darwpatternlockview alloc
    self.view = [[DrawPatternLockView alloc] init];
    
}

//Password mismatch this class call
-(void)test:(NSMutableArray*)arr{
    DrawPatternLockView *v1 = (DrawPatternLockView*)self.view;
    [v1 clearDotViews];
    
    NSLog(@"test called");
    points = [NSArray arrayWithObjects:testImageView1, testImageView4, testImageView7, testImageView2, testImageView5, testImageView8, testImageView3, testImageView6, testImageView9, nil];
    for (int i=0; i<[arr count]; i++) {
        int x = [[arr objectAtIndex:i] intValue] - 1;
        NSLog(@"test for ..%d", x);
        [(UIImageView*)[points objectAtIndex:x] setHighlightedImage:[UIImage imageNamed:@"red.png"]];
        
        redimage = (UIImageView*)[points objectAtIndex:x]; 
        
        CGPoint p = redimage.center;
        DrawPatternLockView *v = (DrawPatternLockView*)self.view;
        v.colorImage = @"red_stroke.png";
        [v addDotView:redimage];
        
        if (i!=0) {
            [v drawLineFromLastDotTo:p];
            
        }
        
    }
    //clear dots and line mettod call for delay2 seconds
    [self performSelector:@selector(lastdot) withObject:nil afterDelay:2.0];
    
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    NSLog(@"Screen Type=%@",isScreenType);
    
    //Uilabel
    label =[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 320, 35)];
   
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [label setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:label];
    label.font = [UIFont systemFontOfSize:12.0f];
      if ([isScreenType isEqualToString:@"accountinfo"]) {
          isFirstTimePatterPassword=YES;
      }else {
          isFirstTimePatterPassword=NO;
          IsPatterOldPassword=YES;
      }
//    if ([isScreenType isEqualToString:@"accountinfo"]) {
////        label.text = @"Please enter your current password ";      
//    }else if([isScreenType isEqualToString:@"signup"]){
//         label.text = @"Enter Your Password";
//        if (isFirstTimePatterPassword) {
//            label.text = @"ReEnter Your Password and Continue";
//        }
//    }else if([isScreenType isEqualToString:@"productdetail"]) {
//        label.text = @"Enter your Password";
//    }
    //nsarray alloc
    pointArray =[[NSMutableArray alloc]init];
    
    UIImage *butnimage = [UIImage imageNamed:@"Cancel1.png"];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(4, 1,40,40)];
   
//    [btn setTitle:@"Cancel" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(4, 5,35,35);
//    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:butnimage forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor clearColor];
    
    btn.highlighted = YES;
    [self.view addSubview:btn];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pwd_bg.png"]];
    
    
    // pattern dot image add initially and highlighted image set for all dot image or pattern
    for (int i=0; i<MATRIX_SIZE; i++) {
        for (int j=0; j<MATRIX_SIZE; j++) {
            
            dotImage =[UIImage imageNamed:@"Dot1.png"];
            if ((i==0&&j==0)) {
                
                testImageView1 = [[UIImageView alloc] initWithImage:dotImage
                                                   highlightedImage:[UIImage imageNamed:@"green.png"]];
                testImageView1.frame = CGRectMake(0, 0, dotImage.size.width, dotImage.size.height);
                testImageView1.userInteractionEnabled = YES;
                testImageView1.tag = j*MATRIX_SIZE + i + 1;
                [self.view addSubview:testImageView1];
                
            }else if ((i==0&&j==1)) {
                
                testImageView2 = [[UIImageView alloc] initWithImage:dotImage
                                                   highlightedImage:[UIImage imageNamed:@"green.png"]];
                testImageView2.frame = CGRectMake(0, 0, dotImage.size.width, dotImage.size.height);
                testImageView2.userInteractionEnabled = YES;
                testImageView2.tag = j*MATRIX_SIZE + i + 1;
                [self.view addSubview:testImageView2];
                
            }else if ((i==0&&j==2)){
                
                testImageView3= [[UIImageView alloc] initWithImage:dotImage
                                                  highlightedImage:[UIImage imageNamed:@"green.png"]];
                testImageView3.frame = CGRectMake(0, 0, dotImage.size.width, dotImage.size.height);
                testImageView3.userInteractionEnabled = YES;
                testImageView3.tag = j*MATRIX_SIZE + i + 1;
                [self.view addSubview:testImageView3];
                
            }else if ((i==1&&j==0)){
                
                testImageView4= [[UIImageView alloc] initWithImage:dotImage
                                                  highlightedImage:[UIImage imageNamed:@"green.png"]];
                testImageView4.frame = CGRectMake(0, 0, dotImage.size.width, dotImage.size.height);
                testImageView4.userInteractionEnabled = YES;
                testImageView4.tag = j*MATRIX_SIZE + i + 1;
                [self.view addSubview:testImageView4];
                
            }else if ((i==1&&j==1)){
                
                testImageView5= [[UIImageView alloc] initWithImage:dotImage
                                                  highlightedImage:[UIImage imageNamed:@"green.png"]];
                testImageView5.frame = CGRectMake(0, 0, dotImage.size.width, dotImage.size.height);
                testImageView5.userInteractionEnabled = YES;
                testImageView5.tag = j*MATRIX_SIZE + i + 1;
                [self.view addSubview:testImageView5];
                
            }else if ((i==1&&j==2)){
                
                testImageView6= [[UIImageView alloc] initWithImage:dotImage
                                                  highlightedImage:[UIImage imageNamed:@"green.png"]];
                testImageView6.frame = CGRectMake(0, 0, dotImage.size.width, dotImage.size.height);
                testImageView6.userInteractionEnabled = YES;
                testImageView6.tag = j*MATRIX_SIZE + i + 1;
                [self.view addSubview:testImageView6];
                
            }else if ((i==2&&j==0)){
                
                testImageView7= [[UIImageView alloc] initWithImage:dotImage
                                                  highlightedImage:[UIImage imageNamed:@"green.png"]];
                testImageView7.frame = CGRectMake(0, 0, dotImage.size.width, dotImage.size.height);
                testImageView7.userInteractionEnabled = YES;
                testImageView7.tag = j*MATRIX_SIZE + i + 1;
                [self.view addSubview:testImageView7];
                
            }else if ((i==2&&j==1)){
                
                testImageView8= [[UIImageView alloc] initWithImage:dotImage
                                                  highlightedImage:[UIImage imageNamed:@"green.png"]];
                testImageView8.frame = CGRectMake(0, 0, dotImage.size.width, dotImage.size.height);
                testImageView8.userInteractionEnabled = YES;
                testImageView8.tag = j*MATRIX_SIZE + i + 1;
                [self.view addSubview:testImageView8];
                
            }else if ((i==2&&j==2)){
                
                testImageView9= [[UIImageView alloc] initWithImage:dotImage
                                                  highlightedImage:[UIImage imageNamed:@"green.png"]];
                testImageView9.frame = CGRectMake(0, 0, dotImage.size.width, dotImage.size.height);
                testImageView9.userInteractionEnabled = YES;
                testImageView9.tag = j*MATRIX_SIZE + i + 1;
                [self.view addSubview:testImageView9];
                
            }
        }
    }
    
}


-(void)viewDidAppear:(BOOL)animated{
    if ([isScreenType isEqualToString:@"accountinfo"]){
    }else if(isFirstTimePatterPassword){
        
        UIAlertView *alert =  [[UIAlertView alloc]initWithTitle:@"3ign" message:@"Enter your password" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }else if([isScreenType isEqualToString:@"cardlist"]){
    }
    
}
-(void)cancel{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)pushMe{
    
    UINavigationController *mainNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MainNavController"];
    mainNavController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:mainNavController
                            animated:YES];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    
}

- (void)viewWillLayoutSubviews {
    
    
    int w = self.view.frame.size.width/3;
    int h = self.view.frame.size.height/6;
    
    int i=0;
    for (UIView *view in self.view.subviews)
        if ([view isKindOfClass:[UIImageView class]]) {
            int x = w*(i/MATRIX_SIZE) + w/2;
            int y = h*(i%MATRIX_SIZE) + h/.5;
            
            view.center = CGPointMake(x, y);
            i++;
        }
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
    
}

//touch began method
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    DrawPatternLockView *v1 = (DrawPatternLockView*)self.view;
    [v1 clearDotViews];
    
    _paths = [[NSMutableArray alloc] init];
    CGPoint pt = [[touches anyObject] locationInView:self.view];
    UIView *touched = [self.view hitTest:pt withEvent:event];
    temp = (UIImageView*)touched;
    DrawPatternLockView *v = (DrawPatternLockView*)self.view;
    
    
    [v drawLineFromLastDotTo:pt];
    NSLog(@"point -->%f, %f", pt.x, pt.y);
    
    if (touched!=self.view) {
        
        
        BOOL found = NO;
        for (NSNumber *tag in _paths) {
            found = tag.integerValue==touched.tag;
            if (found)
                break;
        }
        
        if (found)
            return;
        
        [_paths addObject:[NSNumber numberWithInt:touched.tag]];
        NSLog(@"touched -->%@", touched);
        [v addDotView:touched];
        
        UIImageView* iv = (UIImageView*)touched;
        iv.highlighted = YES;
    }
    
    
}

//touched moved method and highlighted image call  

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGPoint pt = [[touches anyObject] locationInView:self.view];
    UIView *touched = [self.view hitTest:pt withEvent:event];
    
    DrawPatternLockView *v = (DrawPatternLockView*)self.view;
    
    [v drawLineFromLastDotTo:pt];
    
    if (touched!=self.view) {
        
        BOOL found = NO;
        for (NSNumber *tag in _paths) {
            found = tag.integerValue==touched.tag;
            NSLog(@"found value=%d",found);
            if (found)
                
                break;
        }
        
        if (found)
            return;
        
        [_paths addObject:[NSNumber numberWithInt:touched.tag]];
        
        [v addDotView:touched];
        [self upDateImage:_paths];
        NSLog(@"paths -------->%@", _paths);
        temp2 = (UIImageView*)touched;
        temp2.highlighted = YES;
        temp = (UIImageView*)touched;
        
    }
    
}

//touche end method
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    DrawPatternLockView *v = (DrawPatternLockView*)self.view;
    
    [v clearDotViews];
    
    
    [self checkPassword];
}

-(void)lastdot{
    DrawPatternLockView *v = (DrawPatternLockView*)self.view;
    v.colorImage = nil;
    
    [(UIImageView*)[points objectAtIndex:0] setHighlightedImage:[UIImage imageNamed:@"green.png"]];
    [(UIImageView*)[points objectAtIndex:1] setHighlightedImage:[UIImage imageNamed:@"green.png"]];
    [(UIImageView*)[points objectAtIndex:2] setHighlightedImage:[UIImage imageNamed:@"green.png"]];       
    [(UIImageView*)[points objectAtIndex:3] setHighlightedImage:[UIImage imageNamed:@"green.png"]];
    [(UIImageView*)[points objectAtIndex:4] setHighlightedImage:[UIImage imageNamed:@"green.png"]];
    [(UIImageView*)[points objectAtIndex:5] setHighlightedImage:[UIImage imageNamed:@"green.png"]];
    [(UIImageView*)[points objectAtIndex:6] setHighlightedImage:[UIImage imageNamed:@"green.png"]];
    [(UIImageView*)[points objectAtIndex:7] setHighlightedImage:[UIImage imageNamed:@"green.png"]];
    [(UIImageView*)[points objectAtIndex:8] setHighlightedImage:[UIImage imageNamed:@"green.png"]];
    for (UIView *view in self.view.subviews){
        
        if([view isKindOfClass:[UIImageView class]]){
            UIImageView *imgV = (UIImageView*)view;
            
            [(UIImageView*)view setHighlighted:NO];
            NSLog(@"imageview point -->%f, %f", imgV.center.x, imgV.center.y);
        }
    }
    [self.view setNeedsDisplay];
    
    
    if (_target && _action)
        NSLog(@"target action=%@",_target);


   

    [_target performSelector:_action withObject:[self getKey]];
    
    
}


-(void)checkPassword{
    NSString *dataString = [self getKey];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSLog(@"my pwd  %@",[defaults  valueForKey:@"oldPassword"]);
    
    NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:[dataString length]];
    for (int i = 0; i < [dataString length]; i++) {
        NSString *singleCharacter  = [NSString stringWithFormat:@"%c", [dataString characterAtIndex:i]];
        [characters addObject:singleCharacter];
    }
    NSLog(@"IsPatterOldPassword=%d",IsPatterOldPassword?YES:NO);
    NSLog(@"IsPatternpassword1st=%d",isFirstTimePatterPassword?YES:NO);
if (isFirstTimePatterPassword) {
    if ([[defaults  valueForKey:@"oldPassword"] isEqualToString:dataString]) {
        NSLog(@"pass");
           NSLog(@" account info screen");
        [self performSelector:@selector(lastdot) withObject:nil afterDelay:2.0];
    }else{
        NSLog(@"Passwor not correct call test method");
        [self test:characters];
    }
}else if(IsPatterOldPassword){ 
    if([[defaults  valueForKey:@"oldPassword"] isEqualToString:dataString]) {
    NSLog(@"not account info screen");
    [self performSelector:@selector(lastdot) withObject:nil afterDelay:2.0];
}else{
    NSLog(@"Passwor not correct call test method");
    [self test:characters];
}
}
}

- (NSString*)getKey{
    NSMutableString *firstvalue;
    firstvalue = [NSMutableString string];
    
    NSMutableString *secondvalue;
    secondvalue = [NSMutableString string];
    
    NSMutableString *key;
    key=[NSMutableString string];
    
    for (NSNumber *tag in _paths) {
        [key appendFormat:@"%d", tag.integerValue];
        
        
    }
    
    
    return key;
}


- (void)setTarget:(id)target withAction:(SEL)action {
    _target = target;
    _action = action;
}
-(void)dealloc{
    
    redimage=nil;
    self.imageView =nil;
}

-(void)updateImage:(int)startingPoint andEndingPoint:(int)endingPoint{
    
    NSLog(@"startingPoint=%d\nend= %d",startingPoint,endingPoint);
    
    if ((startingPoint ==1  && endingPoint==2) || (startingPoint ==2  && endingPoint==3) || (startingPoint ==4  && endingPoint==5) || (startingPoint ==5  && endingPoint==6) || (startingPoint ==7  && endingPoint==8) || (startingPoint ==8  && endingPoint==9)|| (startingPoint ==1  && endingPoint==3) || (startingPoint ==4  && endingPoint==6)|| (startingPoint ==7  && endingPoint==9)) {
        NSLog(@"Right Image apply");
        [temp setHighlightedImage:[UIImage imageNamed:@"green1.png"]];
        temp.highlighted = YES;
    }else if ((startingPoint ==1  && endingPoint==4) || (startingPoint ==4  && endingPoint==7) || (startingPoint ==1  && endingPoint==7) || (startingPoint ==2  && endingPoint==5) || (startingPoint ==5  && endingPoint==8) || (startingPoint ==2  && endingPoint==8)|| (startingPoint ==3  && endingPoint==6) || (startingPoint ==6  && endingPoint==9)|| (startingPoint ==3  && endingPoint==9)) {
        NSLog(@"down Image apply");
        [temp setHighlightedImage:[UIImage imageNamed:@"green2.png"]];
        temp.highlighted = YES;
    }else if ((startingPoint ==2  && endingPoint==1) || (startingPoint ==3  && endingPoint==2) || (startingPoint ==3  && endingPoint==1) || (startingPoint ==5  && endingPoint==4) || (startingPoint ==6  && endingPoint==5) || (startingPoint ==6  && endingPoint==4)|| (startingPoint ==8  && endingPoint==7)|| (startingPoint ==7  && endingPoint==9)|| (startingPoint ==9  && endingPoint==8)) {
        NSLog(@"Left Image apply");
        [temp setHighlightedImage:[UIImage imageNamed:@"green3.png"]];
        temp.highlighted = YES;
    }else if ((startingPoint ==4  && endingPoint==1) || (startingPoint ==7  && endingPoint==4) || (startingPoint ==7  && endingPoint==1) || (startingPoint ==5  && endingPoint==2) || (startingPoint ==8  && endingPoint==5) || (startingPoint ==8  && endingPoint==2) || (startingPoint ==6  && endingPoint==3) || (startingPoint ==9  && endingPoint==3)|| (startingPoint ==9  && endingPoint==6)) {
        NSLog(@"Up  Image apply");
        [temp setHighlightedImage:[UIImage imageNamed:@"green4.png"]];
        temp.highlighted = YES;
    }else if ((startingPoint ==4  && endingPoint==2) || (startingPoint ==4  && endingPoint==3) || (startingPoint ==7  && endingPoint==5) || (startingPoint ==7  && endingPoint==3) || (startingPoint ==5  && endingPoint==3) || (startingPoint ==7  && endingPoint==6)|| (startingPoint ==7  && endingPoint==2)|| (startingPoint ==8  && endingPoint==3) || (startingPoint ==8  && endingPoint==6)) {
        NSLog(@"Right UP Image apply");
        [temp setHighlightedImage:[UIImage imageNamed:@"green5.png"]];
        temp.highlighted = YES;
    }else if ((startingPoint == 1  && endingPoint==5) || (startingPoint ==1  && endingPoint==6) || (startingPoint ==1  && endingPoint==8) || (startingPoint ==1  && endingPoint==9) || (startingPoint ==2  && endingPoint==6) || (startingPoint ==2  && endingPoint==9) || (startingPoint ==4  && endingPoint==9) || (startingPoint ==4  && endingPoint==8)|| (startingPoint ==5  && endingPoint==9)) {
        NSLog(@"Right Down Image apply");
        [temp setHighlightedImage:[UIImage imageNamed:@"green6.png"]];
        temp.highlighted = YES;
    }else if((startingPoint == 2  && endingPoint==4) || (startingPoint ==2  && endingPoint==7) || (startingPoint ==3  && endingPoint==5) || (startingPoint ==3  && endingPoint==8) || (startingPoint ==6  && endingPoint==8) || (startingPoint ==6  && endingPoint==7)|| (startingPoint ==3  && endingPoint==7)|| (startingPoint ==3  && endingPoint==4)|| (startingPoint ==5  && endingPoint==7)) {
        NSLog(@"Left Down Image apply");
        [temp setHighlightedImage:[UIImage imageNamed:@"green7.png"]];
        temp.highlighted = YES;
    }else if((startingPoint == 5  && endingPoint==1) || (startingPoint ==6  && endingPoint==1) || (startingPoint ==6  && endingPoint==2) || (startingPoint ==8  && endingPoint==1) || (startingPoint ==8  && endingPoint==4) || (startingPoint ==9  && endingPoint==5)|| (startingPoint ==9  && endingPoint==2)|| (startingPoint ==9  && endingPoint==1)) {
        NSLog(@"Left Up Image apply");
        [temp setHighlightedImage:[UIImage imageNamed:@"green8.png"]];
        temp.highlighted = YES;
    }
}


-(void)upDateImage:(NSMutableArray*)imagePath {
    if (imagePath) {
        if ([imagePath count]>1) {
            
            for (int i=0; i<[imagePath count]-1;i++) {
                [self updateImage:[[imagePath objectAtIndex:i] intValue] andEndingPoint:[[imagePath objectAtIndex:i+1] intValue]];
            }
            
        }
    }
    
}
@end