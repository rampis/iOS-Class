//
//  MMAStage.m
//  DrawLinesApp
//
//  Created by Jeff King on 4/15/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "MMAStageLines.h"

@implementation MMAStageLines


-(void)doTouch:(NSSet* )touches
{
    UITouch* touch = [touches allObjects][0];
 
    CGPoint location = [touch locationInView:self];
    [self.lines lastObject][@"points"][1] = [NSValue valueWithCGPoint:location];
    [self setNeedsDisplay];

}


@end
