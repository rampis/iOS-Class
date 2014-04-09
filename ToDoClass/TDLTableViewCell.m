//
//  TDLTableViewCell.m
//  ToDoClass
//
//  Created by Jeff King on 4/8/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "TDLTableViewCell.h"

@implementation TDLTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
        
    }
    return self;
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
