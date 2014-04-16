//
//  MMAStage.m
//  DrawLinesApp
//
//  Created by Jeff King on 4/15/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "MMAStageLines.h"

@implementation MMAStageLines

NSMutableArray * lines;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
        lines =[@[] mutableCopy];
       // self.backgroundColor = [UIColor whiteColor];
                                
    }
    
    return self;

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
 
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextClearRect (context, rect);
    [[UIColor whiteColor] set];
    
    CGContextSetLineWidth(context, 3.0);
    CGContextSetLineCap(context, kCGLineCapRound);
 
    NSLog(@"%@",lines);
    
    for (NSArray * line in lines)
    {
       // [[UIColor whiteColor]]
        CGPoint start = [line[0] CGPointValue];
        CGPoint end = [line[1] CGPointValue];
   
    
        CGContextMoveToPoint(context, start.x,start.y);
        CGContextAddLineToPoint(context,end.x,end.y);
        
        CGContextStrokePath(context);
    }

}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{

for (UITouch * touch in touches)

    {

        
    CGPoint location = [touch locationInView:self];
// UIBezierPath * path = [[UIBezierPath alloc] init];
// [path addLineToPoint:location];
// [self addSubview:path];

        
        [lines addObject:[@[
    
                   [NSValue valueWithCGPoint:location],

                   [NSValue valueWithCGPoint:location]
                   ] mutableCopy]];

        
        NSLog(@"Touch X %f Y %f" ,location.x,location.y);
        
    }
    
    [self setNeedsDisplay];

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
    
{
    
    for (UITouch * touch in touches)
    {    CGPoint location = [touch locationInView:self];


    [lines lastObject][1] = [NSValue valueWithCGPoint:location];

    }
    
    [self setNeedsDisplay];
}

    
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    for (UITouch * touch in touches)
    {    CGPoint location = [touch locationInView:self];
        
        
        [lines lastObject][1] = [NSValue valueWithCGPoint:location];
        
    }
    
    
    [self setNeedsDisplay];

}

@end
