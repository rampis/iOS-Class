//
//  SCGCircle.m
//  Squares
//
//  Created by Jeff King on 4/11/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "SCGCircle.h"

@implementation SCGCircle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor lightGrayColor] set];
    float dotXY = (self.frame.size.width -20) /2;
    CGContextAddEllipseInRect(context, CGRectMake(dotXY, dotXY, 20, 20));
    CGContextFillPath(context);
 
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"my position is %d",self.position);
    
}

@end
