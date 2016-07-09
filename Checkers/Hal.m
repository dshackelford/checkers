//
//  Hal.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/30/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hal.h"
#import "Hal+Refinement.h"

@implementation Hal

-(id)initWithGrid:(TheGridView*)gridInit andFirstPieceIndex:(double)pieceIndexInit
{
    self = [super init];
    
    theGridView = gridInit;
    
    gridTiles = [[NSMutableArray alloc] initWithArray:[theGridView getTileArray]];
    
    pieces = [[NSMutableArray alloc] init];
    
    playerPieces = [[NSMutableArray alloc] init];
    
    halEndzone = [[NSMutableArray alloc] init];
    
    return self;
}

-(void)moveAgainstUser:(NSMutableDictionary*)fieldDictionaryInit
{
    //GET HAL THE CURRENT LAYOUT OF THE BOARD
    playerPieces = [fieldDictionaryInit objectForKey:@"userPieces"];
    pieces = [fieldDictionaryInit objectForKey:@"halPieces"];
    halEndzone = [fieldDictionaryInit objectForKey:@"halEndzone"];
    
    NSMutableArray* optionalIndexes = [self findAllAvailableIndexes];
    
//    [self observeUser];
    
    if ([optionalIndexes count] > 0)
    {
        int i = arc4random()%[optionalIndexes count];
        int nextIndex = [[optionalIndexes objectAtIndex:i] integerValue];

        //TELL PLAYVIEWCONTROLLER THE INDEX HAL HAS CHOSEN
        [[NSNotificationCenter defaultCenter] postNotificationName:@"HalMoved" object:[NSNumber numberWithInt:nextIndex]];
    }
    else //there is no move to make without attacking ?!
    {
        NSLog(@"I can not move without attacking");
    }

}

-(NSMutableArray*)getPieces
{
    return pieces;
}

#pragma mark - Strategy
/*
 FUTURE STRATEGY
 - USER TACTIC DETECTION (TERRITORY GRAB OR LONGEST ROAD)
 - SHORTEST DISTANCE TO TILE
 -
 */
-(void)observeUser
{
    NSMutableArray* columnCountArray = [[NSMutableArray alloc] init];
    NSMutableArray* indexArray = [[NSMutableArray alloc] init];
    
    struct colDat {
        CGFloat count;
        CGFloat index;
    };
    typedef struct colDat colDat;
    
    //look at how many are in each colum
    for (int i = 0; i < [theGridView getGridSize].width; i++)
    {
        int count = 0;
        
        //grab a column, count how many in each column
        for (int j = 0; j <[theGridView getGridSize].height; j++)
        {
            int anIndex = i + j*[theGridView getGridSize].width;
            Tile* aTile = [[theGridView getTileArray] objectAtIndex:anIndex];
            
            if ([aTile getAffiliation] == 1)
            {
                count = count + 1;
            }
        }
        
        [columnCountArray addObject:[NSNumber numberWithInteger:count]];
        [indexArray addObject:[NSNumber numberWithInteger:i]];
    }
    
    NSMutableArray* orderedArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [columnCountArray count]; i++)
    {
        double maxVal = [[columnCountArray objectAtIndex:0] doubleValue];
        
        for (id obj in columnCountArray)
        {
            double aVal = [obj doubleValue];
            
            
            if ([orderedArray count] > 0)
            {
                if (aVal >= maxVal && aVal < [[orderedArray objectAtIndex:i -1] doubleValue])
                {
                    maxVal = aVal;
                }
            }
            
            else
            {
                if (aVal > maxVal)
                {
                    maxVal = aVal;
                }
            }
        }
        
        [orderedArray addObject:[NSNumber numberWithInteger:maxVal]];
    }

//    for (int i = 0; i < [orderedArray count]; i++)
//    {
//        <#statements#>
//    }
//    double maxCount = [self findMaxValInArray:columnCountArray];
    
 
    //not only the most in a column, but also where the fartherst point is
    
    //determine which side the user is playing
    //determine if they are linearly attacking
}

-(double)findMaxValInArray:(NSMutableArray*)arrayInit
{
    double maxVal = [[arrayInit objectAtIndex:0] doubleValue];
    
    for (id obj in arrayInit) {
        double aVal = [obj doubleValue];
        
        if (aVal > maxVal){
            maxVal = aVal;
        }
    }
    
    return maxVal;
}



@end