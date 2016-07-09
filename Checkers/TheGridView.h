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
#import "Peon.h"

@interface TheGridView : ViewMaster
{
    NSMutableArray* arrayOfTiles;
    CGSize gridSize;
    CGSize tileSize;
    
}

-(void)drawGridOfSize:(CGSize)sizeInit;
-(NSMutableArray*)getTileArray;
-(CGSize)getGridSize;
-(CGSize)getGridTileSize;
-(CGSize)getGridTileSizeWithLineWidth;

@end
