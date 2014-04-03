//
//  TDLAppDelegate.m
//  ToDo
//
//  Created by Jeff King on 4/2/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "TDLAppDelegate.h"
#import "TDLTableViewController.h"

@implementation TDLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    TDLTableViewController *tVC =[[TDLTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    self.window.rootViewController = tVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
