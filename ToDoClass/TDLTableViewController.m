//
//  TDLTableViewController.m
//  ToDoClass
//
//  Created by Jeff King on 4/8/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
// comment

#import "TDLTableViewController.h"
#import "MOVE.h"
#import "TDLTableViewCell.h"

@implementation TDLTableViewController

{
NSMutableArray * listItems;
UITextField * nameField;
//UINavigationController * navController;
NSArray * priorityColors;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        
priorityColors = @[RED_COLOR, YELLOW_COLOR, BLUE_COLOR, GREEN_COLOR];
        
        listItems = [@[
                      @{
                          @"name": @"Workshop App",
                          @"priority" :@3
                          },
                      @{@"name":@"Go To Blogging Thing", @"priority" :@2},
                      @{@"name":@"Learning Objective-C", @"priority" :@1},
                      @{@"name":@"Finish GitHub Appp", @"priority" :@0}
                                                         
                      ]mutableCopy];
    
        //self.tableView.contentInset = UIEdgeInsetsMake(50,0,0,0);
        self.tableView.rowHeight = 50;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake (0,0,320,50)];
        header.backgroundColor = [UIColor whiteColor];
        self.tableView.tableHeaderView = header;
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20,20,160,30)];
        nameField.placeholder = @"TO DO ITEMS";
        nameField.backgroundColor = [UIColor whiteColor];
        nameField.textAlignment = NSTextAlignmentLeft;
        nameField.font = [UIFont fontWithName:@"Arial" size:(22)];
        [header addSubview:nameField];

        UIButton * Button1 = [[UIButton alloc]initWithFrame:CGRectMake(200,15,30,30)];
        Button1.layer.cornerRadius = 15;
        Button1.backgroundColor = YELLOW_COLOR;
        [Button1 addTarget:self action:@selector(addNewListItem:) forControlEvents:
        UIControlEventTouchUpInside];
        [header addSubview:Button1];
        
        UIButton * Button2 = [[UIButton alloc]initWithFrame:CGRectMake(240,15,30,30)];
        Button2.layer.cornerRadius = 15;
        Button2.backgroundColor = BLUE_COLOR;
        [Button2 addTarget:self action:@selector(addNewListItem:) forControlEvents:
        UIControlEventTouchUpInside];
        [header addSubview:Button2];
    
        UIButton * Button3 = [[UIButton alloc]initWithFrame:CGRectMake(280,15,30,30)];
        Button3.layer.cornerRadius = 15;
        Button3.backgroundColor = GREEN_COLOR;
        [Button3 addTarget:self action:@selector(addNewListItem:) forControlEvents:
        UIControlEventTouchUpInside];
        [header addSubview:Button3];
    }
    
//New Version
   // UIButton * Button3 = [[UIButton alloc]initWithFrame:CGRectMake(280,15,30,30)];
    //Button3.layer.cornerRadius = 15;
    //Button3.backgroundColor = [UIColor greenColor];
    //[Button3 addTarget:self action:@selector((addNewListItem::) High)forControlEvents:
    // UIControlEventTouchUpInside];
    //[header addSubview:Button3];
    
//[self.tableView.tableHeaderView addSubview:highButton];

    return self;
}

-(void) addNewListItem:(id)sender
{

    UIButton * button = (UIButton *)sender;
    NSString * name = nameField.text;

    if (![name isEqualToString:@""])
    {
        [listItems insertObject:@{@"name":name, @"priority" : @(button.tag)} atIndex: 0];
    }

    [self.tableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [listItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if(cell == nil) cell =[[TDLTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.bgView.backgroundColor = priorityColors [[listItems[indexPath.row][@"priority"] intValue]];
    cell.nameLabel.text = listItems[indexPath.row][@"name"];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:swipeRight];
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{

    TDLTableViewCell *cell = (TDLTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    cell.bgView.backgroundColor = priorityColors[0];
    
    NSDictionary * updatelistItem = @{
    @"name" : listItems[indexPath.row][@"name"],
    @"priority" : @0
    };

}

-(void)swipeCell:(UISwipeGestureRecognizer *)gesture
{
    //NSLog(@"%@",gesture.direction);
    
    TDLTableViewCell * cell = (TDLTableViewCell *)gesture.view;
    
    switch (gesture.direction)
    {
        case 1: //right
            
            NSLog(@"swiping right");
            [MOVE animateView:cell.bgView properties:@{
                       @"x" : @10,
                       @"duration" : @0.5
                       }];
                                              
            break;
        case 2: //left
            NSLog(@"swiping left");
            [MOVE animateView:cell.bgView properties:@{@"x" : @-140,@"duration" : @0.5}];
            [cell showCircleButtons];
            break;
        default:
                  break;
    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end

