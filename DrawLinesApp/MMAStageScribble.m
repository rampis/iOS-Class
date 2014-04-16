//
//  MMAStageScribble.m
//  DrawLinesApp
//
//  Created by Jeff King on 4/15/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "MMAStageScribble.h"

@implementation MMAStageScribble

{
    NSMutableArray * scribbles;

}
- (id)initWithFrame:(CGRect)frame;

{
    self = [super initWithFrame:frame];
    if (self)
    {
        scribbles = [@[] mutableCopy];
        self.lineWidth = 2.0;

        self.lineColor = [UIColor blackColor];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

 
 - (void)drawRect:(CGRect)rect
{
    // Drawing code

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap (context, kCGLineCapRound);
    
    for (NSDictionary * scribble in scribbles)
    {
        CGContextSetLineWidth(context, [scribble[@"width"] floatValue]);
        [(UIColor *)scribble[@"color"] set];
        
        NSArray * points = scribble[@"points"];
        
        CGPoint start = [points[0] CGPointValue];
        
        CGContextMoveToPoint (context,start.x, start.y);
        
        for (NSValue * value in points)
        {
          //  int index = [scribble indexOfObject:value];
        
           // CGContextMoveToPoint(context, start.x, start.y);
            CGPoint point = [value CGPointValue];
        
            
           // if (index > 0)
            
            CGContextAddLineToPoint (context, point.x, point.y);
        }
    CGContextStrokePath(context);
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
for (UITouch * touch in touches)
{
CGPoint location = [touch locationInView:self];

   // [scribbles addObject:[@[ [NSValue valueWithCGPoint:location]]mutableCopy]];
    
    [scribbles addObject:[@{
                             @"color": self.lineColor,
                             @"width": @(self.lineWidth),
                             @"points" : [@[[NSValue valueWithCGPoint:location]] mutableCopy]
                             } mutableCopy]];
                          
    }
    
    
   // [NSValue valuewithCGPoint:location]
                      
     //                 [mutableCopy]];
 


[self setNeedsDisplay];

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

for (UITouch * touch in touches)

{
        CGPoint location = [touch locationInView:self];
        
        [[scribbles lastObject][@"points"]addObject: [NSValue valueWithCGPoint:location]];
    }
    

    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{


    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        [[scribbles lastObject][@"points"]addObject: [NSValue valueWithCGPoint:location]];
        
    }
    [self setNeedsDisplay];
         
 }

-(void)setlineWidth: (float) alineWidth
{
    _lineWidth = alineWidth;
    
    [self setNeedsDisplay];
}

-(void)setLineColor:(UIColor*)alineColor
{
    _lineColor = alineColor;


    [self setNeedsDisplay];
}

@end
