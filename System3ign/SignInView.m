//
//  SignInView.m
//  System3ign
//
//  Created by shri@ideazglobal.com on 20/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SignInView.h"

#import "SignInViewController.h"
@implementation SignInView
@synthesize check;
@synthesize closeButton;
@synthesize signInButton;
@synthesize forgotpassword;
@synthesize usernametext;
@synthesize passwordTxt;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSLog(@"init with frame");
        
           }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{




    if ((self = [super initWithCoder:aDecoder])) {
        
        NSLog(@"init with code");
        
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyBoard)];
        tap.cancelsTouchesInView=NO;
        
        [self addGestureRecognizer:tap];

        
       // [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil];
       // [self addSubview:self.toplevelSubView];
    }
    return self;}


-(void)dismissKeyBoard{
    
   // NSLog(@"miss called");
    [usernametext resignFirstResponder];
    [passwordTxt resignFirstResponder];
        
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
