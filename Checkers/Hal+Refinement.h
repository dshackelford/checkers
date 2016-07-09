//
//  Hal+Refinement.h
//  Checkers
//
//  Created by Dylan Shackelford on 7/8/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import "Hal.h"

@interface Hal (Refinement)
{
    
}

-(NSMutableArray*)findAllAvailableIndexes;
-(NSMutableArray*)findCrossIndexes:(int)anIndex;
-(NSMutableIndexSet*)checkEdgeCases:(int)indexInit;
-(NSMutableArray*)checkPotentialIndexsForAlreadyTaken:(NSMutableArray*)potentialIndexes;
-(NSMutableArray*)checkAllIndexes:(NSMutableArray*)potentialIndexes againstUserIndexes:(NSMutableArray*)userIndexes;

@end