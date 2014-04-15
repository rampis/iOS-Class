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
    
        self.view.backgroundColor = [UIColor yellowColor];
        
        UIView *box = [[UIView alloc] initWithFrame:CGRectMake(20, 10, 100, 100)];
        
        box.backgroundColor = [UIColor blueColor];
        
//        [self.view addSubview:box];
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
