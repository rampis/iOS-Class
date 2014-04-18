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
   // NSMutableArray* self.lines;
}

- (id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.lines = [@[] mutableCopy];
        self.lineWidth = 2.0;
        self.lineColor = [UIColor blackColor];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)clearStage
{
    [self.lines removeAllObjects];
    [self setNeedsDisplay];

}

//Only override drawRect: if you perform custom drawing.

-(void)undoStage
{
    [self.lines removeLastObject];
    [self setNeedsDisplay];
}
 - (void)drawRect:(CGRect)rect
{
    // Drawing code

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap (context, kCGLineCapRound);
//    CGContextMoveToPoint(context, 50, 50);
//    CGContextAddCurveToPoint(context, 270, 50, 270, 400, 50, 400);
//    CGContextStrokePath(context);
    
    
    
    for (NSDictionary * line in self.lines)
    {
        CGContextSetLineWidth(context, [line[@"width"] floatValue]);
        [(UIColor *)line[@"color"] set];
        
        NSArray * points = line[@"points"];
        
        CGPoint start = [points[0] CGPointValue];
        CGContextMoveToPoint(context, start.x, start.y);
       
        for (NSValue * value in points)
        {
            CGPoint point = [value CGPointValue];
            CGContextAddLineToPoint (context, point.x, point.y);
        }
        ///CGContextStrokePath(context);
    }
CGContextStrokePath(context);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
for (UITouch * touch in touches)
{
CGPoint location = [touch locationInView:self];

   // [self.lines addObject:[@[ [NSValue valueWithCGPoint:location]]mutableCopy]];
    
    [self.lines addObject:[@{
                             @"color": self.lineColor,
                             @"width": @(self.lineWidth),
                             @"points" : [@[[NSValue valueWithCGPoint:location]] mutableCopy]
                             } mutableCopy]];
                          
}
    
    
  
[self setNeedsDisplay];

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouch:touches];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouch:touches];
         
}

-(void)doTouch:(NSSet* )touches
{
    UITouch* touch = [touches allObjects][0];
    
    CGPoint location = [touch locationInView:self];
    [[self.lines lastObject][@"points"]addObject: [NSValue valueWithCGPoint:location]];
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
