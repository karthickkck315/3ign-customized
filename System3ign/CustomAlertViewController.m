//
//  CustomAlertViewController.m
//  System3ign
//
//  Created by shri@ideazglobal.com on 01/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CustomAlertViewController.h"

@interface CustomAlertViewController ()

@end

@implementation CustomAlertViewController
@synthesize titleLable;
@synthesize titleText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{

    titleLable.text=titleText;
    
}


- (void)viewDidUnload
{
    [self setTitleLable:nil];
    [self setTitleText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)closeAlert:(id)sender {
    
    
    [self.view removeFromSuperview];
    
    
}
@end
