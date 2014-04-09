//
//  TDLTableViewCell.h
//  ToDoClass
//
//  Created by Jeff King on 4/8/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDLTableViewCell : UITableViewCell

@property (nonatomic) UILabel * nameLabel;
@property (nonatomic) UIView * bgView;
@property (nonatomic)UIView * strikeThrough;
@property (nonatomic) UIButton * circleButton;

-(void)showCircleButtons;
-(void)hideCircleButtons;

@end
