//
//  Tire.m
//  Car
//
//  Created by Jeff King on 4/1/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "Tire.h"

@implementation Tire

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor darkGrayColor];
        self.layer.cornerRadius = 20;
    }
    return self;
}


@end
