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
    MMAStageScribble * scribbleView;
    UIView *colorDrawer;
    
    
    float lineWidth;
    UIColor *lineColor;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {   // Custom initialization
        
            }
    return self;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    lineColor = [UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f];
    lineWidth = 5.0;
    
       [self toggleStage];
    
    [self.view addSubview:scribbleView];
    
    //
    // Slider
    //
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 43,200,23)];
    slider.minimumValue = 2.0;
    slider.maximumValue = 20.0;
    slider.value = lineWidth;
    ///
    ///Jo Code here
    ///
    ///slider.transform = CGAffineTransformMakeRotation(-90 * M_PI / 180);
    ///slider.frame = CGRectMake(SCREEN_WIDTH - 43, SCREEN_HEIGHT - 300, 23, 280);
    ///
    ///End Jo code
    ///
    
    [slider addTarget:self action:@selector(changeSize:) forControlEvents:UIControlEventAllEvents];
    [self.view addSubview:slider];
    
    //
    // Color drawer with color buttons
    //
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
        //cast NSUInteger object to a primitive type integer
        int index = (int)[colors indexOfObject:color];
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth*
                                                                       index, 0,buttonWidth, 40)];
        button.backgroundColor = color;
        ///
        ///set round in here UIButton Layer.corner radius
        ///
        [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
        
        [colorDrawer addSubview:button];
    }
    
    [self.view addSubview:colorDrawer];
    
    //
    // Toggle stage button
    //
    UIButton* toggleButton = [[UIButton alloc] initWithFrame:CGRectMake(10,50,50,50)];
    toggleButton.backgroundColor = [UIColor orangeColor];
    [toggleButton addTarget:self action:@selector(toggleStage) forControlEvents:
     UIControlEventTouchUpInside];
    [self.view addSubview:toggleButton];
    
    //
    // Clear stage button
    //
    UIButton* clearButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-120,50,50,50)];
    clearButton.backgroundColor = [UIColor redColor];
    [clearButton addTarget:self action:@selector(clearStage) forControlEvents:
     UIControlEventTouchUpInside];
    [self.view addSubview:clearButton];
    
    //
    // Undo button
    //
    UIButton* undoButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60,50,50,50)];
    undoButton.backgroundColor = [UIColor orangeColor];
    [undoButton addTarget:self action:@selector(undoStage) forControlEvents:
     UIControlEventTouchUpInside];
    [self.view addSubview:undoButton];
}

-(void)undoStage
{
    [scribbleView undoStage];
}

-(void)clearStage
{
    [scribbleView clearStage];
}

-(void)toggleStage
{
    NSMutableArray * lines =  scribbleView.lines;
    
    
    
    [scribbleView removeFromSuperview];
    
    if ([scribbleView isMemberOfClass:[MMAStageLines class]])
    {
        scribbleView = [[MMAStageScribble alloc]initWithFrame:self.view.frame];
    } else {
           
        scribbleView = [[MMAStageLines alloc]initWithFrame:self.view.frame];
    }
    scribbleView.lineWidth = lineWidth;
    scribbleView.lineColor = lineColor;
    
    if(lines != nil) scribbleView.lines = lines;
   
    
    [self.view insertSubview:scribbleView atIndex:0];
}

-(void)changeSize:(UISlider *)sender
{
    lineWidth = sender.value;
    scribbleView.lineWidth = lineWidth;
}
-(void)changeColor:(UIButton*)sender
{
    //
    // could put two in one line, see below
    // lineColor = sender.backgroundColor;
    scribbleView.lineColor = lineColor = sender.backgroundColor;
}

-(BOOL)prefersStatusBarHidden { return YES;}

@end
