//
//  MMAAppDelegate.m
//  NewApp
//
//  Created by Jeff King on 4/14/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "MMAAppDelegate.h"
#import "MMAViewController.h"

@implementation MMAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //[[MMAViewController alloc] init];code line 1st
    //MMAViewController alloc = instance, then this
    //[instance init] = setup, and then this
    
    
    
    self.window.rootViewController = [[MMAViewController alloc] initWithNibName:nil bundle:nil];
    
    
    
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
