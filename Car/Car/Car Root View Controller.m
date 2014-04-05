//
//  Car Root View Controller.m
//  Car
//
//  Created by Jeff King on 4/1/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "Car Root View Controller.h"

#import "Tire.h"
#import "CARWindow.h"
#import "ignition.h"
#import "gaspedal.h"
#import "Brake.h"
#import "Carwheel.h"


@interface Car_Root_View_Controller ()

@end

@implementation Car_Root_View_Controller

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
    // Do any additional setup after loading the view.
 
    Tire *radial1 = [[Tire alloc] init];
    radial1.frame = CGRectMake (200,200, 40, 40);
    radial1.tirePresure = 20;
    [self.view addSubview:radial1];
    
    Tire *radial2 = [[Tire alloc] init];
    radial2.frame = CGRectMake (150,200, 40, 40);
    radial2.tirePresure = 20;
    [self.view addSubview:radial2];
    
    Tire *radial3 = [[Tire alloc] init];
    radial3.frame = CGRectMake (100,200, 40, 40);
    radial3.tirePresure = 20;
    [self.view addSubview:radial3];
    
    Tire *radial4 = [[Tire alloc] init];
    radial4.frame = CGRectMake (50,200, 40, 40);
    radial4.tirePresure = 20;
    [self.view addSubview:radial4];
    
    CARWindow *bluetint = [[CARWindow alloc] init];
    bluetint.color = [UIColor blueColor];
    [self.view addSubview:bluetint];

    ignition *electric = [[ignition alloc] init];
    electric.frame = CGRectMake(100, 300, 100, 100);
    [electric setTitle:@"Start" forState:UIControlStateNormal];
    [electric addTarget:(self) action:@selector (turnIgnition) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:electric];
    
    Brake *disc = [[Brake alloc] init];
    disc.frame = CGRectMake(250, 300, 40, 60);
    disc.color = [UIColor blueColor];
    [self.view addSubview:disc];
    
    CARWindow  *winsheild = [[CARWindow alloc] init];
    winsheild.frame = CGRectMake(100, 100, 250, 150);
    [self.view addSubview:winsheild];
    
    
     
     
     }

-(void)turnIgnition {
    
    
    NSLog(@"turn Ignition");
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
