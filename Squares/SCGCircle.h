//
//  SCGCircle.h
//  Squares
//
//  Created by Jeff King on 4/11/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCGCircleDelegate;

@interface SCGCircle : UIView

@property (nonatomic,assign) id<SCGCircleDelegate>delegate;

@property (nonatomic) CGPoint position;

@end

@protocol SCGCircleDelegate <NSObject>

-(UIColor *)circleTappedWithPosition:(CGPoint)position;

@end

