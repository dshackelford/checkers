//
//  PlayViewController+Setup.m
//  Checkers
//
//  Created by Dylan Shackelford on 7/7/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayViewController+Setup.h"

@implementation PlayViewController (Setup)

#pragma mark - Set Up View
-(void)setUpView
{
    [self addGrid];
    
    tileArray = [[NSMutableArray alloc] initWithArray:[gridView getTileArray]];
    
    [self addEndZones];
    
    [self addScoreBoard];
    
    [self addPieces];
    
    //LOAD HAL INTO GAMEPLAY
    hal = [[Hal alloc] initWithGrid:gridView andFirstPieceIndex:[tileArray count] - [gridView getGridSize].width/2];
}

-(void)addGrid
{
    CGSize border = CGSizeMake(40, 80);
    
    gridView = [[TheGridView alloc] initWithFrame:CGRectMake(border.width, border.height, screenSize.width - 2*border.width, screenSize.height - 2*border.height)];
    
    [self.view addSubview:gridView];
    
    //MAKE GRID OF SOME SIZE (WIDTH X HEIGHT)
    [gridView drawGridOfSize:CGSizeMake(7,15)];
}


-(void)addPieces
{
    for (int i = [gridView getGridSize].width; i < 2*[gridView getGridSize].width;i++ )
    {
        [[tileArray objectAtIndex:i] setAffiliation:1];
        [userPieces addObject:[NSNumber numberWithInteger:i]];
    }
    
    int end = [gridView getGridSize].width*[gridView getGridSize].height - [gridView getGridSize].width;
    int start = end - [gridView getGridSize].width;
    
    for (int i = start; i < end; i++)
    {
        [[tileArray objectAtIndex:i] setAffiliation:2];
        [halPieces addObject:[NSNumber numberWithInteger:i]];
    }
    
}

-(void)addEndZones
{
    //ADD THE ENDZONE LINES
    for (int i = 0; i < [gridView getGridSize].width;i++ )
    {
        [[tileArray objectAtIndex:i] setAffiliation:11]; //11
        [userEndzone addObject:[NSNumber numberWithInteger:i]];
    }
    
    int end = [gridView getGridSize].width*[gridView getGridSize].height;
    int start = end - [gridView getGridSize].width;
    for (int i = start; i < end; i++)
    {
        [[tileArray objectAtIndex:i] setAffiliation:22]; //22
        [halEndzone addObject:[NSNumber numberWithInteger:i]];
    }
}

-(void)addScoreBoard
{
    CGSize tileSize = CGSizeMake(40, 40);
    
    CGPoint tileOrigin = CGPointMake(gridView.frame.origin.x + [gridView getGridTileSizeWithLineWidth].width*[gridView getGridSize].width/2 - tileSize.width, gridView.frame.origin.y - tileSize.height - 6);
    
    NSLog(@"scorebaord origin X:%f Y:%f",tileOrigin.x,tileOrigin.y);
    
    CGRect frame = CGRectMake(tileOrigin.x, tileOrigin.y, tileSize.width*2, tileSize.width*2);
    scoreboardView = [[TheScoreboardView alloc] initWithFrame:frame];
    [self.view addSubview:scoreboardView];
    
    [scoreboardView drawScoreBoardAboveGrid:gridView];
}


@end