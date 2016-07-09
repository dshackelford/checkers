//
//  Hal+Refinement.m
//  Checkers
//
//  Created by Dylan Shackelford on 7/8/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hal+Refinement.h"

@implementation Hal (Refinement)

/*FIND INDEXES FOR NEXT MOVE
 - CAN'T GO ACROSS EDGE OF BOARD
 - CAN'T CHOOSE A TILE ON ITSELF
 - CAN'T CHOOSE A USERS TILE (FOR NOW)
 */
-(NSMutableArray*)findAllAvailableIndexes
{
    NSMutableArray* allIndexes = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [pieces count]; i++)
    {
        int anIndex = [[pieces objectAtIndex:i] integerValue];
        
        NSMutableArray* crossIndex = [[NSMutableArray alloc] initWithArray:[self findCrossIndexes:anIndex]];
        
        NSMutableIndexSet* edgeCases = [[NSMutableIndexSet alloc] initWithIndexSet:[self checkEdgeCases:anIndex]];
        
        [crossIndex removeObjectsAtIndexes:edgeCases];
        
        [allIndexes addObjectsFromArray:crossIndex];
    }
    
    allIndexes = [self checkPotentialIndexsForAlreadyTaken:allIndexes];
    allIndexes = [self checkAllIndexes:allIndexes againstUserIndexes:playerPieces];
    
    return allIndexes;
}

//FIND INDEXES FOR INDEXES FOR CROSS TILES
-(NSMutableArray*)findCrossIndexes:(int)anIndex
{
    NSMutableArray* crossIndexes = [[NSMutableArray alloc] init];
    
    int rightIndex = anIndex + 1;
    [crossIndexes addObject:[NSNumber numberWithInteger:rightIndex]];
    
    int leftIndex = anIndex - 1;
    [crossIndexes addObject:[NSNumber numberWithInteger:leftIndex]];
    
    int topIndex = anIndex - [theGridView getGridSize].width;
    [crossIndexes addObject:[NSNumber numberWithInteger:topIndex]];
    
    int botIndex = anIndex + [theGridView getGridSize].width;
    [crossIndexes addObject:[NSNumber numberWithInteger:botIndex]];
    
    return crossIndexes;
    
}

//DETERMINE IF AN INDEX IS AN EDGE CASE SO THAT ITS NEXT MOVE IS LIMITED TO STAY INSIDE BOARD
-(NSMutableIndexSet*)checkEdgeCases:(int)indexInit
{
    NSMutableIndexSet* edgeCases = [[NSMutableIndexSet alloc] init];
    
    //for the right/left edge case
    if (((indexInit + 1) % (int)[theGridView getGridSize].width) == 0) //right
    {
        [edgeCases addIndex:0];
    }
    else if((indexInit % (int)[theGridView getGridSize].width ) == 0) //Left
    {
        [edgeCases addIndex:1];
    }
    
    if(indexInit < [theGridView getGridSize].width) //Top
    {
        [edgeCases addIndex:2];
    }
    else if(indexInit >= [theGridView getGridSize].width*([theGridView getGridSize].height-1)) //Bottom
    {
        [edgeCases addIndex:3];
    }
    
    return edgeCases;
}

//REMOVE OPTIONAL INDEXES FOR THOSE ALREADY TAKEN BY HAL AND ENDZONE
-(NSMutableArray*)checkPotentialIndexsForAlreadyTaken:(NSMutableArray*)potentialIndexes
{
    NSMutableIndexSet* indexesToDelete = [[NSMutableIndexSet alloc] init];
    
    for (int i = 0; i < [potentialIndexes count]; i ++)
    {
        for (int j = 0; j < [pieces count]; j++)
        {
            if ([pieces objectAtIndex:j] == [potentialIndexes objectAtIndex:i])
            {
                [indexesToDelete addIndex:i];
            }
        }
        
        for (int j = 0; j < [halEndzone count]; j++)
        {
            if ([halEndzone objectAtIndex:j] == [potentialIndexes objectAtIndex:i])
            {
                [indexesToDelete addIndex:i];
            }
        }
    }
    
    
    [potentialIndexes removeObjectsAtIndexes:indexesToDelete];
    return potentialIndexes;
}

//CHECK POTENTIAL INDEXES AGAINST USER PIECES
-(NSMutableArray*)checkAllIndexes:(NSMutableArray*)potentialIndexes againstUserIndexes:(NSMutableArray*)userIndexes
{
    NSMutableIndexSet* indexesToDelete = [[NSMutableIndexSet alloc] init];
    
    for (int i = 0; i < [potentialIndexes count]; i ++)
    {
        for (int j = 0; j < [userIndexes count]; j++)
        {
            if ([userIndexes objectAtIndex:j] == [potentialIndexes objectAtIndex:i])
            {
                [indexesToDelete addIndex:i];
            }
        }
    }
    
    [potentialIndexes removeObjectsAtIndexes:indexesToDelete];
    return potentialIndexes;
}


@end
