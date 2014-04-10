//
//  TDLTableViewController.m
//  ToDoClass
//
//  Created by Jeff King on 4/8/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
// comment

#import "TDLTableViewController.h"
#import "MOVE.h"

@interface TDLTableViewController ()

@end

@implementation TDLTableViewController
{//TODO rename bgView to something
    NSMutableArray * listItems;
    UITextField * nameField;
    NSArray * priorityColors;
    UIButton * Button1;
    UIButton * Button2;
    UIButton * Button3;
}

- (id)initWithStyle:(UITableViewStyle)style //*
{
    self = [super initWithStyle:style];
    if (self){
#pragma - mark
        
        priorityColors = @[RED_COLOR, YELLOW_COLOR, BLUE_COLOR, GREEN_COLOR];
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.rowHeight = 50;
        
        self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
        
        self.tableView.contentInset = UIEdgeInsetsMake(50,0,0,0);
        
        listItems = [@[
                       @{
                           @"name": @"Workshop App",
                           @"priority":@3
                           //@"constant":@3
                           },
                       @{@"name":@"Go To Blogging Thing", @"priority" :@2},
                       @{@"name":@"Learning Objective-C", @"priority" :@1},
                       @{@"name":@"Finish GitHub Appp", @"priority" :@0}
                       
                       ]mutableCopy];
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20,20,160,30)];
        nameField.placeholder = @"TO DO ITEMS";
        nameField.backgroundColor = [UIColor whiteColor];
        nameField.textAlignment = NSTextAlignmentLeft;
        nameField.font = [UIFont fontWithName:@"Arial" size:(22)];
        [self.tableView.tableHeaderView addSubview:nameField];
        
        Button1 = [[UIButton alloc]initWithFrame:CGRectMake(200,15,30,30)];
        Button1.layer.cornerRadius = 15;
        Button1.backgroundColor = YELLOW_COLOR;
        [Button1 addTarget:self action:@selector(addNewListItem:) forControlEvents:
         UIControlEventTouchUpInside];
        [self.tableView.tableHeaderView addSubview:Button1];
        
        Button2 = [[UIButton alloc]initWithFrame:CGRectMake(240,15,30,30)];
        Button2.layer.cornerRadius = 15;
        Button2.backgroundColor = BLUE_COLOR;
        [Button2 addTarget:self action:@selector(addNewListItem:) forControlEvents:
         UIControlEventTouchUpInside];
        [self.tableView.tableHeaderView addSubview:Button2];
        
        Button3 = [[UIButton alloc]initWithFrame:CGRectMake(280,15,30,30)];
        Button3.layer.cornerRadius = 15;
        Button3.backgroundColor = GREEN_COLOR;
        [Button3 addTarget:self action:@selector(addNewListItem:) forControlEvents:
         UIControlEventTouchUpInside];
        [self.tableView.tableHeaderView addSubview:Button3];
        
    }
    
    return self;
}
- (void)deleteItem:(TDLTableViewCell *)cell //*
{
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    
    [listItems removeObjectAtIndex:indexPath.row];
    
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

-(void)setItemPriority:(int)priority withItem:(TDLTableViewCell *)cell //*
{
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    NSDictionary * listItem = listItems[indexPath.row];
    NSDictionary * updateListItem = @{
                                      @"name":listItem[@"name"],
                                      @"priority":@(priority),
                                      @"constant":@(priority)
                                      };
    //remove old dictionary at cell
    [listItems removeObjectAtIndex:indexPath.row];
    
    //add new dictionary for cell
    [listItems insertObject:updateListItem atIndex:indexPath.row];
    
    cell.bgView.backgroundColor = priorityColors[priority];
    
    [MOVE animateView:cell.bgView properties:@{@"x":@10, @"duration":@0.5}];
    
    [cell hideCircleButtons];
    
    NSLog(@"Priorty : %d", priority);
}
- (BOOL)texFieldShouldreturn:(UITextField *) textField //*
{
    NSLog(@"Returned");
    
    [textField resignFirstResponder];
    
    return YES;
}


#pragma - mark

-(void) addNewListItem:(id)sender;
{
    UIButton * button = (UIButton *)sender;
    NSString * name = nameField.text;
    
    if (![name isEqualToString:@""])
    {
        [listItems insertObject:@{
                                  @"name":name,
                                  @"priority" : @(button.tag),
                                  @"constant" : @(button.tag)
                                  }
                        atIndex: 0];
    }
    
    nameField.text = @""; // clear text field
    [nameField resignFirstResponder]; // make keyboard go away
    NSLog(@"%@", sender);
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section //*
{
    // Return the number of rows in the section.
    return [listItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath //*
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
#pragma - mark set cell background to the done color
    
    if(cell == nil)
    {
        cell =[[TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell resetLayout];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.delegate = self;
    
    NSDictionary * listItem = listItems[indexPath.row];
    int currentPriority = [listItem[@"priority"] intValue];
    
    NSLog(@"For row %d, priority = %d", indexPath.row, currentPriority);
    cell.bgView.backgroundColor = priorityColors[currentPriority];
    
    if([listItem[@"priority"] intValue] == 0)
    {
        /*
         About variables
         int age;
         UIView redView;
         
         self.<variable> = <value>;
         self.age = 30;
         
         About methods (setters and getters)
         [<var> <method>];
         e.g. [ball throw]
         [<var> <method>:<value for parameter1>]
         e.g. [ball throw:100m]
         [<var>
         <methodNamePart1>:<value for parameter1>
         <methodNamePart2>:<value for parameter2>
         ]
         e.g. [ball throw:100m withSpeed:20]
         */
        cell.strikeThrough.alpha = 1;
        cell.circleButton.alpha = 0;
    }
    else
    {
        cell.strikeThrough.alpha = 0;
        cell.circleButton.alpha = 1;
    }
    
    cell.nameLabel.text = listItems[indexPath.row][@"name"];
    
#pragma - mark swipe
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:swipeRight];
    
    return cell;
}
#pragma - mark when touched

//everything happens here when cell is clicked
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath //*

{
    TDLTableViewCell *cell = (TDLTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
#pragma - mark set cell backgroundcolors
    
#pragma - dictionary
    
    NSDictionary * listItem = listItems[indexPath.row];
    
    NSDictionary * updatelistItem;
    int priority = [listItem[@"priority"] intValue];
    // 0, 1=low, 2, 3
    if(priority)
    {
        // i.e. this is a non-completed task
        // and user wants it marked as done!
        cell.bgView.backgroundColor = priorityColors[0];
        cell.strikeThrough.alpha = 1;
        cell.circleButton.alpha = 0;
        
        updatelistItem = @{@"name": listItem[@"name"],
                           @"priority":@(priority),
                           @"constant":@(priority)
                           };
    }
    else
    {
        // i.e. this is a Completed task
        // and user wants to UNSTRIKE
        // and mark it again as some sort of priority
        cell.bgView.backgroundColor = priorityColors[
                                                     [listItem[@"constant"]intValue]];
        cell.strikeThrough.alpha = 0;
        cell.circleButton.alpha = 1;
        
        updatelistItem = @{@"name": listItem[@"name"],
                           @"priority":@(priority),
                           @"constant":@(priority)
                           };
    }
    //remove old dictionary at cell
    [listItems removeObjectAtIndex:indexPath.row];
    
    //add new dictionary for cell
    
    [listItems insertObject:updatelistItem atIndex:indexPath.row];
    
    [self.tableView reloadData];
}
#pragma - mark void swipeCell

-(void)swipeCell:(UISwipeGestureRecognizer *)gesture
{
    TDLTableViewCell * cell = (TDLTableViewCell *)gesture.view;
    
    NSInteger index = [self.tableView indexPathForCell:cell].row;
    
    NSDictionary * listItem = listItems [index];
    
    // FOR EXPLAINATION ONLY BELOW
    //gesture.direction == left : 2
    //gesture.direction == right : 1
    //geture.direction == left && priority == 0 : 12
    //geture.direction == right && priority == 0 : 11
    
    // SWIPE LEFT TO RIGHT - do not add, comments only
    
    int completed;
    
    //if([listItem[@"priority"] intValue] == 0)
    //{
    //  completed = 1;
    //} else {
    //  completed = 0;
    //}
    
    completed = ([listItem[@"priority"] intValue] == 0) ? 10 :0;
    
    // cell = dictionary
    switch (gesture.direction + completed)
    
#pragma - mark cases
    
    switch (gesture.direction + (completed)){
        case 1: //right
            NSLog(@"swiping right");
            
            [MOVE animateView:cell.bgView properties:@{@"x" : @10,@"duration" : @0.5}];
            [cell hideCircleButtons];
            cell.swiped = NO;
            break;
            
        case 2: //left
            NSLog(@"swiping left");
            
            [MOVE animateView:cell.bgView properties:@{@"x" : @-140,@"duration" : @0.5}];
            [cell showCircleButtons];
            cell.swiped = YES;
            break;
            
        case 11: //left
            NSLog(@"swiping left");
            
            [MOVE animateView:cell.bgView properties:@{@"x" : @10,@"duration" : @0.5}];
            [cell showDeleteButton];
            cell.swiped = NO;
            break;
            
        case 12: //left
            //  NSLog(@"swiping left");
            
            [MOVE animateView:cell.bgView properties:@{@"x" : @-40,@"duration" : @0.5}];
            [cell showDeleteButton];
            cell.swiped = YES;
            break;
            
        default:
            break;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end

