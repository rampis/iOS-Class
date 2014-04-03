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
    NSArray *listItems;
    NSArray *listImages;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
       // NSDictionary * listExample = [NSDictionary alloc] initWithObjects:@"King Jeff"]
//forkeys:@[@"name"]];)
        
       // NSDictionary * list = @{


listItems = @[
            @{@"name" : @"Jisha Obukwelu", @"image" : [UIImage imageNamed:@"Jisha"]},
            @{@"name" : @"Jon Fox", @"image" : [UIImage imageNamed:@"Jon"]},
            @{@"name" : @"Austen Nolan", @"image" : [UIImage imageNamed:@"Austin"]},
            @{@"name" : @"Ali Houshmand", @"image" : [UIImage imageNamed:@"Ali"]},
            @{@"name" : @"Ed", @"image" : [UIImage imageNamed:@"Ed"]},
            @{@"name" : @"Jeffrey Moulds", @"image" : [UIImage imageNamed:@"Jeffrey"]},
            @{@"name" : @"Savitha Reddy", @"image" : [UIImage imageNamed:@"Savitha"]},
            @{@"name" : @"Derek Weber", @"image" : [UIImage imageNamed:@"Derek"]},
            @{@"name" : @"Ashby", @"image" : [UIImage imageNamed:@"Ashby"]},
            @{@"name" : @"Austen Johnson", @"image" : [UIImage imageNamed:@"Austen"]},
            @{@"name" : @"Jeff King", @"image" : [UIImage imageNamed:@"Jeff"]},
            @{@"name" : @"Heidi", @"image" : [UIImage imageNamed:@"Heidi"]},
            @{@"name" : @"T.J. Mercer", @"image" : [UIImage imageNamed:@"T.J."]},
            @{@"name" : @"Teddy Conyers", @"image" : [UIImage imageNamed:@"Teddy"]},
            @{@"name" : @"John Yam", @"image" : [UIImage imageNamed:@"John"]},
            ];

       // listItems = [[[NSArray] alloc] initWithObjects:@"Monday",@"Tuesday",@"Wednesday",nil];]
        
//       listItems = @[
//                      @"Jisha Obukwelu",
//                      @"Jon Fox",
//                      @"Austin Nolan",
//                      @"Ali Houshmand",
//                      @"Ed Salter",
//                      @"Jeffrey Moulds",
//                      @"Savitha Reddy",
//                      @"Derek Weber",
//                      @"Ashby",
//                      @"Austen Johnson",
//                      @"Jeff King",
//                      @"Heidi",
//                      @"T.J. Mercer",
//                      @"Teddy Conyers",
//                      @"John Yam",
//                      ];
//        listImages = @[
//                        [UIImage imageNamed:@""],
//                        [UIImage imageNamed:@"Jon"],
//                        [UIImage imageNamed:@"Austin"],
//                        [UIImage imageNamed:@"Ali"],
//                        [UIImage imageNamed:@"Ed"],
//                        [UIImage imageNamed:@"Jeffrey"],
//                        [UIImage imageNamed:@"Savitha"],
//                        [UIImage imageNamed:@"Derek"],
//                        [UIImage imageNamed:@"Ashby"],
//                        [UIImage imageNamed:@"Austen"],
//                        [UIImage imageNamed:@"Jeff"],
//                        [UIImage imageNamed:@"Heidi"],
//                        [UIImage imageNamed:@"TJ"],
//                        [UIImage imageNamed:@"Teddy"],
//                        [UIImage imageNamed:@"John"],
//                        
//                        ];
    
       // self.tableView.contentInset = UIEdgeInsetsMake(50,0,0,0);
        self.tableView.rowHeight = 100;
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake (0,0,320,50)];
        header.backgroundColor = [UIColor darkGrayColor];
        self.tableView.tableHeaderView = header;
        
        
        UILabel  * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(15,10,300, 30)];
        titleHeader.text = @"Class Contacts";
        titleHeader .textColor = [UIColor whiteColor];
        [header addSubview:titleHeader];
    
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

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
    
    NSInteger index = indexPath.row;
    
    //cell.textLabel.text = listItems[index];
    //cell.imageView.image = listImages[index];
    
    
    NSDictionary * listItem = listItems [index];
    
    cell.profileInfo = listItem;
                                 
    
   // cell.textLabel.text = listItem[@"name"];
   
    //[[cell.imageView.image = listItem[@"image"]];
    //setter  and getting image method
    
    return cell;
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
