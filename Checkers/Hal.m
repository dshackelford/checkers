//
//  Hal.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/30/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hal.h"

@implementation Hal

-(id)initWithGrid:(TheGridView*)gridInit andFirstPieceIndex:(double)pieceIndexInit
{
    self = [super init];
    
    theGridView = gridInit;
    
    gridTiles = [[NSMutableArray alloc] initWithArray:[theGridView getTileArray]];
    
    pieces = [[NSMutableArray alloc] init];
    
    playerPieces = [[NSMutableArray alloc] init];
    
    [pieces addObject:[NSNumber numberWithDouble:pieceIndexInit]];
    
    return self;
}

-(void)move
{
    //ask for what pieces are already played
    NSMutableArray* currentGridLayout = [[NSMutableArray alloc] initWithArray:[theGridView getTileArray]];

    NSMutableArray* optionalIndexes = [self findAvailableIndexesInGrid:currentGridLayout];
    
    double i = arc4random()%[optionalIndexes count];
    
    double nextIndex = [[optionalIndexes objectAtIndex:i] doubleValue];
    
    NSLog(@"HAL: %f",nextIndex);
    
    Tile* nextTile = [currentGridLayout objectAtIndex:nextIndex];
    [pieces addObject:[NSNumber numberWithDouble:nextIndex]];
    [nextTile setAffiliation:2];
    [nextTile fillTile];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HalMoved" object:self];
    
    //check what i have already played
    //chose a spot to play
    //check to see if it passes the rules
    //make the move
}

-(NSMutableArray*)findAvailableIndexesInGrid:(NSMutableArray*)gridArrayInit
{
     double currentIndex = [[pieces lastObject] doubleValue];
    NSMutableArray* optionIndexes = [[NSMutableArray alloc] init];
    
    //shoule be one to the left
    if ([[gridArrayInit objectAtIndex:currentIndex - 1] getAffiliation] == 0)
    {
        [optionIndexes addObject:[NSNumber numberWithDouble:currentIndex - 1]];
    }
    
    if ([[gridArrayInit objectAtIndex:currentIndex + 1] getAffiliation] == 0)
    {
        [optionIndexes addObject:[NSNumber numberWithDouble:currentIndex - 1]];
    }
    
    if ([[gridArrayInit objectAtIndex:(currentIndex - [theGridView getGridSize].width)] getAffiliation] == 0)
    {
        [optionIndexes addObject:[NSNumber numberWithDouble:currentIndex - [theGridView getGridSize].width]];
    }
    
    return optionIndexes;
    
    //what about corner cases?
}

@end