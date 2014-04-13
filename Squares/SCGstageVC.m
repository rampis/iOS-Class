//
//  SCGstageVC.m
//  Squares
//
//  Created by Jeff King on 4/11/14.
//  Copyright (c) 2014 Media Mongoose. All rights reserved.
//

#import "SCGStageVC.h"

#import "SCGSquare.h"

@implementation SCGStageVC
{
    
    
    int gameSize;
    
    NSArray * playerColors;
    
    int playerTurn;
    
    NSMutableDictionary * tappedDots;
    
    NSMutableDictionary * allSquares;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initializatio]
        playerColors = @[BLUE_COLOR,ORANGE_COLOR];
        
        playerTurn = 0;
    
        tappedDots = [@{} mutableCopy];
       
        allSquares = [@{}mutableCopy];
        
    }
   
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    gameSize = 8;
    
    float circleWidth = SCREEN_WIDTH / gameSize;
    float squareWidth = circleWidth /2;
   
    
    //create squares
    for (int sRow = 0; sRow < gameSize -1; sRow++)
    {
        for (int sCol = 0; sCol < gameSize -1; sCol++)
        {
            float squareX = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sCol);
            float squareY = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sRow) + ((SCREEN_HEIGHT -
                SCREEN_WIDTH) / 2);
            SCGSquare * square = [[SCGSquare alloc] initWithFrame:CGRectMake (squareX, squareY, squareWidth, squareWidth)];
            square.backgroundColor = [UIColor lightGrayColor];
            
            NSString * key = [NSString stringWithFormat:@"c%dr%d",sCol,sRow];
            
            allSquares[key] = square;
            
            [self.view addSubview:square];
        }
    }
    
    //create circles
    for (int row = 0; row < gameSize; row++)
    {
        for (int col = 0; col < gameSize; col++)
        {
            float circleX = circleWidth * col;
            float circleY = (circleWidth * row) + ((SCREEN_HEIGHT - SCREEN_WIDTH) / 2);
            
            SCGCircle * circle = [[SCGCircle alloc] initWithFrame:CGRectMake(circleX, circleY,circleWidth,circleWidth)];
            circle.position = (CGPoint) {col,row};
            circle.delegate = self;
            
            NSString * key = [NSString stringWithFormat:@"c%dr%d",col,row];
            
            tappedDots[key] = @2;
            
            [self.view addSubview:circle];
        }
    }
    
//    for (float i = 0; i < gameSize * gameSize; i++)
//    {
//        NSLog(@"i = %f" ,i);
//        
//        float decimal = floor((i / gameSize) * 100) / 100.0;
//        
//        int row = floor(decimal);
//        //floor is a C funtion,i is what circle it is
//        
//        int col = ceil( (decimal - floorf(decimal) ) * gameSize);
//        
//        // 5/4 = 1.25       1.25-1 = .25    .25 * 4
//        
//        NSLog(@"i /gameSize = %f",i /gameSize);
//        
//        NSLog(@"i : %f --- row : %d --- col : %d",i,row,col);
//        
//        /////////////////////////////////
//        ////////////////////////////////
//        ////////////////////////////////
//        
//        
//        float circleX = circleWidth * col;
//        float circleY = (circleWidth * row) + ((SCREEN_HEIGHT - SCREEN_WIDTH) / 2);
//        
//        SCGCircle * circle = [[SCGCircle alloc] initWithFrame:CGRectMake(circleX, circleY,circleWidth,circleWidth)];
//        circle.position = (CGPoint) {col,row};
//        circle.delegate = self;
//        
//        NSString * key = [NSString stringWithFormat:@"c%dr%d",col,row];
//        
//        tappedDots[key] = @2;
//        
//        [self.view addSubview:circle]//
}

- (UIColor *) circleTappedWithPosition:(CGPoint)position
{
    //get tappedDots key from position
    NSString * key = [NSString stringWithFormat:@"c%dr%d",(int)position.x,(int)position.y];
    
    //set player num to value in TtappedDotsget tappedDots key from position
    tappedDots[key] = @(playerTurn);
    
    [self checkForSquareAroundPosition:position];
    
    UIColor * currentColor = playerColors[playerTurn];
    
    playerTurn =(playerTurn) ? 0 : 1;
   
    return currentColor;
    
}

-(void)checkForSquareAroundPosition:(CGPoint)position
{
    
    
    
    int pX = position.x;
    int pY = position.y;
    
    //  x - col and y = row
    BOOL above = (pY > 0);
    BOOL below = (pY < gameSize - 1);
    BOOL left = (pX > 0);
    BOOL right = (pX < gameSize - 1);
    
    if (above && left)//Came from HipChat
    {
        //check top left quadrant
        
        for (UIColor * color in playerColors) //playercolors array loop get the color value
        {
            int player = (int)[playerColors indexOfObject:color];// color has the value and assigned to player
            NSLog(@"player is %d",player);
            //from the position, check for reverse value ie top left is -1,-1, then right is 0,-1, left is -1,0 and current is 0,0
           
            NSString *topLeftDot = [NSString stringWithFormat:@"c%dr%d",pX-1,pY-1];// All dots are keys for dictionary
            NSString *topRightDot = [NSString stringWithFormat:@"c%dr%d",pX,pY-1];
            NSString *bottomLeftDot = [NSString stringWithFormat:@"c%dr%d",pX-1,pY];
            NSString *bottomRightDot = [NSString stringWithFormat:@"c%dr%d",pX,pY];
            
            BOOL topDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[topRightDot]]);
            //checks if top left and top right are the same
            
            BOOL bottomDotsSame = ([tappedDots[bottomLeftDot] isEqualToValue:tappedDots[bottomRightDot]]);
            //checks if bottom left and bottom right are the same
            
            BOOL leftDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[bottomLeftDot]]);
            //checks if top left and bottom left are the same
            
            //if top, left,botoms dots the same as player ... then they own square
            if(topDotsSame && bottomDotsSame && leftDotsSame && [tappedDots[topLeftDot] isEqual:@(player)])
            {
                SCGSquare * currentSquare = allSquares [topLeftDot];
                
                NSLog(@"%@" ,topLeftDot);
               
                currentSquare.backgroundColor = color;
                
                //player owns the square
            }
            
        }
        //end Hip Chat copy
        
//        NSString * topLef

    }
    
    if (above && right)
    {
    //check top right quadrant
    }
    if (below && left)
    {
    //check top bottom left quadrant
    }
    if (below && right)
    {
    //check bottom right quadrant
    }
}

- (BOOL)prefersStatusBarHidden {return YES;}

@end
