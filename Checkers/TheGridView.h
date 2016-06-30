//
//  TheGridView.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/28/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewMaster.h"
#import "Tile.h"

@interface TheGridView : ViewMaster
{
    NSMutableArray* arrayOfTiles;
    CGSize gridSize;
}

-(void)drawGridOfSize:(CGSize)sizeInit;
-(NSMutableArray*)getTileArray;

@end
