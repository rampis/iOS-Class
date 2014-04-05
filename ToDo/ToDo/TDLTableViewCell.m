//
//  TDLTableViewCell.m
//  ToDo
//
//  Created by Jeff King on 4/3/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "TDLTableViewCell.h"

@implementation TDLTableViewCell
{
    UIImageView * profileImage;
    UILabel * profileName;
    UILabel * profileURL;
}

//@synthesize profileInfo=_profileInfo;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
    {
        
        profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(20,20,60, 60)];
    
        profileImage.layer.cornerRadius = 30;
        profileImage.layer.masksToBounds = YES;
        
        [self.contentView addSubview:profileImage];

        profileName = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 200, 30)];
        
        [self.contentView addSubview:profileName];

        profileURL = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 290, 30)];
        
        [self.contentView addSubview:profileURL];
    
    
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
    
    profileImage.image = profileInfo[@"image"];
    profileName.text = profileInfo[@"name"];
    profileURL.text = profileInfo[@"github"];
    
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
