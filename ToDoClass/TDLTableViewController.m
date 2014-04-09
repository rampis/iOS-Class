//
//  TDLTableViewController.m
//  ToDoClass
//
//  Created by Jeff King on 4/8/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "TDLTableViewController.h"

#import "TDLTableViewCell.h"

@implementation TDLTableViewController

{
NSMutableArray * listItems;
UITextField * nameField;
UINavigationController * navController;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

        listItems = [@[@"Workshop App",@"Go to Blogging"] mutableCopy];
    
    // Do any additional setup after loading the view.
    
        self.tableView.contentInset = UIEdgeInsetsMake(50,0,0,0);
        self.tableView.rowHeight = 50;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake (0,0,320,50)];
        header.backgroundColor = [UIColor whiteColor];
        self.tableView.tableHeaderView = header;
        
//        itemField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 160, 40)];
//        itemField.backgroundColor = [UIColor whiteColor];
//        [header addSubview:itemField];
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20,20,160,30)];
        nameField.placeholder = @"TO DO ITEMS";
        nameField.backgroundColor = [UIColor whiteColor];
        nameField.textAlignment = NSTextAlignmentLeft;
        nameField.font = [UIFont fontWithName:@"Arial" size:(22)];
        [header addSubview:nameField];
        
//       Buttons
         UIButton * Button1 = [[UIButton alloc]initWithFrame:CGRectMake(200,15,30,30)];
         Button1.layer.cornerRadius = 15;
         Button1.backgroundColor = [UIColor redColor];
         [Button1 addTarget:self action:@selector(Normal) forControlEvents:
         UIControlEventTouchUpInside];
         [header addSubview:Button1];
        
        UIButton * Button2 = [[UIButton alloc]initWithFrame:CGRectMake(240,15,30,30)];
        Button2.layer.cornerRadius = 15;
        Button2.backgroundColor = [UIColor blackColor];
        [Button2 addTarget:self action:@selector(Moderate) forControlEvents:
         UIControlEventTouchUpInside];
        [header addSubview:Button2];
        
        UIButton * Button3 = [[UIButton alloc]initWithFrame:CGRectMake(280,15,30,30)];
        Button3.layer.cornerRadius = 15;
        Button3.backgroundColor = [UIColor greenColor];
        [Button3 addTarget:self action:@selector(Urgent) forControlEvents:
         UIControlEventTouchUpInside];
        [header addSubview:Button3];
        
}
    return self;
}
-(void)Normal

{
    NSLog(@"Normal");
}

-(void)Moderate

{
    NSLog(@"Moderate");
}

-(void)Urgent

{
    NSLog(@"Urgent");
}

//- (void)newItem
//{
//    NSString * itemName = itemField.text;
//    itemField.text = @"";
//    NSLog(@"%@", itemName);
//}
//

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [listItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = listItems[indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

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
