//
//  MMAAppDelegate.m
//  DrawLinesApp
//
//  Created by Jeff King on 4/15/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "MMAAppDelegate.h"
#import "MMAViewController.h"
@implementation MMAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
   
    self.window.rootViewController = [[MMAViewController alloc] initWithNibName:nil bundle:nil];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
