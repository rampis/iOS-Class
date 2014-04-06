//
//  TDLTableViewController.m
//  ToDo
//
//  Created by Jeff King on 4/2/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"


@implementation TDLTableViewController



{
    NSMutableArray * listItems;
    UITextField * nameField;
    
}
//id is a wild card allows to pass any object

//- (id)initWithCoder:(NSCoder *)aDecoder

- (id)initWithStyle:(UITableViewStyle)style

{
self = [super initWithStyle:style];
    if (self)
        
{
        
        NSArray * array=@[

        @{@"name" : @"Jisha Obukwelu",@"image" : [UIImage imageNamed:@"Jisha"],@"github" : @"https://github.com/Jiobu "
          },
        @{@"name" : @"Jon Fox",@"image" : [UIImage imageNamed:@"Jon"],@"github" : @"https://github.com/FoxJon "
          },
        @{@"name" : @"Austen Nolan",@"image" : [UIImage imageNamed:@"Austin"],@"github" : @"https://github.com/adnolan99 "
          },
        @{@"name" : @"Ali Houshmand",@"image" : [UIImage imageNamed:@"Ali"],@"github" : @"https://github.com/HoushmandA06 "
          },
        @{@"name" : @"Ed Salter",@"image" : [UIImage imageNamed:@"Ed"],@"github" : @"https://github.com/MadArkitekt "
          },
        @{@"name" : @"Jeffrey Moulds",@"image" : [UIImage imageNamed:@"Jeffrey"],@"github" :@"https://github.com/jdmgithub "
          },
        @{@"name" : @"Savitha Reddy",@"image" : [UIImage imageNamed:@"Savitha"],@"github"   :@"https://github.com/savithareddy "
          },
        @{@"name" : @"Derek Weber",@"image" : [UIImage imageNamed:@"Derek"],@"github" : @"https://github.com/dweber03 "
          },
        @{@"name" : @"Ashby Ahornwell",@"image" : [UIImage imageNamed:@"Ashby"],@"github" : @"https://github.com/athornwell "
          },
        @{@"name" : @"Austen Johnson",@"image" : [UIImage imageNamed:@"Austen"],@"github" : @"https://github.com/ajohnson21 "
          },
        @{@"name" : @"Jeff King",@"image" : [UIImage imageNamed:@"Jeff"],@"github" : @"https://github.com/rampis"
          },
        @{@"name" : @"Heidi",@"image" : [UIImage imageNamed:@"Heidi"],@"github" : @"https://github.com/justagirlcoding"
          },
        @{@"name" : @"T.J. Mercer",@"image" : [UIImage imageNamed:@"T.J."],@"github" : @"https://github.com/gwanunig14"
          },
        @{@"name" : @"Teddy Conyers",@"image" : [UIImage imageNamed:@"Teddy"],@"github" : @"https//github.com/Conyers"
          },
        @{@"name" : @"John Yam",@"image" : [UIImage imageNamed:@"John"],@"github" : @"https://github.com/yamski"
          }

        ];
                
    listItems = [array mutableCopy];
    
    
        self.tableView.contentInset = UIEdgeInsetsMake(50,0,0,0);
        self.tableView.rowHeight = 100;
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
        
        submitButton.titleLabel.textColor = [UIColor blackColor];
    
        submitButton.backgroundColor = [UIColor whiteColor];
        submitButton.layer.cornerRadius = 6;
        [header addSubview:submitButton];
    
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(20,70, 280,30)];
        titleHeader.text = @"GITHUB USERS";

        titleHeader.textColor = [UIColor lightGrayColor];    titleHeader.font = [UIFont systemFontOfSize:26];
        [header addSubview:titleHeader];
    
    }
    return self;

}

- (void)newUser
{
    
    NSString * username = nameField.text;
    
    nameField.text = @"";
    
    [listItems addObject:
    @{@"name":username,
    @"github" : [NSString stringWithFormat:@"https://github.com/%@",username]}
    ];
    [nameField resignFirstResponder];
    [self.tableView reloadData];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    
    
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

    NSLog(@"%@",listItem);
}

- (NSDictionary *)getListItem:(NSInteger)row

{
    
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
}


@end
