//
//  AppDelegate.m
//  Car
//
//  Created by Jeff King on 4/1/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "AppDelegate.h"
#import "Car Root View Controller.h"


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
   
    Car_Root_View_Controller *carvc = [[Car_Root_View_Controller alloc] init];
    
    self.window.rootViewController = carvc;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

   
@end
