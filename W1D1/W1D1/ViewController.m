//
//  ViewController.m
//  W1D1
//
//  Created by Jeff King on 3/31/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
    
}
- (IBAction)Button1:(id)sender {
self.Label.text = @"B1";
}
- (IBAction)Button2:(id)sender {
 self.Label2.text = self.field.text;

}

- (IBAction)Button3:(id)sender {
//self.Label3.textColor = [UIColorblueColor];
    
}

@end
