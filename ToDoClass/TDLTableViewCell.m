//
//  TDLTableViewCell.m
//  ToDoClass
//
//  Created by Jeff King on 4/8/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "TDLTableViewCell.h"
#import "MOVE.h"

@implementation TDLTableViewCell
{
#pragma mark - globals
    UIButton * Button1;
    UIButton * Button2;
    UIButton * Button3;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
#pragma mark - self bgView, namelabel
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIView* bgView2  = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width-20,40)];
        bgView2.backgroundColor = [UIColor blackColor];
        bgView2.layer.cornerRadius = 6;
        bgView2.alpha = 0.9;
        [self.contentView addSubview:bgView2];
        
        self.bgView  = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width-20,40)];
        self.bgView.backgroundColor = [UIColor blueColor];
        self.bgView.layer.cornerRadius = 6;
        self.bgView.alpha = 0.9;
        
        [self.contentView addSubview:self.bgView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 50)];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont fontWithName:@"Helvetica" size:26];
        
        [self.bgView addSubview:self.nameLabel];
        
#pragma - mark strikethrough
        
        self.strikeThrough = [[UIView alloc] initWithFrame:CGRectMake(5, 22, self.frame.size.width - 30, 1)];
        
        self.strikeThrough.backgroundColor = [UIColor whiteColor];
        self.strikeThrough.alpha = 0;
        [self.bgView addSubview:self.strikeThrough];
        
        
        self.circleButton = [[UIButton alloc] initWithFrame: CGRectMake(self.frame.size.width - 50, 10, 20, 20)];
        self.circleButton.backgroundColor = [UIColor whiteColor];
        self.circleButton.layer .cornerRadius = 10;
        [self.bgView addSubview:self.circleButton];
    }
    
    return self;
    
}

-(void)resetLayout //*
{
    //if (self.swiped)
    //{
    //  [self createButtons];
    // }else {
    
    self.bgView.frame = CGRectMake(5, 22, self.frame.size.width - 30, 1);
    [Button1 removeFromSuperview];
    [Button2 removeFromSuperview];
    [Button3 removeFromSuperview];
    self.swiped = NO;
}

- (void)createButtons //*
{
    Button1 = [[UIButton alloc]initWithFrame:CGRectMake(200,15,30,30)];
    Button1.layer.cornerRadius = 15;
    Button1.backgroundColor = YELLOW_COLOR;
    [Button1 addTarget:self action:@selector(pressPriorityButton:) forControlEvents:
     UIControlEventTouchUpInside];
    [self.contentView addSubview:Button1];
    
    
    Button2 = [[UIButton alloc]initWithFrame:CGRectMake(240,15,30,30)];
    Button2.layer.cornerRadius = 15;
    Button2.backgroundColor = BLUE_COLOR;
    [Button2 addTarget:self action:@selector(pressPriorityButton:) forControlEvents:
     UIControlEventTouchUpInside];
    [self.contentView addSubview:Button2];
    
    Button3 = [[UIButton alloc]initWithFrame:CGRectMake(280,15,30,30)];
    Button3.layer.cornerRadius = 15;
    Button3.backgroundColor = GREEN_COLOR;
    [Button3 addTarget:self action:@selector(pressPriorityButton:) forControlEvents:
     UIControlEventTouchUpInside];
    [self.contentView addSubview:Button3];
    
}
-(void)pressPriorityButton:(id)sender
{
    UIButton * button = (UIButton *)sender;
    [self.delegate setItemPriority:(int)button.tag withItem:self];
}

-(void)showCircleButtons
{
    [self createButtons];
    
    [MOVE animateView:Button1 properties:@{@"alpha":@1,@"duration":@0.2, @"delay":@0.3}];
    [MOVE animateView:Button2 properties:@{@"alpha":@1,@"duration":@0.2, @"delay":@0.2}];
    [MOVE animateView:Button3 properties:@{@"alpha":@1,@"duration":@0.2, @"delay":@0.1}];

}

-(void)hideCircleButtons
{
    [MOVE animateView:Button1 properties:@{@"alpha":@0,@"duration":@0.0, @"delay":@0.1, @"remove":@YES}];
    [MOVE animateView:Button2 properties:@{@"alpha":@0,@"duration":@0.1, @"delay":@0.2, @"remove":@YES}];
    [MOVE animateView:Button3 properties:@{@"alpha":@0,@"duration":@0.2, @"delay":@0.3, @"remove":@YES}];
}

-(void)showDeleteButton
{
    Button3 = [[UIButton alloc]initWithFrame:CGRectMake(280,15,30,30)];
    Button3.alpha = 0;
    Button3.backgroundColor = GREEN_COLOR;
    Button3.layer.cornerRadius = 15;
    
    [Button3 addTarget:(self) action:@selector(pressDeleteButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:Button3];
    
    [MOVE animateView:Button3 properties:@{@"alpha":@1,@"duration":@0.2, @"delay":@0.3}];
}

-(void)pressDeleteButton
{
    [self.delegate deleteItem:self];
}

-(void)hideDeleteButton
{
    [MOVE animateView:Button3 properties:@{@"alpha":@1,@"duration":@0.2, @"delay":@0.3, @"remove":@YES}];
}

- (void)awakeFromNib
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}
@end

