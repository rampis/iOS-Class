//
//  TDLTableViewCell.m
//  ToDo
//
//  Created by Jeff King on 4/3/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "TDLTableViewCell.h"

@implementation TDLTableViewCell

//@synthesize profileInfo=_profileInfo;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
    {
    
        
    }
    return self;
    
    
}


//- (NSDictionary *)profileInfo
    
//{
 //   if (_profileInfo ==nil)
  //  {
   //     _profileInfo = @{@"name": @"someone",@"image":[UIImage imageNamed:@"default"]};
    //}
        
    //return _profileInfo;
//}

-(void)setProfileInfo:(NSDictionary *)profileInfo
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    
    imageView.image = profileInfo[@"image"];
    imageView.layer.cornerRadius =30;
    imageView.layer.masksToBounds = YES;
    
    imageView.image = profileInfo[@"image"];
   [self.contentView addSubview:imageView];
    
    
    
    _profileInfo = profileInfo;
    
    //if(profileInfo != nil) _profileInfo = profileInfo;
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
