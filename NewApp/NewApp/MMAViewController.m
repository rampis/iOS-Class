//
//  MMAViewController.m
//  NewApp
//
//  Created by Jeff King on 4/14/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "MMAViewController.h"

@interface MMAViewController ()

@end

@implementation MMAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
// Custom initialization
    
        self.view.backgroundColor = [UIColor redColor];
        
        UIView *box = [[UIView alloc] initWithFrame:CGRectMake(20, 10, 100, 100)];
        
        box.backgroundColor = [UIColor blueColor];
        
//[self.view addSubview:box];

            }
    
    return self;
}

- (void)viewDidLoad

{
    
//////////////
/////////////
//////////////
    
    [super viewDidLoad];

// Do any additional setup after loading the view.
/////////////
/////////
////////

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    
// Dispose of any resources that can be recreated.
}




//button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//[button addTarget:self
//action:@selector(aMethod:)
//forControlEvents:UIControlEventTouchDown];
//[button setTitle:@"Show View" forState:UIControlStateNormal];
//button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
//[view addSubview:button];


//buttonName.titleLabel.font = [UIFont fontWithName:@"LuzSans-Book" size:15];
//buttonName.tintColor = [UIColor purpleColor];
//[buttonName setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal]












@end
