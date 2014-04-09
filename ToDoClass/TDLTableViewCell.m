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


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
    
        self.bgView  = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width- 20,40)];
        self.bgView.layer.cornerRadius = 6;
        self.bgView.alpha = 0.9;
        
        [self.contentView addSubview:self.bgView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,  5, 200, 30)];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:26];
                
        [self.bgView addSubview:self.nameLabel];
        
        
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

-(void)showCircleButtons
{
    //put 3 UIButton code here.
    
    
    UIButton * Button1 = [[UIButton alloc]initWithFrame:CGRectMake(200,15,30,30)];
    Button1.layer.cornerRadius = 15;
    Button1.backgroundColor = YELLOW_COLOR;
//    [Button1 addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:Button1];
    
    UIButton * Button2 = [[UIButton alloc]initWithFrame:CGRectMake(240,15,30,30)];
    Button2.layer.cornerRadius = 15;
    Button2.backgroundColor = BLUE_COLOR;
//    [Button2 addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:Button2];
    
    UIButton * Button3 = [[UIButton alloc]initWithFrame:CGRectMake(280,15,30,30)];
    Button3.layer.cornerRadius = 15;
    Button3.backgroundColor = GREEN_COLOR;
//    [Button3 addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:Button3];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
