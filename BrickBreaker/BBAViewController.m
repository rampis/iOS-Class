//
//  BBAViewController.m
//  BrickBreaker
//
//  Created by Jeff King on 4/17/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "BBAViewController.h"
#import "BBALevelController.h"

@interface BBAViewController ()

{
    BBALevelController * level;
    UIButton * toggleButton;
    
}


@end

@implementation BBAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        level = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
        
        [self.view addSubview:level.view];
        ////
        ///Work on Button size here
        ///
        toggleButton = [[UIButton alloc] initWithFrame:CGRectMake(200,140,180,80)];
        toggleButton.layer.cornerRadius = 30;
        [toggleButton setTitle:@"START" forState:UIControlStateNormal];
        
        toggleButton.backgroundColor = [UIColor blackColor];
        [toggleButton addTarget:self action:@selector(resetLevel) forControlEvents:
         UIControlEventTouchUpInside];
        
        [self.view addSubview:toggleButton];
        
       
        
    }
    
    return self;
}

- (void)viewDidLoad
{
        [super viewDidLoad];
// Do any additional setup after loading the view.
    
    }

//Create the Label Here
-(void)resetLevel
{
    
        [toggleButton removeFromSuperview];
        [level resetLevel];

}

- (void)didReceiveMemoryWarning
{
        [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
