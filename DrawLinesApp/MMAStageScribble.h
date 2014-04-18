//
//  MMAStageScribble.h
//  DrawLinesApp
//
//  Created by Jeff King on 4/15/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MMAStageDelegate;
@interface MMAStageScribble : UIView


//@propery (nonatomic,assign) id<MMAStageDelegate> delgate;
@property (nonatomic) float lineWidth;
@property (nonatomic)UIColor * lineColor;
@property (nonatomic) NSMutableArray * lines;


-(void)clearStage;
-(void)undoStage;

@end
