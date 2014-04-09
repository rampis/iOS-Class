//
//  TDLTableViewController.m
//  ToDo
//
//  Created by Jeff King on 4/2/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"
#import "TDLGitHubRequest.h"

@implementation TDLTableViewController

{
NSMutableArray * listItems;
UITextField * nameField;
UINavigationController * navController;
}
    - (void)toggleEdit
{
    self.tableView.editing = !self.tableView.editing;
}

 //id is a wild card allows to pass any object
//- (id)initWithCoder:(NSCoder *)aDecoder

    - (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
{
    
//UIWindow * window = UIApplication.sharedApplication.windows.firstObject;
//navController = (UINavigationController *)window.rootViewController;
        
    UIBarButtonItem * editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
    UIBarButtonSystemItemEdit target:self action:@selector(toggleEdit)];
    self.navigationItem.rightBarButtonItem = editButton;
    
        // listItems =[@[
                          
//                          @{@"name" : @"Jisha Obukwelu",@"image" : [UIImage imageNamed:@"Jisha"],@"github" : @"https://github.com/Jiobu"
//                            },
//                          @{@"name" : @"Jon Fox",@"image" : [UIImage imageNamed:@"Jon"],@"github" : @"https://github.com/FoxJon"
//                            },
//                          @{@"name" : @"Austen Nolan",@"image" : [UIImage imageNamed:@"Austin"],@"github" : @"https://github.com/adnolan99"
//                            },
//                          @{@"name" : @"Ali Houshmand",@"image" : [UIImage imageNamed:@"Ali"],@"github" : @"https://github.com/HoushmandA06"
//                            },
//                          @{@"name" : @"Ed Salter",@"image" : [UIImage imageNamed:@"Ed"],@"github" : @"https://github.com/MadArkitekt"
//                            },
//                          @{@"name" : @"Jeffrey Moulds",@"image" : [UIImage imageNamed:@"Jeffrey"],@"github" :@"https://github.com/jdmgithub"
//                            },
//                          @{@"name" : @"Savitha Reddy",@"image" : [UIImage imageNamed:@"Savitha"],@"github"   :@"https://github.com/savithareddy"
//                            },
//                          @{@"name" : @"Derek Weber",@"image" : [UIImage imageNamed:@"Derek"],@"github" : @"https://github.com/dweber03"
//                            },
//                          @{@"name" : @"Ashby Ahornwell",@"image" : [UIImage imageNamed:@"Ashby"],@"github" : @"https://github.com/athornwell"
//                            },
//                          @{@"name" : @"Austen Johnson",@"image" : [UIImage imageNamed:@"Austen"],@"github" : @"https://github.com/ajohnson21"
//                            },
//                          @{@"name" : @"Jeff King",@"image" : [UIImage imageNamed:@"Jeff"],@"github" : @"https://github.com/rampis"
//                            },
//                          @{@"name" : @"Heidi Proske",@"image" : [UIImage imageNamed:@"Heidi"],@"github" : @"https://github.com/justagirlcoding"
//                            },
//                          @{@"name" : @"T.J. Mercer",@"image" : [UIImage imageNamed:@"TJ"],@"github" : @"https://github.com/gwanunig14"
//                            },
//                          @{@"name" : @"Teddy Conyers",@"image" : [UIImage imageNamed:@"Teddy"],@"github" : @"https://github.com/talented76"
//                            },
//                          @{@"name" : @"John Yam",@"image" : [UIImage imageNamed:@"John"],@"github" : @"https://github.com/yamski"
//                            }
    
        
        
    listItems = [@[] mutableCopy];
    
    [self loadListItems];
    
//  @{
//                       @"name" : @"Jo Albright",
//                       @"image" : @"https://avatars.githubusercontent.com/u/1536630?",
//                       @"github" : @"https://github.com/joalbright"
//                       },
//                      @{
//                       @"name" : @"John Yam",
//                       @"image" : @"https://avatars1.githubusercontent.com/u/2688381?s=460",
//                       @"github" : @"https://github.com/yamski"
//                       },
//                      @{
//                        @"name" : @"Ali Housmand",
//                        @"image" : @"https://avatars1.githubusercontent.com/u/4575245?s=460",
//                        @"github" : @"https://github.com/  "
//                        },
//                      @{
//                        @"name" : @"Savitha Reddy",
//                         @"image" : @"https://avatars3.githubusercontent.com/u/7116131?s=460",
//                          @"github" : @"https://github.com/  "
//                          },
//                      @{
//                          @"name" : @"",
//                          @"image" : @"",
//                          @"github" : @"https://github.com/  "
//                          },
//                      @{
//                          @"name" : @"",
//                          @"image" : @"",
//                          @"github" : @"https://github.com/ "
//                          },
//                      @{
//                          @"name" : @" ",
//                          @"image" : @" ",
//                          @"github" : @"https://github.com/ "
//                          },
//                      @{
//                          @"name" : @"",
//                          @"image" : @" ",
//                          @"github" : @"https://github.com/ "
//                          },
//                      @{
//                          @"name" : @" ",
//                          @"image" : @"",
//                          @"github" : @"https://github.com/ "
//                          },
//                      @{
//                          @"name" : @"",
//                          @"image" : @" ",
//                          @"github" : @"https://github.com/ "
//                          },
//                      @{
//                          @"name" : @" ",
//                          @"image" : @"https:// ",
//                          @"github" : @"https://github.com/ "
//                          },
//                      @{
//                          @"name" : @" ",
//                          @"image" : @"https://  ",
//                          @"github" : @"https://github.com/yamski"
//                          },
//                      @{
//                          @"name" : @"John Yam",
//                          @"image" : @"https://avatars1.githubusercontent.com/u/2688381?s=460",
//                          @"github" : @"https://github.com/yamski"
//                          },
//                      @{
//                          @"name" : @"John Yam",
//                          @"image" : @"https://avatars1.githubusercontent.com/u/2688381?s=460",
//                          @"github" : @"https://github.com/yamski"
//                          },
//                      @{
//                          @"name" : @"John Yam",
//                          @"image" : @"https://avatars1.githubusercontent.com/u/2688381?s=460",
//                          @"github" : @"https://github.com/yamski"
//                          },
//                      
//                       ] mutableCopy];
//        
        self.tableView.contentInset = UIEdgeInsetsMake(50,0,0,0);
        self.tableView.rowHeight = 100;
        self.tableView.editing = YES;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake (0,0,320,100)];
        header.backgroundColor = [UIColor blueColor];
        self.tableView.tableHeaderView = header;
        
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20,20,160,30)];
        nameField.backgroundColor = [UIColor whiteColor];
        nameField.layer.cornerRadius = 6;
        nameField.leftViewMode = UITextFieldViewModeAlways;
        nameField.delegate = self;
        
        [header addSubview:nameField];
        
        
        UIButton * submitButton = [[UIButton alloc ]initWithFrame:CGRectMake(240,20,60,30)];
        [submitButton setTitle:@"New User" forState:UIControlStateNormal];
        [submitButton addTarget:(self) action:@selector (newUser) forControlEvents:
         UIControlEventTouchUpInside];
    
        [self.view addSubview:submitButton];
        
        submitButton.titleLabel.font = [UIFont systemFontOfSize:12];
        
        //submitButton.titleLabel.textColor = [UIColor darkTextColor];
        
        submitButton.backgroundColor = [UIColor darkTextColor];
        submitButton.layer.cornerRadius = 6;
        [header addSubview:submitButton];
        
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(20,70, 280,30)];
        titleHeader.text = @"GITHUB USERS";
        
        titleHeader.textColor = [UIColor lightGrayColor];titleHeader.font = [UIFont
        systemFontOfSize:26];
        [header addSubview:titleHeader];
        
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)newUser
{
        NSString * username = nameField.text;
        nameField.text = @"";
    
// [listItems addObject:
//   @{@"name":username,
// @"github" : [NSString stringWithFormat:@"https://github.com/%@",username]}
//];
    
    
    NSDictionary * userInfo = [TDLGitHubRequest getUserWithUserName: username];

    if([[userInfo allKeys] count] == 3)
    {
        [listItems addObject:userInfo];
        
    }else
    
    { NSLog(@"not enough data");
UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Bad Information" message:@"Unable to Add Use" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
    
    [alertView show];

}

    
    //[listItems addObject:userInfo];
    
    [nameField resignFirstResponder];
    [self.tableView reloadData];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self newUser];
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[TDLTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.profileInfo = [self getListItem:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * listItem = [self getListItem:indexPath.row];

    //  NSLog(@"%@",listItem);

    UIViewController * webController = [[UIViewController alloc] init];
    
    UIWebView * webView = [[UIWebView alloc] init];
    
    webController.view = webView;
    [self.navigationController pushViewController:webController animated:YES];
    
    //UIWindow * window = UIApplication.sharedApplication.windows.firstObject;
    //UINavigationController * navController = (UINavigationController *)window.rootViewController;
    
    [navController pushViewController: webController animated:YES];
    
    NSURL * url = [NSURL URLWithString:listItem [@"github"]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath

{
return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    // we will reverse the array objects here

    //NSDictionary:listItem = [self getlistItem:indexPath.row];
    
    [listItems removeObjectAtIndex:indexPath.row];

    //[self.tableView reloadData];
    
    TDLTableViewCell *cell = (TDLTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];cell.alpha = 0;
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    NSLog(@"%@", listItems);
    [self saveData];
    
    
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath

{
    return YES;
    

}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if (sourceIndexPath == destinationIndexPath) return;
    
    
    NSDictionary * sourceItem = [self getListItem:sourceIndexPath.row];
    
    NSDictionary * toItem = [self getListItem:destinationIndexPath.row];
    
    [listItems removeObjectIdenticalTo:sourceItem];
    
    [listItems insertObject:sourceItem atIndex:[listItems indexOfObject:toItem]];
    
    [self saveData];
    
    
}
- (void)saveData
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:listItems];
    [data writeToFile:path options:NSDataWritingAtomic error:nil];

}

- (NSString *)listArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = documentDirectories[0];
    return [documentDirectory stringByAppendingPathComponent:@"listdata.data"];
}
- (NSDictionary *)getListItem:(NSInteger)row
{
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
}

- (void)loadListItems
{
    NSString *path = [self listArchivePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
    listItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
}


@end











