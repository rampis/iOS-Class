//
//  TDLGitHubRequest.m
//  ToDo
//
//  Created by Jeff King on 4/7/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "TDLGitHubRequest.h"

@implementation TDLGitHubRequest

+ (NSDictionary *)getUserWithUserName:(NSString *)username
{
    NSMutableDictionary * userInfo = [@{}mutableCopy];
    
    NSString * github = [NSString stringWithFormat:@"https://api.github.com/user/%@", username ];
   NSURL * url = [NSURL URLWithString:github];
   
   NSURLRequest * request = [NSURLRequest requestWithURL:url];
//    
//    [NSURL Connection sendAsynchronousRequest:request queue:queue (NSOeratonQueue *)completionHandler:
//     
//     ^(NSURLResponse *response, NSData *data,NSError *connectionError) {code
//     if (conditionError == nil))
//     {
//     } else {
//             
//        NSLog([@"%@, connectionError);
//                    
//                    
//                    
//    }];
    
    
    NSURLResponse * response = nil;
    NSError * error = nil;
    
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request  returningResponse:&response error:&error];
                                                                  
    NSError * jsonError = nil;
                                                                  
    NSDictionary * githubProfile = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
    NSLog(@"%@",githubProfile);
    
    
//if(githubProfile[@"name"] != nil) [userInfo setObject:githubProfile[@"name"] forKey:@"name"];
//if(githubProfile[@"avatar"] != nil) [userInfo setObject:githubProfile[@"avatar"] forKey:@"image"];
//if(githubProfile[@"html_url"] != nil) [userInfo setObject:githubProfile[@"html_url"] forKey:@"github"];
    
if(githubProfile[@"name"] != nil) userInfo[@"name"] = githubProfile[@"name"];
if(githubProfile[@"avatar_url"] != nil) userInfo[@"avatar_url"] = githubProfile[@"image"];
if(githubProfile[@"html_url"] != nil) userInfo[@"html_url"] = githubProfile[@"github"];

    
        //userInfo = @{
        // @"name": githubProfile[@"name"],
        // @"image" : githubProfile[@"avatar_url"],
        // @"github" : githubProfile[@"html_url"]};


                 
    return userInfo;
}

@end
