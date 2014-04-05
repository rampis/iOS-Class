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
        
    
    //self = [super initWithStyle:style];
    //if (self)
{
        
        NSArray * array=@[

        @{@"name" : @"Jisha Obukwelu",
        @"image" : [UIImage imageNamed:@"Jisha"],
        @"github" : @"https://github.com/Jiobu "
          },
        @{@"name" : @"Jon Fox",
        @"image" : [UIImage imageNamed:@"Jon"],
        @"github" : @"https://github.com/FoxJon "
          },
        @{@"name" : @"Austen Nolan",
        @"image" : [UIImage imageNamed:@"Austin"],
        @"github" : @"https://github.com/adnolan99 "
          },
        @{@"name" : @"Ali Houshmand",
        @"image" : [UIImage imageNamed:@"Ali"],
        @"github" : @"https://github.com/HoushmandA06 "
          },
        @{@"name" : @"Ed",
        @"image" : [UIImage imageNamed:@"Ed"],
        @"github" : @"https://github.com/MadArkitekt "
          },
        @{@"name" : @"Jeffrey Moulds",
        @"image" : [UIImage imageNamed:@"Jeffrey"],
        @"github" :@"https://github.com/jdmgithub "
          },
        @{@"name" : @"Savitha Reddy",
        @"image" : [UIImage imageNamed:@"Savitha"],
        @"github"   :@"https://github.com/savithareddy "
          },
        @{@"name" : @"Derek Weber",
        @"image" : [UIImage imageNamed:@"Derek"],
        @"github" : @"https://github.com/dweber03 "
          },
        @{@"name" : @"Ashby",
        @"image" : [UIImage imageNamed:@"Ashby"],
        @"github" : @"https://github.com/athornwell "
          },
          
        @{@"name" : @"Austen Johnson",
        @"image" : [UIImage imageNamed:@"Austen"],
        @"github" : @"https://github.com/ajohnson21 "
          },

        @{@"name" : @"Jeff King",
        @"image" : [UIImage imageNamed:@"Jeff"],
        @"github" : @"https://github.com/rampis"
          },

        @{@"name" : @"Heidi",
        @"image" : [UIImage imageNamed:@"Heidi"],
        @"github" : @"https://github.com/justagirlcoding"
          },

        @{@"name" : @"T.J. Mercer",
        @"image" : [UIImage imageNamed:@"T.J."],
        @"github" : @"https://github.com/gwanunig14"
          },

        @{@"name" : @"Teddy Conyers",
        @"image" : [UIImage imageNamed:@"Teddy"],
        @"github" : @"https//github.com/Conyers"
          },

        @{@"name" : @"John Yam",
        @"image" : [UIImage imageNamed:@"John"],
        @"github" : @"https://github.com/yamski"
          }

        ];
                
        listItems = [array mutableCopy];

        
        
//[listItems addObject:@{@{@"name" : @"John Yam",
                                // @"image" : [UIImage imageNamed:@"John"],
                               // @"github" : @"https://github.com/yamski"
//}];

    
        self.tableView.contentInset = UIEdgeInsetsMake(50,0,0,0);
        self.tableView.rowHeight = 100;
        
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake (0,0,320,100)];
        header.backgroundColor = [UIColor blueColor];
        self.tableView.tableHeaderView = header;
        
        
        //UILabel  * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(15,10,320, 30)];
        //titleHeader.text = @"Class Contacts";
        //titleHeader .textColor = [UIColor whiteColor];
        //[header addSubview:titleHeader];
        
        //UITextField * nameField = [[UITextField alloc] initWithFrame:CGRectMake(20,20,160,30)];
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20,20,160,30)];
        nameField.backgroundColor = [UIColor whiteColor];
        nameField.layer.cornerRadius = 6;
        //nameField.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0f blue:250/255.0f alpha:1.0f];
        //nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0. 0, 10, 30)];
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
    
   // NSLog(@"%@",username);
    
    
    
    //NSLog(@"click");
        
    [listItems addObject:
    @{@"name":username,
//    @"image" : [UIImage imageNamed:@"new_user"],
    @"github" : [NSString stringWithFormat:@"https://github.com/%@",username]}
    ];
    [nameField resignFirstResponder];
    [self.tableView reloadData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
    return YES;
}

    //-void)viewDidLoad
//{
   // [super viewDidLoad[]];
    


    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
    // Return the number of rows in the section.
    return [listItems count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
 
    
    
    if (cell == nil)
    {
        cell = [[TDLTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    
    //int index = [indexPath row];an instance with net property of row
    
//    NSInteger index = indexPath.row;
    
    //cell.textLabel.text = listItems[index];
    //cell.imageView.image = listImages[index];
    
//    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    
   // NSDictionary * listItem = [self getListItem:indexPath.row];
    
    cell.profileInfo = [self getListItem:indexPath.row];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSArray * reverseArray =

    NSDictionary * listItem = [self getListItem:indexPath.row];

    NSLog(@"%@",listItem);
}

- (NSDictionary *)getListItem:(NSInteger)row
{
    
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
}
    
    //I am want the NSArray of listItems to be a list of everyone's names within this class.


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
