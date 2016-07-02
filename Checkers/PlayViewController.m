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
    [gridView drawGridOfSize:CGSizeMake(5,10)];
    
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
        [userPieces addObject:[NSNumber numberWithInteger:i]];
        
        CGRect arect = [aTile getRect];
        CGRect gridRect = gridView.frame;
        
        arect.origin.x = arect.origin.x + gridRect.origin.x;
        arect.origin.y = arect.origin.y + gridRect.origin.y;
        
        if(CGRectContainsPoint(arect, touchPoint) )
        {
            NSLog(@"%d",i);
            [aTile setAffiliation:1];
            [aTile fillTile];
            [self.view removeGestureRecognizer:singleTap];
            [hal moveAgainstUser:userPieces];
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
