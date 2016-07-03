//
//  PlayViewController.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/17/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayViewController.h"

@implementation PlayViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HalMoved:) name:@"HalMoved" object:nil];
    
    screenSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [self establishGestures];
    
    CGSize border = CGSizeMake(70, 70);
    gridView = [[TheGridView alloc] initWithFrame:CGRectMake(border.width, border.height, screenSize.width - 2*border.width, screenSize.height - 2*border.height)];
    [self.view addSubview:gridView];
    
    //MAKE GRID OF SOME SIZE (WIDTH X HEIGHT)
    [gridView drawGridOfSize:CGSizeMake(6,20)];
    
    NSLog(@"oring X:%f Y:%f width:%f height:%f", gridView.frame.origin.x, gridView.frame.origin.y, gridView.frame.size.width, gridView.frame.size.height);
    
    CGSize tileSize = CGSizeMake(40, 40);
    
    CGPoint tileOrigin = CGPointMake(gridView.frame.origin.x + [gridView getGridTileSize].width*[gridView getGridSize].width/2 - tileSize.width, gridView.frame.origin.y - tileSize.height - 3);
    
    NSLog(@"scorebaord origin X:%f Y:%f",tileOrigin.x,tileOrigin.y);
    
    CGRect frame = CGRectMake(tileOrigin.x, tileOrigin.y, tileSize.width*2, tileSize.width*2);
    scoreboardView = [[TheScoreboardView alloc] initWithFrame:frame];
    [self.view addSubview:scoreboardView];
    
    [scoreboardView drawScoreBoardAboveGrid:gridView];

    
    tileArray = [[NSMutableArray alloc] initWithArray:[gridView getTileArray]];
    
    //SET HOME BASE FOR PLAYER
    [[tileArray objectAtIndex:[gridView getGridSize].width/2] setAffiliation:1];
    [[tileArray objectAtIndex:[gridView getGridSize].width/2] fillTile];
    
    //SET HOME BASE FOR HAL
    [[tileArray objectAtIndex:[tileArray count] - [gridView getGridSize].width/2] setAffiliation:2];
    [[tileArray objectAtIndex:[tileArray count] - [gridView getGridSize].width/2] fillTile];
    
    //load HAL into gameplay
    hal = [[Hal alloc] initWithGrid:gridView andFirstPieceIndex:[tileArray count] - [gridView getGridSize].width/2];
    
    userPieces = [[NSMutableArray alloc] init];
    [userPieces addObject:[NSNumber numberWithInteger:[gridView getGridSize].width/2]];
}



-(void)HalMoved:(NSNotification*)notification
{
    [self.view addGestureRecognizer:singleTap];
    [scoreboardView setHalScore:[[hal getPieces] count]];
    
    //stop loading animation
    //notify player can move
}

#pragma mark - Interface
-(void)didSingleTap:(UITapGestureRecognizer *)aSingleTap
{
    CGPoint touchPoint = [aSingleTap locationInView:self.view];
    
    NSLog(@"%f,%f",touchPoint.x,touchPoint.y);
    
    for (int i = 0; i < [[gridView getTileArray] count]; i++)
    {
        Tile* aTile = [[gridView getTileArray] objectAtIndex:i];
        
        CGRect arect = [aTile getRect];
        CGRect gridRect = gridView.frame;
        
        arect.origin.x = arect.origin.x + gridRect.origin.x;
        arect.origin.y = arect.origin.y + gridRect.origin.y;
        
        if(CGRectContainsPoint(arect, touchPoint) )
        {
            [userPieces addObject:[NSNumber numberWithInteger:i]];
            NSLog(@"%d",i);
            [aTile setAffiliation:1];
            [aTile fillTile];
            [self.view removeGestureRecognizer:singleTap];
            
//           dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            [hal moveAgainstUser:userPieces];
//           });
            break;
        }
    }
}

//if this does not pass, then we chill
-(BOOL)checkrules:(int)i
{
    BOOL fair;
    
    if (((i + 1) % (int)[gridView getGridSize].width) == 0)
    {
        NSLog(@"right edge");
    }
    else if((i % (int)[gridView getGridSize].width ) == 0)
    {
        NSLog(@"Left Edge");
    }
    
    if(i < [gridView getGridSize].width)
    {
        NSLog(@"Top Edge");
    }
    else if(i >= [gridView getGridSize].width*([gridView getGridSize].height-1))
    {
        NSLog(@"Bootom Edge");
    }
    
    return fair;
    
}

-(void)establishGestures
{
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSingleTap:)];
    singleTap.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:singleTap];
}


@end
