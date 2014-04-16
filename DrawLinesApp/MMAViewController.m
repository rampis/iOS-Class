//
//  MMAViewController.m
//  DrawLinesApp
//
//  Created by Jeff King on 4/15/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "MMAViewController.h"
#import "MMAStageLines.h"
#import "MMAStageScribble.h"

@implementation MMAViewController
{
    MMAStageScribble * scribbleview;
    UIView *colorDrawer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    
       // self.view = [[MMAStageLines alloc]initWithFrame:self.view.frame];
//        self.view = [[MMAStageScribble alloc] initWithFrame:self.view.frame];
    
    }
    return self;


    ////    Choose scribbles or lines
    ////1.  add properties to UIView,
    ////2.  int =line width,
    ////3.  line color, in viewcontroller
    ////4.   ad subview and slider control,
    ////5.   and three UI Buttons,
    ////6.   slider should change width line change color on uiview.
    ////7.   run set needs display
    ////     need to change self

}
//need color buttons here
//-(void)colorButtonClicked:(id)sender

//NSLog(@)

//need to add line to update scribble
//[self.view setLineColor:sender.backgroundColor];


- (void)viewDidLoad
{
    [super viewDidLoad];
    scribbleview =  [[MMAStageScribble alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:scribbleview];
    
    // Do any additional setup after loading the view.

    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 43,200,23)];
    
    
    slider.minimumValue = 2.0;
    slider.maximumValue = 20.0;
    
    [slider addTarget:self action:@selector(changeSize:) forControlEvents:UIControlEventAllEvents];
    
    [self.view addSubview:slider];


    colorDrawer = [[UIView alloc] initWithFrame:CGRectMake (0, 0, SCREEN_WIDTH, 40)];

    NSArray * colors = @[
                         [UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f],
                         [UIColor colorWithRed:0.008f green:0.353f blue:0.431f alpha:1.0f],
                         [UIColor colorWithRed:0.016f green:0.604f blue:0.671f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.988f blue:0.910f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.298f blue:0.153f alpha:1.0f]
                         ];
    
    float buttonWidth = SCREEN_WIDTH /[colors count];
    
    for (UIColor * color in colors)
    {
         int index = [colors indexOfObject:color];
         
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth * index, 0, buttonWidth, 40)];
    button.backgroundColor = color;
    [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
      
    [colorDrawer addSubview:button];
    }
    
        [self.view addSubview:colorDrawer];
    
}

-(void)changeSize:(UISlider *)sender
{
   scribbleview.lineWidth = sender.value;
}
-(void)changeColor:(UIButton *)sender
{
    scribbleview.lineColor = sender.backgroundColor;
}
    
//-(void)changeSize:(UISlider *)sender
   // scribbleView.lineWidth - sender.value];
    


-(BOOL)prefersStatusBarHidden { return YES;}
    
@end
